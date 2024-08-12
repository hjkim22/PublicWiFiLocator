<%@ page import="com.wifi.publicwifilocator.service.WifiService" %>
<%@ page import="com.wifi.publicwifilocator.dto.WifiDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wifi.publicwifilocator.Pos" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    WifiService wifiService = new WifiService();

    double lat = Double.parseDouble(request.getParameter("lat"));
    double lnt = Double.parseDouble(request.getParameter("lnt"));

    ArrayList<WifiDto> list = new ArrayList<>();
    if (request.getParameter("lat") != null && request.getParameter("lnt") != null) {
        Pos pos = new Pos(lat, lnt);
        list = wifiService.getWifiList(pos);
    }

    session.setAttribute("list", list);
    response.sendRedirect("/?lat=" + lat + "&lnt=" + lnt);
%>