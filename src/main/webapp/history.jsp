<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wifi.publicwifilocator.entity.LocationHistory" %>
<%@ page import="com.wifi.publicwifilocator.service.WifiService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    WifiService wifiService = new WifiService();
    ArrayList<LocationHistory> histories = wifiService.getHistory();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>위치 히스토리 목록</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<h1>위치 히스토리 목록</h1>
<div class="buttons">
    <a href="/">홈</a> |
    <a href="history.jsp">위치 히스토리 목록</a> |
    <a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a> |
    <a href="bookmark-list.jsp">북마크 보기</a> |
    <a href="bookmark-group.jsp">북마크 그룹 관리</a>
</div>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>X 좌표</th>
        <th>Y 좌표</th>
        <th>조회 일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <% if (histories.isEmpty()) { %>
    <tr>
        <td colspan="5" class="table_blank">히스토리 정보가 존재하지 않습니다.</td>
    </tr>
    <% } else {
        for (LocationHistory history : histories) { %>
    <tr>
        <td><%= history.getHistoryId() %></td>
        <td><%= history.getLnt() %></td>
        <td><%= history.getLat() %></td>
        <td><%= history.getSearchDate() %></td>
        <td style="text-align: center">
            <a href="delete-history.jsp?id=<%= history.getHistoryId() %>">
                <input type="button" value="삭제">
            </a>
        </td>
    </tr>
    <%   }
    } %>
    </tbody>
</table>
</body>
</html>