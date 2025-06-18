// 예: stock.html 진입 시 실행
const eventSource = new EventSource('/stocks/stream');

eventSource.onmessage = (event) => {
  const data = JSON.parse(event.data);
  // 화면에 주식 정보 렌더링
  renderStockData(data);
};

eventSource.onerror = (error) => {
  console.error("SSE connection error:", error);
};
