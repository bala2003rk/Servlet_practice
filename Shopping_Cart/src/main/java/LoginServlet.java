import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Your logic for user verification
        if (isValidUser(username, password)) {
            HttpSession session = request.getSession();
            // Initialize login count if not set
   
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
        } else {
            // Invalid user, redirect back to login with an error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.html").forward(request, response);
        }
    }

    private boolean isValidUser(String username, String password) {
        // Dummy implementation, replace with your actual user verification logic
        return username != null && username.equals("admin") && password != null && password.equals("admin123");
    }
}
