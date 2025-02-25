<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>COMP367 Application</title>
</head>
<body>
    <%
        LocalTime time = LocalTime.now();
        String greeting;
        
        if (time.getHour() < 12) {
            greeting = "Good morning";
        } else {
            greeting = "Good afternoon";
        }
    %>
    
    <h1><%= greeting %>, Landon, Welcome to COMP367</h1>
</body>
</html>
