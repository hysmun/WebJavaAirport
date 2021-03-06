<%-- 
    Document   : JSPCaddie
    Created on : 21-Nov-2017, 13:53:33
    Author     : 'Toine
--%>

<%@page import="database.utilities"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/LoginPageScrip.js">

        </script>

        <style type="text/css">
        table
        {
            border-collapse: collapse; /* Les bordures du tableau seront collées (plus joli) */
            table-layout: auto;
        }
        td
        {
            border: 1px solid black;
        }
        .destCol
        {
            width: 200px;
        }
        .dateCol
        {
            width: 200px;
        }
        </style>
    </head>
    <body>
        <% HttpSession hs = request.getSession(); %>
        <% 
            utilities bdd=null;
            try {
                     bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport");
                } catch (Exception e) {
                    %>
                    <h1>Base de donner non accessible</h1>
                    </body>
                    </html>
                <%
                }
             %>
        <% 
            try {
            if(! Boolean.parseBoolean(hs.getAttribute("Connecter").toString())) 
            {
                %>
                <h1>Vous n'etes pas connecter</h1>
                <form method="POST" action="index.html"> <P><input type="submit" value="Retour a la page d'acceuil"></P> </form> </body></html>
                <%
                return;
            }
            }
            catch(Exception e)
            {
                %>
                <h1>Vous n'etes pas connecter</h1>
                <form method="POST" action="index.html"><P><input type="submit" value="Retour a la page d'acceuil"></P> </form></body></html>
                <%
                return;
            }
        %>
        <h1>Bienvenue sur InpresAirport Caddie</h1>
        <%=hs.getAttribute("Identifiant")  %> <%=hs.getAttribute("idClient")%>
        <br>
        <br>
        <form method="POST" action="AddCaddieServlet">
        <table>
            <caption>Liste des vols disponible</caption>
            <tr>
                <thead>
                <td>    </td>
                <td class="destCol"><center>Destination</center></td>
                <td class="dateCol"><center>Heure d'arriver</center></td>
                <td class="dateCol"><center>Heure de départ</center></td>
                <td><center>Nombre de place total</center></td>
                <td><center>nombre de place restante</center></td>
                </thead>
            </tr>
            <tbody>
            <% ResultSet rs = bdd.query("SELECT * FROM vols"); 
            while(rs.next())
            {
            %>

            <tr>
                <td>
                    
                    Quant:<%=rs.getObject("idVols")%>
                    <input type="number" value="0" name="quantity<%=rs.getObject("idVols").toString()%>" min="0" max="<%=rs.getObject("nbrDispo")%>">
                </td>
                <%
                for(int i=2; i<7;i++)
                {
                %>
                <td>
                    <center><%= ""+rs.getObject(i)%></center>
                </td>
                <%
                }
                %>
            </tr>
            <%
            }
            %>
            </tbody>
        </table>
        
            <P><input type="submit" value="Ajouter au caddie"></P>
        </form>
        <form method="POST" action="JSPPay.jsp">
            <P><input type="submit" value="Passez au payement des tickets"></P>
        </form>
        <form method="POST" action="JSPInit.jsp">
            <P><input type="submit" value="Retour a la page d'acceuil"></P>
        </form>
    </body>
</html>
