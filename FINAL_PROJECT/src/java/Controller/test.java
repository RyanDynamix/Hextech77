///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package Controller;
//
///**
// *
// * @author hotaru
// */
//public class test {
//    String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        LOGGER.log(Level.INFO, "Received login request with email: {0}, password: {1}", new Object[]{email, password});
//
//        DBContext dbContext = new DBContext();
//        User user = null;
//
//        try {
//            user = dbContext.validateUser(email, password);
//            LOGGER.log(Level.INFO, "User validation result: {0}", user);
//        } catch (Exception e) {
//            LOGGER.log(Level.SEVERE, "Error validating user", e);
//        }
//
//        if (user != null) {
//            request.getSession().setAttribute("user", user);
//            if (user.getRoleID() == 1) {
//                response.sendRedirect(request.getContextPath() + "/Admin/index.jsp");
//            } else {
//                response.sendRedirect(request.getContextPath() + "/userHome.jsp");
//            }
//        } else {
//            LOGGER.log(Level.WARNING, "Invalid login attempt for email: {0}", email);
//            response.sendRedirect(request.getContextPath() + "/test.jsp");
//        }
//}
