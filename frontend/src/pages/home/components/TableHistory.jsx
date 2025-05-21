import Record from "../../../asset/play.png";
import Note from "../../../asset/file text.png";
import Form from "../../../asset/pen new round.png";
// import dayjs from 'dayjs';
import React, { useEffect, useState } from "react";
import { Pagination } from "antd";
import "./TableHistory.scss";
import { useSelector } from "react-redux";
const TableHistory = ({ data }) => {
  const [current, setCurrent] = useState(1);
  const [pageSize, setPageSize] = useState(5);
  const [records, setRecords] = useState(data.records);

  const { time } = useSelector((states) => states.dashboard);
  const onChange = (page) => {
    setCurrent(page);
  };
  const handleChange = (event) => {
    const selectedOption = event.target.value;
    setPageSize(selectedOption);
    setCurrent(1);
  };

  useEffect(() => {
    const indexOfLastRecord = current * pageSize;
    const indexOfFirstRecord = indexOfLastRecord - pageSize;
    const Records = data.records.slice(indexOfFirstRecord, indexOfLastRecord);
    setRecords(Records);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pageSize, current]);
  useEffect(() => {
    if (time !== null) {
      const startDate = time[0];
      const endDate = time[1];
      if (startDate !== null && endDate !== null) {
        const startDateObject = new Date(startDate);
        const endDateObject = new Date(endDate);
        const timestampEnd = endDateObject.getTime();
        const timestampStart = startDateObject.getTime();
        const filltered = data.records.filter((record) => {
          const calldate = new Date(record.calldate).getTime();
          return calldate >= timestampStart && calldate <= timestampEnd;
        });
        const indexOfLastRecord = current * pageSize;
        const indexOfFirstRecord = indexOfLastRecord - pageSize;
        const Records = filltered.slice(
          indexOfFirstRecord,
          indexOfLastRecord
        );
        setRecords(Records);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [time, current,pageSize]);

  return (
    <div className="history">
      <table className="history-table">
        <thead>
          <tr className="history-header">
            <th style={{ width: 22 }}><span>#</span></th>
            <th style={{ width: 58 }}><span>Agent</span></th>
            <th style={{ width: 129 }}><span>Số điện thoại</span></th>
            <th style={{ width: 209 }}><span>Thời gian gọi</span></th>
            <th style={{ width: 98 }}><span>Trạng thái</span></th>
            <th style={{ width: 108 }}><span>File ghi âm</span></th>
            <th style={{ width: 74 }}><span>Ghi chú</span></th>
            <th style={{ width: 106 }}><span>Form nhập</span></th>
          </tr>
        </thead>
        <tbody>
          {records.map((record, index) => (
            <tr key={index}>
              <td><span>{record.stt}</span></td>
              <td><span>{record.agent}</span></td>
              <td><span>{record.mobile}</span></td>
              <td><span>{record.calldate}</span></td>
              <td><span>{record.status}</span></td>
              <td>
                <div className="history-img">
                  <img src={Record} alt="record" />
                </div>
              </td>
              <td>
                <div className="history-img">
                  <img src={Note} alt="Note" />
                </div>
              </td>
              <td>
                <div className="history-img">
                  <img src={Form} alt="Note" />
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="history-subTable">
        <p className="history-total">Có tổng: {data.total_records} bản ghi</p>
        <div className="history-paginate">
          <div className="history-select">
            <label htmlFor="number">Hiển thị</label>
            <select
              className="history-select1"
              name="number"
              id="number"
              value={pageSize}
              onChange={handleChange}
            >
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="15">15</option>
            </select>
            <label>bản ghi</label>
          </div>
          <div className="history-pagination">
            <Pagination
              current={current}
              onChange={onChange}
              pageSize={pageSize}
              total={data.total_page}
            />
          </div>
        </div>
      </div>
    </div>
  );
};
export default TableHistory;
