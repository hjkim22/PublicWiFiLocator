package com.wifi.publicwifilocator.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ApiExplorer {
    StringBuilder urlBuilder;

    public void buildURL(int startIdx, int endIdx) throws Exception {
        String encoding = "UTF-8";
        urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
        urlBuilder.append("/" + URLEncoder.encode("7941757045686a6534356c446e7449", encoding)); // 인증키
        urlBuilder.append("/" + URLEncoder.encode("json", encoding));
        urlBuilder.append("/" + URLEncoder.encode("TbPublicWifiInfo", encoding));
        urlBuilder.append("/" + URLEncoder.encode(String.valueOf(startIdx), encoding));
        urlBuilder.append("/" + URLEncoder.encode(String.valueOf(endIdx), encoding));
    }

    public StringBuilder getJson() throws IOException {
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json"); // 응답 타입 설정 > JSON 응답 기대
//        System.out.println("Response code: " + conn.getResponseCode()); // 응답 코드 확인용

        BufferedReader rd;
        // 서비스코드 정상 -> 200~300
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        return sb;
    }

    public int getTotalCount() throws Exception {
        buildURL(1, 1);
        StringBuilder sb = getJson();

        JsonObject jsonObject = (JsonObject) JsonParser.parseString(sb.toString());
        JsonObject data = (JsonObject) jsonObject.get("TbPublicWifiInfo");
        JsonElement totalCnt = data.get("list_total_count");

        return totalCnt.getAsInt();
    }

}