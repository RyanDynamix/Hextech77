package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import feature.sendEmail.Email;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Users;
import model.gioHang;
import model.showProduct;
import util.Validate;

@WebServlet(name = "shoppingCartController", urlPatterns = {"/shopping"})
public class shoppingCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet shoppingCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shoppingCartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();

        //Lấy về userID từ account trong sesion khi đăng nhập
        Users account = (Users) session.getAttribute("account");

        if (account == null) {   //ng dung chua dang nhap 
            //Chuyen huong den trang dang nhap
            String targetURL = "auth";
            String encodedURL = response.encodeRedirectURL(targetURL);
            response.sendRedirect(encodedURL);
        } else {                //ng dung da dang nhap thanh cong
            //Lay orderID cua userID
            int orderID = dao.findOrderIdNotConfirmed(account.getUserID());

            if (orderID != 0) {  //Có giỏ hàng từ trước
                List<gioHang> allProductShopping = dao.showShoppingCartByID(orderID); // In ra console để kiểm tra danh sách sản phẩm
                for (gioHang hang : allProductShopping) {
                    hang.setDisString(Validate.doubleToMoney(hang.getPrice()));             //set tiền dạng String cho price
                    hang.setTotalString(Validate.doubleToMoney(hang.getTotalMoney()));     //set tiền dạng String cho total
                }
                //Lưu trữ vào trong request
                request.setAttribute("allProductShopping", allProductShopping);     //Lấy cái này để chạy for:Each
                //chuyen sang trang shoppingCart.jsp
                request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
            } else {        //Chưa có giỏ hàng
                //Thông báo cho người dùng là ko có giỏ hàng, anh thêm  request.setAttribute gì đó hoạc kiểm tra cái trên ko tồn tại
                List<gioHang> allProductShopping = null;
                //Lưu trữ vào trong request
                request.setAttribute("allProductShopping", allProductShopping);     //Lấy cái này để chạy for:Each
                //chuyen sang trang shoppingCart.jsp
                request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giá trị action về
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        //- switch case cac action
        switch (action) {
            case "orderSubmit":
                handleOrderSubmit(request, response);
                break;
            case "changeQuantity":
                handleChangeQuantity(request, response);
                //chuyen sang trang shoppingCart.jsp
                response.sendRedirect("shopping");
                break;
            default:
                throw new AssertionError();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void handleOrderSubmit(HttpServletRequest request, HttpServletResponse response) {
        OrderDAO dao = new OrderDAO();
        //- get ve data
        HttpSession session = request.getSession();
        Users acc = (Users) session.getAttribute("account");

        String nameOrder = request.getParameter("nameOrder");
        String phone = request.getParameter("phone");
        String deliveryLocation = request.getParameter("deliveryLocation");
        int orderID = Integer.parseInt(request.getParameter("orderID"));

        try {
            dao.updateOrderConfirmedDB(orderID, nameOrder, phone, deliveryLocation);
            //Thông báo đặt hàng thành công
            String notifyOrder = "success";
            request.setAttribute("notifyOrder", notifyOrder);
///////////////////////////////////////////////////////////////////////
            //Gửi email thông báo đến người dùng
            String tieuDe = "Cảm ơn " + nameOrder + " vì đã mua hàng tại HexTech!";
            //Lấy những vật phẩm họ đã đặt hàng
            List<gioHang> allProductShopping = dao.showShoppingCartByID(orderID); // In ra console để kiểm tra danh sách sản phẩm
            for (gioHang hang : allProductShopping) {
                hang.setDisString(Validate.doubleToMoney(hang.getPrice()));             //set tiền dạng String cho price
                hang.setTotalString(Validate.doubleToMoney(hang.getTotalMoney()));     //set tiền dạng String cho total
            }

            double sumMoney = 0;
            StringBuilder detail = new StringBuilder();
            for (int i = 0; i < allProductShopping.size(); i++) {
                detail.append("<p>");
//                detail.append("<img src="+ allProductShopping.get(i).getThumbnail() + ">");
                detail.append(allProductShopping.get(i).getProductName());
                detail.append(" - <strong>Số Lượng: </strong>");
                detail.append(allProductShopping.get(i).getQuantity());
                detail.append(" - <strong>Màu: </strong>");
                detail.append(allProductShopping.get(i).getColor());
                detail.append(" - <strong>Thành tiền: </strong>");
                detail.append(allProductShopping.get(i).getTotalString());
                detail.append("</p>\n");
                detail.append("<hr>");
                sumMoney += allProductShopping.get(i).getTotalMoney();
            }
            detail.append("<h3>Tổng giá trị đơn hàng: ");
            detail.append(Validate.doubleToMoney(sumMoney));
            detail.append("đ</h3>");

            // Tạo chuỗi HTML hoàn chỉnh
            String noiDung = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "<head>\n"
                    + "    <meta charset=\"UTF-8\">\n"
                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    <title>Document</title>\n"
                    + "    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n"
                    + "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n"
                    + "    <link href=\"https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap\" rel=\"stylesheet\">\n"
                    + "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n"
                    + "        integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n"
                    + "    <style>\n"
                    + "        h2 {\n"
                    + "            font-family: \"Dancing Script\", cursive;\n"
                    + "            font-optical-sizing: auto;\n"
                    + "            font-weight: bold;\n"
                    + "            font-style: normal;\n"
                    + "            text-align: center;\n"
                    + "        }\n"
                    + "\n"
                    + "        p {\n"
                    + "            /* font-family: \"Dancing Script\", cursive; */\n"
                    + "            /* font-weight: bold; */\n"
                    + "            font-style: normal;\n"
                    + "            /* font-size: 20px; */\n"
                    + "            text-indent: 30px;\n"
                    + "        }\n"
                    + "    </style>"
                    + "</head>\n"
                    + "<body>\n"
                    //                    + "<h1> Cảm ơn bạn vì đã lựa chọn HexTech! </h1>\n"
                    //                    + "<h5> Tên người nhận:    " + nameOrder + "</h5>\n"
                    //                    + "<h5> Số điện thoại:     " + phone + "</h5>\n"
                    //                    + "<h5> Địa chỉ giao hàng: " + deliveryLocation + "</h5>\n"
                    //                    + "<hr>\n"
                    //                    + "<h5> Các sản phẩm bạn đã đặt: </h5>\n"
                    + "    <div class=\"container-fluid \">\n"
                    + "        <h2>Cảm ơn quý khách vì đã tin tưởng lựa chọn HexTech!</h2>\n"
                    + "        <p>Kính gửi: Quý khách hàng, " + nameOrder + ".</p>\n"
                    + "        <p>Số điện thoại:" + phone + "</p>\n"
                    + "        <p>Địa chỉ giao hàng: " + deliveryLocation + "</p>\n"
                    + "        <p>Thay mặt cho cửa hàng Điện tử Hextech Việt Nam xin được gửi lời cảm ơn chân thành tới quý khách hàng\n"
                    + "            <strong style=\"color: red; font-style: italic;\">" + nameOrder + "</strong> vì đã mua hàng của chúng tôi.\n"
                    + "        </p>\n"
                    + "        <hr>\n"
                    + "        <p>Các sản phẩm mà quý khách đã lựa chọn đặt hàng: </p>\n"
                    + detail.toString()
                    + "        <p>Sự tin tưởng của quý khách là vinh dự và là nguồn động lực lớn để chúng\n"
                    + "            tôi phát triển và cung cấp những mặt hàng, dịch vụ tốt nhất đến cho quý khách. Chúng tôi mong muốn nhận\n"
                    + "            được những phản hồi, góp ý của quý khách để góp phần nâng cao chất lượng</p>\n"
                    + "        <p style=\"font-style: italic; color: red;\">Chúng tôi xin cảm ơn quý khách vì đã tin tưởng lựa chọn HexTech!</p>\n"
                    + "        <p style=\"font-style: italic; color: red;\">Mọi thắc mắc, phản hồi xin hãy liên hệ theo số điện thoại 0582647644\n"
                    + "            để được hỗ trợ từ HexTech! Chúc quý\n"
                    + "            khách một ngày tốt lành! &#128522;</p>\n"
                    + "    </div>"
                    //                    + "<h4> Hãy liên hệ 0582647644 để được hỗ trợ từ HexTech! Chúc bạn một ngày tốt lành! </h4>\n"
                    + "</body>\n"
                    + "</html>";

            Email.sendEmail(acc.getEmail().trim(), tieuDe, noiDung);
            //Tin nhắn cho Trung

////////////////////////////////////////////////////////////////////////
            //chuyen sang trang shoppingCart.jsp
            request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
        } catch (Exception e) {
            //Thông báo đặt hàng thất bại
            String notifyOrder = "failed";
            request.setAttribute("notifyOrder", notifyOrder);
            //In log
            e.printStackTrace();
        }

    }

    private void handleChangeQuantity(HttpServletRequest request, HttpServletResponse response) {
        OrderDAO dao = new OrderDAO();

        int orderID = Integer.parseInt(request.getParameter("orderID"));
        int totalItems = Integer.parseInt(request.getParameter("totalItems"));

        for (int i = 0; i < totalItems; i++) {
            int productID = Integer.parseInt(request.getParameter("productID_" + i));
            int quantity = Integer.parseInt(request.getParameter("quantity_" + i));
            String color = request.getParameter("color_" + i);

            //Sử dụng productID và quantity để cập nhật giỏ hàng của người dùng
            dao.updateOrderDetailsByOrderID(orderID, productID, quantity, color);
        }
        // Xử lý tiếp theo với updatedCartItems
    }

}
