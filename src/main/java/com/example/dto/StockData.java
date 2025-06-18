package com.example.dto;

import lombok.Data;

@Data
public class StockData {
    private String symbol;
    private double price; 

    public StockData() {} 

    public StockData(String symbol, double price) {
        this.symbol = symbol;
        this.price = price;
    }
}

