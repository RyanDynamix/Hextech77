<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <link rel="stylesheet" href="./Login/css/cssLogin.css">
    <script src="https://kit.fontawesome.com/54f0cb7e4a.js" crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
    </style>
    <script src="https://kit.fontawesome.com/3a767ca8aa.js" crossorigin="anonymous"></script>
</head>

<body>
    <h2 class="pacifico-regular">HexTech - Công nghệ thay đổi cuộc sống</h2>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="#">
                <h1>Đăng ký</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>hoặc sử dụng email của bạn để đăng ký</span>
                <input type="text" placeholder="Tên đăng nhập" required/>
                <input type="password" placeholder="Mật khẩu" required/>
                <input type="tel" placeholder="Số điện thoại" pattern="[0-9]{10}" title="Số điện thoại phải có 10 chữ số" required/>
                <input type="email" placeholder="Email">
                <button style="cursor: pointer;">Đăng ký</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="Loger" method="post">
                <h1>Đăng nhập</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>Sử dụng tài khoản của bạn</span>
                <input type="text" placeholder="Tên đăng nhập" />
                <input type="password" placeholder="Mật khẩu" />
                <a href="#">Quên mật khẩu?</a>
                <button type="submit" name="action" value="login" style="cursor: pointer;">Đăng nhập</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p> Để nhận được những ưu đãi đặc biệt, vui lòng đăng nhập tài khoản của bạn.</p>
                    <button class="ghost" id="signIn">Đăng nhập</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Đăng ký tài khoản của bạn để bắt đầu hành trình cùng chúng tôi và tận hưởng những ưu đãi đặc biệt.</p>
                    <button class="ghost" id="signUp">Đăng ký</button>
                </div>
            </div>
        </div>

    </div>

    <div class="login-mobile">
        <div class="btn">
            <form class="register-form" action="#">
                <h1>Tạo tài khoản</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>sử dụng email để đăng nhập</span>
                <input type="text" placeholder="Tên đăng nhập" required/>
                <input type="password" placeholder="Mật khẩu" required/>
                <input type="tel" placeholder="Số điện thoại" pattern="[0-9]{10}" title="Số điện thoại phải có 10 chữ số" required/>
                <input type="email" placeholder="Email">
                <button>Đăng ký</button>
                <p class="toggle-container"><a href="#" id="signInLink">Đã có tài khoản? Đăng nhập ngay</a></p>
            </form>
        </div>
    
        <div>
            <form class="login-form" action="#">
                <h1>Đăng nhập</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>hoặc sử dụng tài khoản của bạn</span>
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password" />
                <div class="quenMK">
                    <a href="#">Quên mật khẩu?</a>
                </div>
                <button>Đăng nhập</button>
                <p class="toggle-container"><a href="#" id="signUpLink">Chưa có tài khoản? Đăng ký ngay</a></p>
            </form>
        </div>
    </div>
    

    <footer>
        <p>
            Created with <i class="fa fa-heart"></i> by
            Hoang Nam & Trung Kien & Khanh Nhan & Ngoc Trung & Huu Quang
        </p>
    </footer>

    <script src="./js/myCodeLogin.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

</html>