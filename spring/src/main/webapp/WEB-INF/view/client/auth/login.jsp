<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LaptopShop - Đăng nhập</title>

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
    <title>LaptopShop - Đăng Nhập</title>
  </head>
  <body>
    <section class="background-radial-gradient overflow-hidden">
      <div class="container px-4 py-5 px-md-5 text-center text-lg-start">
        <div class="row gx-lg-5 align-items-center mb-5">
          <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
            <h1
              class="my-5 display-5 fw-bold ls-tight"
              style="color: hsl(218, 81%, 95%)"
            >
              Chào mừng bạn trở lại <br />
              <span style="color: hsl(218, 81%, 75%)">LaptopShop</span>
            </h1>
            <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
              Đăng nhập để tiếp tục mua sắm và trải nghiệm dịch vụ tốt nhất từ
              chúng tôi. Khám phá các ưu đãi độc quyền và sản phẩm chất lượng
              cao tại LaptopShop.
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
                <h2 class="fw-bold mb-5">Đăng Nhập</h2>
                <form>
                  <div class="form-outline mb-4">
                    <label class="form-label" for="email"
                      ><i class="fas fa-envelope me-2"></i>Email</label
                    >
                    <input
                      type="email"
                      id="email"
                      class="form-control"
                      placeholder="name@example.com"
                      required
                    />
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="password"
                      ><i class="fas fa-lock me-2"></i>Mật khẩu</label
                    >
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      placeholder="Mật Khẩu "
                      required
                    />
                  </div>

                  <div class="row mb-4">
                    <div class="col d-flex justify-content-center">
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="rememberMe"
                        />
                        <label class="form-check-label" for="rememberMe"
                          >Ghi nhớ đăng nhập</label
                        >
                      </div>
                    </div>
                    <div class="col text-center">
                      <a href="#!">Quên mật khẩu?</a>
                    </div>
                  </div>

                  <button type="submit" class="btn btn-login btn-block mb-4">
                    Đăng Nhập <i class="fas fa-sign-in-alt ms-2"></i>
                  </button>

                  <div class="text-center">
                    <p>hoặc đăng nhập với:</p>

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
                </form>
                <div class="text-center mt-4">
                  <p class="mb-0">
                    Chưa có tài khoản?
                    <a href="register" class="fw-bold">Đăng Ký</a>
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
