/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AirportServlet;

import database.utilities;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 'Toine
 */
public class LoginFormServlet extends HttpServlet {
    
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSes;
        boolean connecter=false;
        httpSes = request.getSession();
        
        try {
            bdd = new utilities(utilities.SQL,"user","toor","127.0.0.1", 5500, "bd_airport");
            out.println("BDD Access granted");
        } catch (Exception ex) {
            Logger.getLogger(LoginFormServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(request.getParameter("alreadySign")!= null && request.getParameter("alreadySign").equals("Sign") )
        {
            try {
                //verif du client
                rs = bdd.query("SELECT COUNT(*) FROM client WHERE identifiant LIKE ('"+request.getParameter("identifiant")+"') AND password LIKE ('"+request.getParameter("password")+"')");
                rs.next();
                val = rs.getInt(1);
                if(val == 1)
                {
                    connecter = true;
                    rs = bdd.query("SELECT idClient FROM client WHERE identifiant LIKE ('"+request.getParameter("identifiant")+"') AND password LIKE ('"+request.getParameter("password")+"')");
                    rs.next();
                    val = Integer.parseInt(rs.getString(1));
                }
                else
                    connecter = false;
            } catch (SQLException ex) {
                Logger.getLogger(LoginFormServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
        {
            try {
                //creation du client
                rs = bdd.query("SELECT MAX(idClient) FROM client");
                rs.next();
                val = Integer.parseInt(rs.getString(1));
                val++;
                bdd.update("INSERT INTO client(idClient,identifiant,password) VALUES("+val+",'"+request.getParameter("identifiant")+"','"+request.getParameter("password")+"')");
            } catch (SQLException ex) {
                Logger.getLogger(LoginFormServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            connecter = true;
        }
        try {
            bdd.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginFormServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(true)
        {
            httpSes.setAttribute("idClient", ""+val);
            httpSes.setAttribute("Connecter", connecter?"true":"false");
            httpSes.setAttribute("Identifiant", request.getParameter("identifiant"));
            httpSes.setAttribute("password", request.getParameter("password"));
            request.setAttribute("idClient", ""+val);
            ServletContext sc = this.getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/JSPInit.jsp");
        
            rd.forward(request, response);
        }
        else
        {
            ServletContext sc = this.getServletContext();
            httpSes.setAttribute("Connecter", "false");
            RequestDispatcher rd = sc.getRequestDispatcher("/JSPInit.jsp");
        
            rd.forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
