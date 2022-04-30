import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/clubsreg")
public class ClubsRegistration extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String id=req.getParameter("id");
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
	
		
		try
		{
			
			Connection con = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
			
			PreparedStatement pstmt = con.prepareStatement(" insert into clubsregistration values(?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, fname);
			pstmt.setString(3, lname);
			pstmt.setString(4, email);
	
			
			int n = pstmt.executeUpdate();
			
			if(n==1)
			{   out.print("Sucessfully registered into club");
				RequestDispatcher rd = req.getRequestDispatcher("studentclub.jsp");
				rd.include(req, res);
			}
			else if(n>1)
			{
				out.println("User Already Registered");
			}
			else {
				out.println("Unable to register");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}
}