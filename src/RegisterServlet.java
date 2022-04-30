import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/registration")
public class RegisterServlet extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		String fname = req.getParameter("fname");
		String uname = req.getParameter("uname");
		String email = req.getParameter("mail");
		String pwd = req.getParameter("pwd");
		
		try
		{
			
			Connection con = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
			
			PreparedStatement pstmt = con.prepareStatement(" insert into signup values(?,?,?,?)");
			
			pstmt.setString(1, fname);
			pstmt.setString(2, uname);
			pstmt.setString(3, email);
			pstmt.setString(4, pwd);
			
			int n = pstmt.executeUpdate();
			
			if(n>0)
			{  
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('registration sucessfull');");
				  // out.println("location='login.html';");
				   out.println("</script>");
				RequestDispatcher rd = req.getRequestDispatcher("login.html");
				rd.include(req, res);
				
			}
			else
			{
				out.println("Unable to Insert the Record");
			}
			
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}
}