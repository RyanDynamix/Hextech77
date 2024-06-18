package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import Model.DBContext;
import Model.User;

public class Logger extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        DBContext dbContext = new DBContext();
        User user = dbContext.validateUser(email, password);

        if (user != null) {
            request.getSession().setAttribute("user", user);
            if (user.getRoleID() == 1) {
                response.sendRedirect(request.getContextPath() + "/Admin/index.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/userHome.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Invalid%20email%20or%20password");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
