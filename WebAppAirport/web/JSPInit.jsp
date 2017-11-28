<%-- 
    Document   : JSPInit
    Created on : 21-Nov-2017, 13:53:03
    Author     : 'Toine
--%>

<%@page import="java.sql.ResultSet"%>
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
        <% utilities bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport"); %>
        <% HttpSession hs = request.getSession(); %>
        <%
            if(Boolean.parseBoolean(hs.getAttribute("Connecter").toString()))
            {
                %>
                <h1>Bienvenue sur InpresAirport Init</h1>
                <%=hs.getAttribute("Identifiant")  %> <%=hs.getAttribute("idClient")%>
                <form method="POST" action="JSPCaddie.jsp">
                    <P><input type="submit" value="Acheter des Tickets"></P>
                </form>
                <form method="POST" action="JSPPay.jsp">
                    <P><input type="submit" value="Voir son caddie et payer"></P>
                </form>
                <%
            }
            else
            {
               %>
               <h1>Login FAILED</h1>
               <form method="POST" action="index.html">
                    <P><input type="submit" value="Retour au login"></P>
                </form>
               <%
            }
        %>
    </body>
</html>
