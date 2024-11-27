<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LaptopShop - Đăng ký</title>

    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <link rel="stylesheet" href="/client/css/auth.css" />
    <title>LaptopShop - Đăng Kí</title>
  </head>
  <body>
    <section class="background-radial-gradient overflow-hidden">
      <div class="container px-4 py-5 px-md-5 text-center text-lg-start">
        <div class="row gx-lg-5 align-items-center">
          <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
            <h1
              class="my-5 display-5 fw-bold ls-tight"
              style="color: hsl(218, 81%, 95%)"
            >
              Chào mừng bạn đến với <br />
              <span style="color: hsl(218, 81%, 75%)">LaptopShop</span>
            </h1>
            <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
              Đăng ký ngay để trải nghiệm dịch vụ tốt nhất từ chúng tôi. Khám
              phá các ưu đãi độc quyền và sản phẩm chất lượng cao tại
              LaptopShop.
            </p>
          </div>

          <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
            <div
              id="radius-shape-1"
              class="position-absolute rounded-circle shadow-5-strong"
            ></div>
            <div
              id="radius-shape-2"
              class="position-absolute shadow-5-strong"
            ></div>

            <div class="card bg-glass">
              <div class="card-body px-4 py-5 px-md-5">
                <h2 class="fw-bold mb-5">Tạo Mới Tài Khoản Ngay</h2>
                <form:form
                  method="post"
                  action="/register"
                  modelAttribute="registerUser"
                >
                  <c:set var="errorFirstName">
                    <form:errors path="firstName" cssClass="invalid-feedback" />
                  </c:set>
                  <c:set var="errorPassword">
                    <form:errors
                      path="confirmPassword"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
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
                    <div class="col-md-6 mb-4">
                      <div class="form-floating">
                        <form:input
                          type="text"
                          class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                          id="firstName"
                          placeholder="First Name"
                          path="firstName"
                        />
                        <label for="firstName"
                          ><i class="fas fa-user me-2"></i>First Name</label
                        >
                        <form:errors path="firstName" cssClass="text-danger" />
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
                  </div>

                  <div class="form-floating mb-4">
                    <form:input
                      type="email"
                      class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                      id="email"
                      placeholder="Email"
                      path="email"
                    />
                    <label for="email"
                      ><i class="fas fa-envelope me-2"></i>Email address</label
                    >
                    <form:errors path="email" cssClass="text-danger" />
                  </div>
                  <div class="row mb-4">
                    <div class="col-md-6 mb-4 mb-md-0">
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
                    <div class="col-md-6">
                      <div class="form-floating">
                        <form:input
                          type="password"
                          class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                          id="confirmPassword"
                          placeholder="Confirm Password"
                          path="confirmPassword"
                        />
                        <label for="confirmPassword"
                          ><i class="fas fa-lock me-2"></i>Confirm
                          Password</label
                        >
                        <form:errors
                          path="confirmPassword"
                          cssClass="text-danger"
                        />
                      </div>
                    </div>
                  </div>

                  <button type="submit" class="btn btn-register btn-block mb-4">
                    Đăng Ký <i class="fas fa-user-plus ms-2"></i>
                  </button>

                  <div class="text-center">
                    <p>hoặc đăng ký với:</p>
                    <a href="#" class="btn btn-icon btn-facebook mx-1">
                      <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="btn btn-icon btn-google mx-1">
                      <i class="fab fa-google"></i>
                    </a>
                    <a href="#" class="btn btn-icon btn-twitter mx-1">
                      <i class="fab fa-twitter"></i>
                    </a>
                  </div>
                </form:form>
                <div class="text-center mt-4">
                  <p class="mb-0">
                    Bạn đã có tài khoản?
                    <a href="/login" class="fw-bold">Đăng Nhập</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
  </body>
</html>
