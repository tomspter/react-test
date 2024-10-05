import './App.css';
import {useEffect, useState} from "react";

function App() {
  const [data, setData] = useState([]);  // 用来存储API返回的数据
  const [loading, setLoading] = useState(true); // 用来控制加载状态

  // 使用 useEffect 来调用 API
  useEffect(() => {
    fetch('/api/ping')
        .then(response => response.json())  // 解析JSON响应
        .then(json => {
          setData(json);  // 将数据保存到 state 中
          setLoading(false);  // 完成加载
        })
        .catch(error => {
          console.error('Error fetching data:', error);  // 错误处理
          setLoading(false);
        });
  }, []);  // 空数组作为依赖项，表示只在组件挂载时调用一次

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
      <div className="App">
        <h1>Result</h1>
        <h2>{data['message']}</h2>
      </div>
  );
}

export default App;
