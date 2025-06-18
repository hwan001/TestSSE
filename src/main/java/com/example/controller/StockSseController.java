package com.example.controller;

import java.io.IOException;
import java.util.concurrent.Executors;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.example.dto.StockData;

@RestController
@RequestMapping("/stocks")
@CrossOrigin(origins = "*")
public class StockSseController {
    private final ObjectMapper objectMapper = new ObjectMapper();
    
    @GetMapping(value = "/stream", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter streamStocks() {
        SseEmitter emitter = new SseEmitter(0L); 
        Executors.newSingleThreadExecutor().submit(() -> {
            try {
                System.out.println("✅ SSE 연결 요청 수신됨");
                while (true) {
                    // 모의 주식 데이터 생성
                    StockData stock = new StockData("AAPL", 100 + Math.random() * 50);
                    String json = objectMapper.writeValueAsString(stock);  // ✅ JSON 변환
                    System.out.println("📤 전송 데이터: " + json);
    
                    emitter.send(SseEmitter.event()
                        .name("stock-update")
                        .data(json));
                        
                    Thread.sleep(1000);
                }
            } catch (IOException | InterruptedException e) {
                System.out.println("❌ SSE 오류: " + e.getMessage());
                emitter.completeWithError(e);
            }
        });

        return emitter;
    }
}
