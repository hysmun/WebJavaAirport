<%-- 
    Document   : JSPInit
    Created on : 21-Nov-2017, 13:53:03
    Author     : 'Toine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSPInit Page</title>
    </head>
    <body>
        <h1>Hello World! </h1>
        <%=request.getParameter("identifiant")   %> 
    </body>
</html>
