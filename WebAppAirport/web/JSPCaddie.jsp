<%-- 
    Document   : JSPCaddie
    Created on : 21-Nov-2017, 13:53:33
    Author     : 'Toine
--%>

<%@page import="database.utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% int idClient = Integer.parseInt(request.getAttribute("idClient").toString()); %>
        <% utilities bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport"); %>
        <h1>Bienvenue sur InpresAirport </h1>
        <%=request.getParameter("identifiant")  %> <%=""+idClient%>
    </body>
</html>
