# BanHangOnline
 
[Cú pháp tệp .md](https://viblo.asia/helps/cach-su-dung-markdown-bxjvZYnwkJZ)

[Hướng dẫn thiết kê](https://www.youtube.com/playlist?list=PLMPBVRu4TjAzulJw0CK1Qlxzi3cXXYEio)

## I) Phân tích dự án
1. Frontend: (phía người dùng)
   * Trang chủ
   * Trang danh sách sản phẩm
   * Trang chi tiết sản phẩm
   * Trang giỏ hàng (thêm, xóa,..)
   * Trang checkout(địa chỉ nhận hàng, sđt,...)
   * Trang thanh toán hoàn thành
   * Trang liên hệ(from điền thông tin, map,..)
2. Admin:
   * Tài khoản người dùng:
     - Quản lý role (admin, user,...)
     - Quản lý người dùng: admin/user (phải dùng trang quản trị để tạo tk admin)
     - Hiển thị danh sách/thêm/sửa/xóa
     - Đăng kí tài khoản
     - Đăng nhập(cho cả admin và user)
   * Quản lý danh mục sản phẩm
   * Quản lý sản phẩm
   * Quản lý đơn hàng (Hiển thị đc danh sách đơn hàng, quản lý đc trạng thái đơn hàng)
   * Quản lý phản hồi


## II) Phân tích database (chưa đủ thuộc tính đâu, phải test để thêm)
1. Bảng Role
   * id : int (primary key) tự tăng
   * name: string (nvarchar) _ độ dài phải lớn tầm >=50 ký tự
2. Bảng User
   * id : int (primary key) tự tăng
   * fullname: string (varchar) _ >=50 ký tự
   * email : string (varchar) _ >=150 ký tự -> unique
   * phoneNumber : string (varchar) _ >=20 ký tự -> unique
   * address : string (varchar) _ >=200 ký tự
   * password : string -> md5 -> 32 ký tự -> chính xác
   * roleId : int -> foreign key
3. Bảng Category (Danh Mục)
   * id : int (primary key) tự tăng
   * name : string -> 100 ký tự
4. Bảng Product(Sản phẩm)
   * id : int (primary key) tự tăng
   * categoryId : int (forence key) tự tăng -> bảng Category
   * title : string -> 350 ký tự
   * price : float
   * discount : float
   * thumbnail : string -> 500 ký tự
   * description : longtext
   * created_at : datetime -> lần đầu tạo bản ghi
   * updated_at : datetime -> lần cuối sửa bản ghi đó
5. Bảng quản lý galery
   * id : int (primary key) tự tăng
   * productId : int (forence key) -> bảng product
   * thumbnail : string -> 500 ký tự
6. Bảng Feedback(quản lý phản hồi) (Cho các sản phẩm)
   * id : int (primary key) tự tăng
   * productId : int (forence key) -> bảng product
   * firstName : string (nvarchar) -> 30 ký tự (có thể cho thành 1 name lun cho dễ)
   * lastName : string (nvarchar) -> 30 ký tự
   * email : string -> 150 ký tự
   * phone : string -> 20 ký tự
   * note : string (nvarchar) -> độ dài tối đa 500 ký tự
7. Quản lý đơn hàng (note cơ bản chưa hoàn chỉnh)
   * id : int (primary key) tự tăng
   * fullname
   * email
   * phone
   * address
   * note
   * order_date: datetime -> thời điểm đặt hàng
   * Danh sách sản phẩm
     - sản phẩm 1 x số lượng x ***giá tại thời điểm mua***
     - sản phẩm 2 x số lượng x ***giá tại thời điểm mua***

7a. Bảng Order
   * id : int (primary key) tự tăng
   * fullname
   * email
   * phone
   * address
   * note
   * order_date: datetime -> thời điểm đặt hàng
   * status : int -> (pending, approved,...)
