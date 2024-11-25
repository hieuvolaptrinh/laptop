<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />
    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="/client/css/register.css" />
    <title>LaptopShop - Đăng kí</title>
  </head>
  <body>
    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="card shadow-lg">
            <div class="card-header text-center">
              <h3 class="mb-0">Tạo Mới Tài Khoản Ngay</h3>
            </div>
            <div class="card-body px-5">
              <div class="text-center">
                <div class="social-links">
                  <a href="#" class="facebook"
                    ><i class="fab fa-facebook-f"></i
                  ></a>
                  <a href="#" class="google"><i class="fab fa-google"></i></a>
                  <a href="#" class="twitter"><i class="fab fa-twitter"></i></a>
                </div>
                <p class="mt-3 text-muted">or register with email</p>
              </div>

              <form:form
                method="post"
                action="/register"
                modelAttribute="registerUser"
              >
                <c:set var="errorPassword">
                  <form:errors
                    path="confirmPassword"
                    cssClass="invalid-feedback"
                  />
                </c:set>
                <c:set var="errorEmail">
                  <form:errors path="email" cssClass="invalid-feedback" />
                </c:set>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-floating">
                      <!-- form-floating để ấn vào là cái first name nó hiện nhỏ lại rồi bay lên trên
                       tăng UI -->
                      <form:input
                        type="text"
                        class="form-control"
                        id="firstName"
                        placeholder="First Name"
                        path="firstName"
                      />
                      <label for="firstName"
                        ><i class="fas fa-user me-2"></i>First Name</label
                      >
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-floating">
                      <form:input
                        type="text"
                        class="form-control"
                        id="lastName"
                        placeholder="Last Name"
                        path="lastName"
                      />
                      <label for="lastName"
                        ><i class="fas fa-user me-2"></i>Last Name</label
                      >
                    </div>
                  </div>
                  <div class="col-12 mb-4">
                    <div class="form-floating">
                      <form:input
                        type="email"
                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                        id="email"
                        placeholder="Email"
                        path="email"
                      />
                      <label for="email"
                        ><i class="fas fa-envelope me-2"></i>Email
                        address</label
                      >
                      <form:errors path="email" cssClass="text-danger" />
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-floating">
                      <form:input
                        type="password"
                        id="password"
                        class="form-control"
                        placeholder="Password"
                        path="password"
                        required="required"
                      />
                      <label for="password"
                        ><i class="fas fa-lock me-2"></i>Password</label
                      >
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-floating">
                      <form:input
                        type="password"
                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                        id="confirmPassword"
                        placeholder="Confirm Password"
                        path="confirmPassword"
                      />
                      <label for="confirmPassword"
                        ><i class="fas fa-lock me-2"></i>Confirm Password</label
                      >
                      <form:errors
                        path="confirmPassword"
                        cssClass="text-danger"
                      />
                    </div>
                  </div>
                  <div class="col-12 mb-2">
                    <div class="form-check">
                      Tôi đồng ý với <a href="#">Điều Khoản Dịch Vụ</a> và
                      <a href="#">Chính sách quyền riêng tư</a>
                    </div>
                  </div>
                  <div class="col-12">
                    <button type="submit" class="btn btn-primary w-100">
                      Đăng Kí <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                    <div class="card-footer text-center py-4 border-0">
                      <p class="mb-0">
                        Bạn đã có tài khoản ?
                        <a href="#" class="fw-bold">Đăng Nhập</a>
                      </p>
                    </div>
                  </div>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="/js/script.js"></script>
  </body>
</html>
