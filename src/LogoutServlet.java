import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
  public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
    HttpSession session = req.getSession();
      session.removeAttribute("email");
      session.removeAttribute("pwd");
      session.invalidate();
      res.sendRedirect("home.jsp");
  }
}