/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AirportServlet;

import database.utilities;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 'Toine
 */
@WebServlet(name = "AddCaddieServlet", urlPatterns = {"/AddCaddieServlet"})
public class AddCaddieServlet extends HttpServlet {
    utilities bdd;
    ResultSet rs;
    int val;

    @Override
    public void init (ServletConfig config) throws ServletException
    {
        super.init(config);
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession httpSes;
            boolean connecter=false;
            httpSes = request.getSession();
            int quant;
            int idTicket;
            int idVols;
            int idClient = Integer.parseInt(httpSes.getAttribute("idClient").toString());
            
            LinkedList<Integer> li;
            li = new LinkedList<Integer>();
            try {
                bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport");
                System.out.println("BDD Access granted");
            } catch (Exception ex) {
                Logger.getLogger(LoginFormServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Achat effectue</h1>");
                
            
                rs = bdd.query("SELECT max(idTicket) from ticket");
                if(rs.next())
                    idTicket = Integer.parseInt(rs.getObject(1).toString());
                else
                    idTicket = 1;

                rs = bdd.query("SELECT * FROM vols");
                for(int i=0; rs.next(); i++)
                {
                    li.add(Integer.parseInt(rs.getObject("idVols").toString()));
                    out.println(""+li.get(i));
                }
                out.println("\n");
                for(int i=0; i<li.size(); i++)
                {    
                    //quant = 4;
                    idVols = li.get(i);
                    Object tmp = request.getParameter("quantity"+idVols);
                    if(tmp == null)
                        quant = Integer.parseInt("0");
                    else
                        quant = Integer.parseInt(tmp.toString());
                    out.println(""+quant);
                    bdd.update("UPDATE vols SET nbrDispo = nbrDispo-"+quant+" WHERE idVols = "+idVols);
                    for(int j=0; j<quant;j++)
                    {
                        bdd.update("INSERT INTO ticket(idTicket, idClient, idVols, payer) VALUES("+ ++idTicket +","+idClient+","+idVols+",'N')");
                    }
                }
                bdd.close();
            
                out.println("</body>");
                out.println("</html>");
                out.println("<form method=\"POST\" action=\"JSPCaddie.jsp\"><P><input type=\"submit\" value=\"Continuez les achats\"></P></form>");
                out.println("<form method=\"POST\" action=\"JSPPay.jsp\"><P><input type=\"submit\" value=\"proceder au payement\"></P></form>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddCaddieServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
