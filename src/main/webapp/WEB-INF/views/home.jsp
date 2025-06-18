<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Stock Stream</title>
    </head>

    <body>
        <h1>📈 실시간 주식 정보</h1>

        <div id="stock-data"></div>

        <script>
            let eventSource = null;

            function connectSSE() {
                if (eventSource) return;
                eventSource = new EventSource("http://localhost:8080/sseTest/stocks/stream");

                eventSource.onopen = () => {
                    console.log("✅ SSE 연결됨");
                };

                eventSource.addEventListener("stock-update", (event) => {
                    const data = JSON.parse(event.data);
                    console.log("받은 데이터:", data);

                    const now = new Date().toLocaleTimeString();
                    document.querySelector("#stock-data").innerText = `[${now}] ${data.symbol}: $${data.price.toFixed(2)}`;
                });                

                eventSource.onerror = (e) => {
                    console.error("❌ SSE 오류:", e);
                    eventSource.close();
                    eventSource = null;
                    // 3초 후 재연결
                    setTimeout(connectSSE, 3000);
                };
            }

            function disconnectSSE() {
                if (eventSource) {
                    eventSource.close();
                    eventSource = null;
                    console.log("🔌 SSE 연결 해제됨");
                }
            }

            // 페이지 로드 시 연결
            window.addEventListener("load", connectSSE);

            // 페이지 이탈 시 연결 해제
            window.addEventListener("beforeunload", disconnectSSE);
        </script>
    </body>

    </html>