<%-- 
    Document   : JSPPay
    Created on : 21-Nov-2017, 13:53:54
    Author     : 'Toine
--%>

<%@page import="database.utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page PAY</title>
    </head>
    <body>
        <% HttpSession hs = request.getSession(); %>
        <% utilities bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport"); %>
        <h1>Bienvenue sur InpresAirport Pay</h1>
        <%=hs.getAttribute("Identifiant")  %> <%=hs.getAttribute("idClient")%>
        <form method="POST" action="JSPInit.jsp">
            <P><input type="submit" value="Retour a la page d'acceuil"></P>
        </form>
        <form method="POST" action="JSPCaddie.jsp">
            <P><input type="submit" value="Continuez les achats"></P>
        </form>
    </body>
</html>
