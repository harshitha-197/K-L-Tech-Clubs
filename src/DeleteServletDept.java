import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.*;
@WebServlet("/deletedept")
public class DeleteServletDept extends HttpServlet{
  public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
      res.setContentType("text/html");
      PrintWriter out=res.getWriter();
      
      String name=req.getParameter("name");

  	String Classname = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "ep";
	String password = "ep";

      try {
        Connection con = null;
	      Class.forName(Classname);
	      con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement pstmt = con.prepareStatement("delete from deptbodies where name=?");     
        pstmt.setString(1, name);
        int n=pstmt.executeUpdate();

        if(n>0) {
          RequestDispatcher rd=req.getRequestDispatcher("deptbodies.jsp");
          rd.include(req,res);
          out.println("<script>alert('Record(s) Deleted')</script>");
        }
        else {
        	 System.out.println("Hello3");
          out.println("Oops!! Something Went Wrong");
        }
        con.close();
      }
      catch(Exception e) {
        System.out.println("Exception"+e);
      }  
    
  }
}