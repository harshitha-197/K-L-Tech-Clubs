import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checklogin")
public class CheckLogin extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		try
		{
			
			Connection con = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
			
			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");
			
			PreparedStatement pstmt = con.prepareStatement(" select * from signup where email=? and pwd=?");
			
			pstmt.setString(1,email);
			pstmt.setString(2, pwd);
			
			int n = pstmt.executeUpdate();
			
			if(n>0)
			{
				HttpSession session = req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("pwd", pwd);
				res.sendRedirect("home1.jsp");
			}
			else
			{  out.println("<script type=\"text/javascript\">");
			   out.println("alert('User or password incorrect');");
			   out.println("location='login.html';");
			   out.println("</script>");
			  
			  
			}
			
			
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}
}