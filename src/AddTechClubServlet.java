import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addTechClub")
public class AddTechClubServlet extends HttpServlet {
	private int id = 0;
	public void increment() {
		++id;
	}
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String Classname = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String username = "ep";
		String password = "ep";
		increment();
		res.setContentType("text/html");
	    PrintWriter out = res.getWriter();
	    
	    try {
	      Connection con = null;
	      Class.forName(Classname);
	      con = DriverManager.getConnection(url, username, password);
	      
	      String path1 = "C:\\Images\\";
	      String insert = "insert into techclubs values(?,?,?,?,?)";
	      String select = "select name, des from techclubs where name=?";
	      
	      System.out.println("Hello 1");
	      
	      PreparedStatement pstmt = con.prepareStatement(insert);
	      PreparedStatement pstmt2 = con.prepareStatement(select);
	      
	      System.out.println("Hello 2");
	      
	      String category = "technical";
	      String name = req.getParameter("name").toLowerCase();
	      String desc = req.getParameter("des");
	      String imagepath = req.getParameter("img");
	      
	      System.out.println("Hello 3");
	      
	      String path=path1+imagepath;
	      File imagefile=new File(path);
	      FileInputStream fis=new FileInputStream(imagefile);
	      
	      System.out.println("Hello 4");
	      
	      pstmt.setInt(1, id);
	      pstmt.setString(2, name);
	      pstmt.setString(3, desc);
	      pstmt.setString(4, category);
	      pstmt.setBinaryStream(5, (InputStream)fis, (int)(imagefile.length()));
	      
	      System.out.println("Hello 5");
	      
	      pstmt2.setString(1, name);
	      
	      System.out.println("Hello 6");
	      
	      ResultSet rs = pstmt2.executeQuery();
	      
	      System.out.println("Hello 7");
	      
	      if(!rs.next()) {
	        int n = pstmt.executeUpdate();
	        if(n > 0) {
	  	      System.out.println("Hello 8");
	          RequestDispatcher rd = req.getRequestDispatcher("adminclub.jsp");
	          rd.include(req, res);
		      System.out.println("Hello 9");
	          out.println("<script>alert('Club Added Successfully')</script>");
	              }
	        else {
	  	      System.out.println("Hello 10");
	          RequestDispatcher rd = req.getRequestDispatcher("adminclub.jsp");
	          rd.include(req, res);
	          out.println("<script>alert('Error Adding The Club Details')</script>");
	              }
	      }
	            else {
	      	      System.out.println("Hello 11");
	              RequestDispatcher rd = req.getRequestDispatcher("adminclub.jsp");
	              rd.include(req, res);
	              out.println("<script>alert('CLub Already Added')</script>");
	            }
	    }
	    catch(Exception e) {
		      System.out.println("Hello 12");
	      out.println(e);
	    }
	}
}
