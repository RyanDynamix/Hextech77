Phương thức `getServletContext()` trong Java Servlet API được sử dụng để lấy đối tượng `ServletContext`. `ServletContext` là một interface cung cấp các phương thức để tương tác với môi trường servlet và các tài nguyên của ứng dụng web. Dưới đây là giải thích chi tiết về `getServletContext()` và `ServletContext`.

### `getServletContext()`

- **Định nghĩa**: `getServletContext()` là một phương thức có trong `HttpServlet` và `GenericServlet`.
- **Chức năng**: Phương thức này trả về đối tượng `ServletContext` liên quan đến ứng dụng web hiện tại. `ServletContext` cung cấp các phương thức để tương tác với môi trường servlet và các tài nguyên của ứng dụng web.

### `ServletContext` là gì?

`ServletContext` là một interface trong Java Servlet API. Nó đại diện cho toàn bộ ứng dụng web đang chạy trên một servlet container. `ServletContext` cung cấp các phương thức để:

- **Truy cập thông tin cấu hình**: Như các tham số khởi tạo (init parameters) của ứng dụng web.
- **Quản lý tài nguyên**: Như truy cập các tài nguyên tĩnh (HTML, JSP, hình ảnh, v.v.) và các tài nguyên động (servlet, JSP) của ứng dụng.
- **Lưu trữ và chia sẻ dữ liệu**: Giữa các servlet trong cùng một ứng dụng web.
- **Đăng ký và hủy đăng ký các servlet, filter và listener**: Trong quá trình khởi tạo ứng dụng.

### Các phương thức chính của `ServletContext`

Dưới đây là một số phương thức quan trọng của `ServletContext`:

- **`getInitParameter(String name)`**: Lấy giá trị của một tham số khởi tạo của ứng dụng web.
- **`getInitParameterNames()`**: Lấy tên của tất cả các tham số khởi tạo của ứng dụng web.
- **`getAttribute(String name)`**: Lấy giá trị của một thuộc tính (attribute) được lưu trữ trong `ServletContext`.
- **`setAttribute(String name, Object object)`**: Đặt giá trị của một thuộc tính trong `ServletContext`.
- **`getRealPath(String path)`**: Lấy đường dẫn thực sự trên hệ thống tập tin đến tài nguyên được chỉ định bởi đường dẫn.
- **`getResourceAsStream(String path)`**: Lấy một luồng đầu vào (input stream) đến tài nguyên được chỉ định bởi đường dẫn.
- **`getRequestDispatcher(String path)`**: Lấy đối tượng `RequestDispatcher` cho tài nguyên được chỉ định bởi đường dẫn.
- **`getContextPath()`**: Lấy đường dẫn ngữ cảnh của ứng dụng web.

### Ví dụ sử dụng `getServletContext()`

#### 1. Truy cập tham số khởi tạo:
```java
public void init() {
    ServletContext context = getServletContext();
    String myParam = context.getInitParameter("myParam");
    System.out.println("Init parameter: " + myParam);
}
```

#### 2. Lưu trữ và truy cập thuộc tính trong `ServletContext`:
```java
// Lưu trữ thuộc tính trong `ServletContext`
public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ServletContext context = getServletContext();
    context.setAttribute("appData", "Some important data");
}

// Truy cập thuộc tính trong `ServletContext`
public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ServletContext context = getServletContext();
    String appData = (String) context.getAttribute("appData");
    response.getWriter().println("App data: " + appData);
}
```

#### 3. Lấy đường dẫn thực sự đến tài nguyên:
```java
public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ServletContext context = getServletContext();
    String fullPath = context.getRealPath("/WEB-INF/config.properties");
    response.getWriter().println("Full path: " + fullPath);
}
```

#### 4. Lấy `RequestDispatcher` để chuyển tiếp yêu cầu:
```java
public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ServletContext context = getServletContext();
    RequestDispatcher rd = context.getRequestDispatcher("/otherResource");
    rd.forward(request, response);
}
```

### Khi nào sử dụng `getServletContext()`

- **Chia sẻ dữ liệu**: Giữa các servlet trong cùng một ứng dụng web.
- **Truy cập thông tin cấu hình**: Được định nghĩa trong tệp cấu hình (web.xml).
- **Quản lý tài nguyên**: Truy cập các tài nguyên tĩnh và động của ứng dụng.
- **Điều hướng yêu cầu**: Sử dụng `RequestDispatcher` để chuyển tiếp hoặc bao gồm tài nguyên khác trong phản hồi.

`getServletContext()` là một công cụ mạnh mẽ trong Java Servlet API, cho phép bạn quản lý và tương tác với môi trường servlet và các tài nguyên của ứng dụng web một cách hiệu quả.
