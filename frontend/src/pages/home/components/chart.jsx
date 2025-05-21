import { PieChart, Pie } from "recharts";
import "./chart.scss";

const ChartsPage = () => {
  const data01 = [
    {
      name: "Answered",
      value: 30,
      fill: "#169DFF",
    },
    {
      name: "Missed",
      value: 20,
      fill: "#D12E2E",
    },

    {
      name: "Failed",
      value: 20,
      fill: "#B2F71E",
    },
    {
      name: "Busy",
      value: 30,
      fill: "#77E5E5",
    },
  ];
  const RADIAN = Math.PI / 180;
  const renderCustomizedLabel = ({
    cx,
    cy,
    midAngle,
    innerRadius,
    outerRadius,
    percent,
    index,
  }) => {
    const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
    const x = cx + radius * Math.cos(-midAngle * RADIAN);
    const y = cy + radius * Math.sin(-midAngle * RADIAN);

    return (
      <text
        x={x}
        y={y}
        fill="white"
        textAnchor={x > cx ? "start" : "end"}
        dominantBaseline="central"
      >
        {`${(percent * 100).toFixed(0)}%`}
      </text>
    );
  };
  return (
    <div className="chart">
      <div className="chart-title">Tỉ lệ cuộc gọi</div>
      <div className="chart-sub">
        <div className="chart-item">
          <div
            className="chart-point"
            style={{ backgroundColor: "#169DFF" }}
          ></div>
          <p>Miss</p>
        </div>
        <div className="chart-item">
          <div
            className="chart-point"
            style={{ backgroundColor: "#B2F71E" }}
          ></div>
          <p>Answered</p>
        </div>
        <div className="chart-item">
          <div
            className="chart-point"
            style={{ backgroundColor: "#D12E2E" }}
          ></div>
          <p>Failed</p>
        </div>
        <div className="chart-item">
          <div
            className="chart-point"
            style={{ backgroundColor: "#77E5E5" }}
          ></div>
          <p>Busy</p>
        </div>
      </div>

      <PieChart width={460} height={260}>
        <Pie
          data={data01}
          dataKey="value"
          nameKey="name"
          cx="50%"
          cy="50%"
          outerRadius={100}
          label={renderCustomizedLabel}
        />
      </PieChart>
    </div>
  );
};

export default ChartsPage;
