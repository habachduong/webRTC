import * as sip from "sip.js";
import * as stateActions from "./actions/stateActions";
import * as requestActions from "./actions/requestActions";
import * as sessionStates from "./sessionStates";

let store;
let Answer;

export default class SipCaller {
  /**
   * @param  {Object} data
   * @param  {Object} data.store - The Redux store.
   */
  static init(data) {
    store = data.store;
    Answer = data.Answer;
  }

  constructor() {
    this._ua = null;
    this._init();
  }

  _init() {
    const { autoRegister } = store.getState().user;

    if (autoRegister) this.register();
  }

  // đăng ký Ua để nhận các yêu cầu đến
  register() {
    const { displayName, sipUri, password, outboundProxy } =
      store.getState().user;

    // This is inserted in config.js in index.html
    const iceServers = window.iceServers;
    const { autoReceived } = store.getState().appReduce;

    store.dispatch(stateActions.setRegisterInProgress());

    this._ua = new sip.UA({
      uri: sipUri,
      password: password,
      displayName: displayName,
      transportOptions: {
        wsServers: [outboundProxy],
        traceSip: false,
      },
      sessionDescriptionHandlerFactoryOptions: {
        peerConnectionOptions: {
          rtcConfiguration: {
            iceServers,
          },
        },
      },
    });
  

    if (autoReceived) {
      this._ua.on("invite", (session) => {
        session.accept();
        Answer()
      });
    }
    this._ua.on("registered", () => {
      store.dispatch(
        requestActions.notify({
          type: "success",
          text: "Successfully registered.",
        })
      );
      store.dispatch(
        stateActions.setRegistrationMessage({ registrationMessage: "Success" })
      );
      store.dispatch(stateActions.setRegistered({ registered: true }));
    });

    this._ua.on("registrationFailed", (response, cause) => {
      store.dispatch(
        requestActions.notify({
          type: "error",
          text: `Registration failed: ${cause}`,
        })
      );

      store.dispatch(
        stateActions.setRegistrationMessage({ registrationMessage: cause })
      );
      store.dispatch(stateActions.setRegistered({ registered: false }));
      // notify.success("Đăng nhập thất bại");
    });

    this._ua.on("unregistered", (response, cause) => {
      store.dispatch(
        requestActions.notify({
          text: `Unregistered: ${cause}`,
        })
      );

      store.dispatch(
        stateActions.setRegistrationMessage({ registrationMessage: cause })
      );
      store.dispatch(stateActions.setRegistered({ registered: false }));
    });

    this._ua.on("invite", (sipSession) => {
      store.dispatch(
        requestActions.notify({
          text: `Incoming call from: ${sipSession.remoteIdentity.uri.user}`,
        })
      );

      this._handleSession(sipSession, sessionStates.INCOMING);
    });
  }
  // hủy đăng ký Ua
  unRegister() {
    this._ua.unregister();
  }

  _handleSession(sipSession, direction) {
    const startTime = Date.now();

    sipSession.on("trackAdded", () => {
      const pc = sipSession.sessionDescriptionHandler.peerConnection;

      // Gets remote tracks
      const remoteStream = new MediaStream();

      pc.getReceivers().forEach((receiver) => {
        if (receiver.track) remoteStream.addTrack(receiver.track);
      });

      store.dispatch(
        stateActions.addRemoteStream({ sipSession, remoteStream })
      );

      // Gets local tracks
      const localStream = new MediaStream();

      pc.getSenders().forEach((sender) => {
        if (sender.track) localStream.addTrack(sender.track);
      });

      store.dispatch(stateActions.addLocalStream({ sipSession, localStream }));
    });

    sipSession.on("replaced", (newSipSession) => {
      this._handleSession(newSipSession, direction);
    });

    sipSession.on("referRequested", (context) => {
      // Outgoing REFER
      if (context instanceof sip.ReferClientContext) {
        context.on("referRequestAccepted", () => {
          store.dispatch(
            stateActions.setSessionState({
              sipSession,
              sessionState: sessionStates.REFER_REQUEST_ACCEPTED,
            })
          );
        });

        context.on("referRequestRejected", () => {
          store.dispatch(
            stateActions.setSessionState({
              sipSession,
              sessionState: sessionStates.REFER_REQUEST_REJECTED,
            })
          );
        });
      }

      // Incoming REFER
      if (context instanceof sip.ReferServerContext) {
        context.accept();
      }
    });

    sipSession.on("directionChanged", () => {
      const newDirection = sipSession.sessionDescriptionHandler.getDirection();
      console.log(newDirection);
    });

    sipSession.on("progress", (response) => {
      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.PROGRESS,
        })
      );
    });

    sipSession.on("accepted", (data) => {
      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.ACCEPTED,
        })
      );
    });

    sipSession.on("bye", (request) => {
      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.TERMINATED,
        })
      );
    });

    sipSession.on("cancel", () => {
      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.CANCELED,
        })
      );
    });

    sipSession.on("rejected", (response, cause) => {
      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.REJECTED,
        })
      );
    });

    sipSession.on("failed", (response, cause) => {
      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.FAILED,
        })
      );
    });

    sipSession.on("terminated", (message, cause) => {
      store.dispatch(
        requestActions.notify({
          text: `Call terminated: ${sipSession.remoteIdentity.uri.user}`,
        })
      );

      store.dispatch(
        stateActions.setSessionState({
          sipSession,
          sessionState: sessionStates.TERMINATED,
        })
      );

      const displayName =
        sipSession.remoteIdentity.displayName ||
        sipSession.remoteIdentity.uri.user;
      const sipUri = sipSession.remoteIdentity.uri.toString();

      store.dispatch(
        stateActions.addSessionToHistory({
          displayName,
          sipUri,
          startTime,
        })
      );

      setTimeout(() => {
        store.dispatch(stateActions.removeSession({ sipSession }));

        if (!store.getState().userStatus.currentSession) {
          const sessions = store.getState().sessions;

          if (sessions) {
            store.dispatch(
              stateActions.setCurrentSession({
                currentSession: Object.keys(sessions)[0],
              })
            );
          }
        }
      }, 3000);
    });

    store.dispatch(stateActions.addSession({ sipSession, direction }));
  }

  accept(sipSession) {
    const { videoEnabled } = store.getState().user;

    sipSession.accept({
      sessionDescriptionHandlerOptions: {
        constraints: {
          audio: true,
          video: videoEnabled,
        },
      },
    });
  }

  terminate(sipSession) {
    sipSession.terminate();
  }

  invite(sipUri, callerId) {
    const { videoEnabled } = store.getState().user;

    const sipSession = this._ua.invite(sipUri, {
      sessionDescriptionHandlerOptions: {
        constraints: {
          audio: true,
          video: videoEnabled,
        },
      },
      params: {
        fromDisplayName: callerId,
      },
    });

    this._handleSession(sipSession, sessionStates.OUTGOING);
    store.dispatch(
      stateActions.setCurrentSession({
        currentSession: sipSession.request.callId,
      })
    );
  }

  refer(sipSession, sipUri) {
    sipSession.refer(sipUri);
  }

  toggleMedia(sipSession, type, mute) {
    const callId = sipSession.request.callId;
    const remoteStream = store.getState().sessions[callId].remoteStream;

    if (!remoteStream) return;

    if (type === "audio") {
      remoteStream.getAudioTracks()[0].enabled = !mute;

      store.dispatch(
        stateActions.toggleRemoteAudio({
          sipSession,
        })
      );
    } else if (type === "video") {
      remoteStream.getVideoTracks()[0].enabled = !mute;

      store.dispatch(
        stateActions.toggleRemoteVideo({
          sipSession,
        })
      );
    } else {
      throw new Error("Unknown media type.");
    }
  }

  toggleMyMedia(session, type, mute) {
    if (type === "audio") {
      session.localStream.getAudioTracks()[0].enabled = !mute;
    } else if (type === "video") {
      session.localStream.getVideoTracks()[0].enabled = !mute;
    } else {
      throw new Error("Unknown media type.");
    }
  }
}
