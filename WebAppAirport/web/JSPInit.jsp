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
        .col
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
                <table>
                <caption>Votre caddie</caption>
                    <tr>
                        <thead>
                        <td class="col"><center>Ticket</center></td>
                        <td class="col"><center>Vols</center></td>
                        <td class="col"><center>Client</center></td>
                        <td class="col"><center> payer ?</center></td>
                        <td class="col"><center>identifiant</center></td>
                        <td class="col"><center>destination</center></td>
                        </thead>
                    </tr>
                    <tbody>
                <% 
                    ResultSet rs = bdd.query("SELECT idTicket, idVols, idClient, payer, identifiant, destination FROM ticket NATURAL JOIN vols NATURAL JOIN  client WHERE payer like \"N\" AND idClient = "+hs.getAttribute("idClient")+";"); 
                    while(rs.next())
                    {
                    %>

                    <tr>
                        <%
                        for(int i=1; i<7;i++)
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
