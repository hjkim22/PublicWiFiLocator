<%@ page import="com.wifi.publicwifilocator.ApiExplorer" %>
<%@ page import="com.wifi.publicwifilocator.service.WifiService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ApiExplorer apiExplorer = new ApiExplorer();
  WifiService wifiService = new WifiService();
  int totalCnt = 0;
  boolean isFirst = true;

  try {
    totalCnt = apiExplorer.getTotalCount();
    if (!wifiService.saveWifiData()) {
      isFirst = false;
    }
  } catch (Exception e) {
    e.printStackTrace();
    isFirst = false;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>와이파이 정보 구하기</title>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<div class="container">
  <h1><%= isFirst ? totalCnt + "개의 WIFI 정보를 정상적으로 저장하였습니다." : "와이파이 정보가 이미 저장되어 있습니다." %></h1>
  <% if (!isFirst) { %>
  <p>데이터 저장 중 오류가 발생했습니다. 관리자에게 문의하세요.</p>
  <% } %>
  <a href="/">홈으로 가기</a>
</div>
</body>
</html>