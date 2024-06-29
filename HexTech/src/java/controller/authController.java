
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.User;

// Đường dẫn là /auth
public class authController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet authController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet authController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("auth.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //- Lấy giá trị action về
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        //- switch case cac action
        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            case "signup":
                handleSignup(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }
    
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Set session timeout to 30 minutes
        session.setMaxInactiveInterval(30 * 60);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        //Tìm trong db xem thử có user nào có email và password giống ko
        User account = dao.findByEmailPassword(email, password);
        //nếu account = null -> tai khoan mat khau ko dung -> set về lỗi -> trở lại login.jsp

        if (account == null) {
            //dang nhap that bai -> productControler để lấy dữ liệu hiển thị
            //khi này account = null; ko cho sài tính năng (limited access)
            session.setAttribute("account", account);
            session.setAttribute("notifyAuth", "failed");
            
            //Chuyển hướng trang
            String targetURL = "auth";
            String encodedURL = response.encodeRedirectURL(targetURL);
            response.sendRedirect(encodedURL);
        } else {
            //dang nhap thanh cong -> productControler để lấy dữ liệu hiển thị
            //khi này account != null; cho sài tính năng đă (access all)
            session.setAttribute("account", account);
            session.setAttribute("notifyAuth", "success");
            
            // Add username to cookie
            Cookie userName = new Cookie("emailCookie", email);
            userName.setMaxAge(30 * 60);
            response.addCookie(userName);
            
            String targetURL;
            String encodedURL;
            switch (account.getRoleID()) {
                case 1:
                    //Chuyển hướng trang qua admin (chưa làm)
                    targetURL = "auth.jsp";      //đổi dường dẫn ở đây
                    encodedURL = response.encodeRedirectURL(targetURL);
                    break;
                case 2:
                    //Chuyển hướng trang qua user
                    targetURL = "userMainPage.jsp";      //đổi dường dẫn ở đây
                    encodedURL = response.encodeRedirectURL(targetURL);
                    break;
                default:
                    throw new AssertionError();
            }
            response.sendRedirect(encodedURL);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie loginCookie = null;
        //Lấy cookies cho account muốn logout
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("emailCookie")) {
                    loginCookie = cookie;
                    break;
                }
            }
        }

        //Nếu tồn tại cookie đó thì destroy nó
        if (loginCookie != null) {
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }

        //Lấy session hiện tại, (false) có ý nghĩa là nếu lấy session ra null thì ko tạo lại sesion
        HttpSession session = request.getSession(false);
        //vô hiệu hóa session hiện tại
        if (session != null) {
            session.invalidate();
        }

        String encodedURL = response.encodeRedirectURL("auth.jsp");
        response.sendRedirect(encodedURL);
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Set session timeout to 30 minutes
        session.setMaxInactiveInterval(30 * 60);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phoneNumber");

        UserDAO dao = new UserDAO();
        //Tìm trong db xem thử có user nào có email và password giống ko
        User account = dao.findByEmailPassword(email, password);
        if(account == null) {
            //insert new user
            User user = new User();
            user.setEmail(email);
            user.setPassword(password);
            user.setFullName(fullname);
            user.setPhoneNumber(phoneNumber);
            
            dao.insertUserDB(user);
            //trở về để dăng nhập
            request.getRequestDispatcher("auth.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login servlet for user authentication";
    }// </editor-fold>

}
