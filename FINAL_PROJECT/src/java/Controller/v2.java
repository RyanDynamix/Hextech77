
package Controller;

import Model.DBContext;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class v2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new DBContext().validateUser(email, password);


        if (user != null) {
            request.getSession().setAttribute("user", user);
            if (user.getRoleID() == 1) {
                response.sendRedirect(request.getContextPath() + "/Admin/index.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/userHome.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/test.jsp");
        }
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
