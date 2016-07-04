package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbUtil.JDBCsqlite;
import util.DBUtil;
import util.dataAccess.ConnectionManager;

@WebServlet("/Login") 
public class Login extends HttpServlet implements Servlet { 
	private static final long serialVersionUID = 1L; 
        
    /** 
     * @see HttpServlet#HttpServlet() 
     */ 
    public Login() { 
        super(); 


    } 
    Connection conn;
    String url = "jdbc:sqlite:D:/SRSDB.sqlite";
    @Override
    public void init() throws ServletException {
          super.init();
    try{
          Class.forName("org.sqlite.JDBC");
    }catch(ClassNotFoundException e){
       System.out.println(e);
    }
   }


	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		doPost(request,response); 
	} 


	/** 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
	 */ 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8"); 
		//PrintWriter out=response.getWriter();
		 // String result = "" ; 
		String StudentName = request.getParameter("StudentName"); 
		String password = request.getParameter("password"); 
	
		  /*try{
			    Class.forName("org.sqlite.JDBC") ;
			   }catch(ClassNotFoundException e){
			    e.printStackTrace() ;
			    System.out.println("Class Not Found Exception . ") ;
			   }*/
		  //String url ="jdbc:sqlite:D:/SRSDB.sqlite" ;
		   //Connection conn = null ;
		   //Statement stmt = null ;
		   //ResultSet rs = null ;
		   //DBUtil jdbc =  new DBUtil();
		
		  //PreparedStatement ps = null; 
	 		//conn = jdbc.conn;
	 		  try {
	 	         conn = DriverManager.getConnection("jdbc:sqlite:D:/SRSDB.sqlite");
	 	         Statement stmt = conn.createStatement(); // 获取Statement
	 	         String sql = "SELECT * FROM User WHERE UserName='" + StudentName
	 	    + "' AND Password='" + password + "'"; // 查询用户信息的SQL语句
	 	  ResultSet rs = stmt.executeQuery(sql); // 执行查询
	 	  if (rs.next()) { // 有数据库中存在该用户
	 	              //request.getSession().setAttribute("username", StudentName);
	 	              rs.close();
	 	              stmt.close();
	 	              conn.close();
	 	              response.sendRedirect("success.jsp");
	 	            }
	 	            else{
	 	               // message = "用户名或密码有误";
	 	                //request.getSession().setAttribute("message",message);
	 	                response.sendRedirect("login.jsp");
	 	             }
	 	    } catch (SQLException e) {
	 	       e.printStackTrace();
	 	      }
	 	    }
	 	  }
	 	 