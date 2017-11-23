/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

//import oracle.jdbc.driver.OracleDriver;
import java.sql.*;
import javax.management.Query;
import static java.sql.ResultSet.CONCUR_READ_ONLY;
import static java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE;

/**
 *
 * @author 'Toine
 */
public class utilities {
    
    public static int ORACLE = 1;
    public static int SQL = 2;
    
    private int typeConnection;
    private String nameConnection;
    private String login;
    private String motdepasse;
    private Connection con;
    private Statement instruc;

//<editor-fold defaultstate="collapsed" desc="Ancienne version NE PAS UTILISEZ">
    public utilities(int ptype, String plogin, String pmotdepasse) throws ClassNotFoundException, Exception {
        String tmpCon;
        this.typeConnection = ptype;
        if(ptype == SQL)
        {
            nameConnection = "org.gjt.mm.mysql.Driver";
        }
        else if(ptype == ORACLE)
        {
            nameConnection = "oracle.jdbc.driver.OracleDriver";
        }
        else
        {
            throw new Exception("Erreur utilities");
        }
        Class.forName(nameConnection);
        login = plogin;
        // Test oracle
        login = "cb";
        motdepasse = pmotdepasse;
        motdepasse = "oracle";
        tmpCon = "jdbc:" + (ptype == SQL ? "mysql://localhost:5500/": "oracle:thin@localhost:2222:")+"BD_AIRPORT"; 
        con = DriverManager.getConnection(tmpCon, login, motdepasse);
        instruc =  con.createStatement();
    }
    //</editor-fold>
    
    public utilities(int ptype, String plogin, String pmotdepasse, String ip, int port, String nomBD) throws ClassNotFoundException, Exception {
        String tmpCon;
        this.typeConnection = ptype;
        if(ptype == SQL)
        {
            nameConnection = "org.gjt.mm.mysql.Driver";
        }
        else if(ptype == ORACLE)
        {
            nameConnection = "oracle.jdbc.driver.OracleDriver";
        }
        else
        {
            throw new Exception("Erreur utilities");
        }
        Class.forName(nameConnection);
        login = plogin;
        motdepasse = pmotdepasse;
        tmpCon = "jdbc:" + (ptype == SQL ? "mysql://"+ip+":"+port+"/": "oracle:thin:@//"+ip+":"+port+"/")+nomBD;
        con = DriverManager.getConnection(tmpCon, login, motdepasse);
        instruc =  con.createStatement(TYPE_SCROLL_INSENSITIVE, CONCUR_READ_ONLY);
    }
    
    public ResultSet query(String pquery) throws SQLException
    {
        return instruc.executeQuery(pquery);
    }
    
    public int update(String pupdate) throws SQLException
    {
        return instruc.executeUpdate(pupdate);
    }
    
    public boolean execute(String pupdate) throws SQLException
    {
        return instruc.execute(pupdate);
    }
    
    //<editor-fold defaultstate="collapsed" desc="Getter">
    public String getNameConnection() {
        return nameConnection;
    }
    
    public int getTypeConnection() {
        return typeConnection;
    }
    
    public String getLogin() {
        return login;
    }
    
    public String getMotdepasse() {
        return motdepasse;
    }
    
    public Connection getCon() {
        return con;
    }
//</editor-fold>
}
