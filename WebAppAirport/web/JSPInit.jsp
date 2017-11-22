<%-- 
    Document   : JSPInit
    Created on : 21-Nov-2017, 13:53:03
    Author     : 'Toine
--%>

<%@page import="database.utilities"%>
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
        <% int idClient = Integer.parseInt(request.getAttribute("idClient").toString()); %>
        <% utilities bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport"); %>
        <h1>Bienvenue sur InpresAirport </h1>
        <%=request.getParameter("identifiant")  %> <p><%=""+idClient%></p>
        <form method="POST" action="/JSPCaddie">
            <P><input type="submit" value="Acheter des Tickets"></P>
        </form>
    </body>
</html>
