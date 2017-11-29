<%-- 
    Document   : JSPPay
    Created on : 21-Nov-2017, 13:53:54
    Author     : 'Toine
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page PAY</title>
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
        <h1>Bienvenue sur InpresAirport Pay</h1>
        <%=hs.getAttribute("Identifiant")  %> <%=hs.getAttribute("idClient")%>
        <table>
        <caption>Vous avez demandez ces tickets la</caption>
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
        <form method="POST" action="PayementServlet">
            <P>N° carte bancaire : <input type="text" name="identifiant" value="user" size=20></P>
            <P>Code carte bancaire : <input type="password" name="password" value="user" size=20></P>
            <P><input type="submit" value="Payer vos tickets"></P>
        </form>
        <form method="POST" action="JSPInit.jsp">
            <P><input type="submit" value="Retour a la page d'acceuil"></P>
        </form>
        <form method="POST" action="JSPCaddie.jsp">
            <P><input type="submit" value="Continuez les achats"></P>
        </form>
    </body>
</html>
