<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid fixed-top">
  <div class="container topbar bg-primary d-none d-lg-block">
    <div class="d-flex justify-content-between">
      <div class="top-info ps-2">
        <small class="me-3"
          ><i class="fas fa-map-marker-alt me-2 text-secondary"></i>
          <a href="#" class="text-white"
            >49 Cao Thắng - Đại Học Sư Phạm Kỹ Thuật</a
          ></small
        >
        <small class="me-3"
          ><i class="fas fa-envelope me-2 text-secondary"></i
          ><a href="#" class="text-white">Vndhieuak@gmail.com</a></small
        >
      </div>
      <!-- <div class="top-link pe-2">
        <a href="#" class="text-white"
          ><small class="text-white mx-2">Privacy Policy</small>/</a
        >
        <a href="#" class="text-white"
          ><small class="text-white mx-2">Terms of Use</small>/</a
        >
        <a href="#" class="text-white"
          ><small class="text-white ms-2">Sales and Refunds</small></a
        >
      </div> -->
    </div>
  </div>
  <div class="container px-0">
    <nav class="navbar navbar-light bg-white navbar-expand-xl">
      <a href="/" class="navbar-brand"
        ><h1 class="text-primary display-6">Laptop Shop</h1></a
      >
      <button
        class="navbar-toggler py-2 px-3"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarCollapse"
      >
        <span class="fa fa-bars text-primary"></span>
      </button>
      <div
        class="collapse navbar-collapse bg-white justify-content-between"
        id="navbarCollapse"
      >
        <div class="navbar-nav">
          <a href="/" class="nav-item nav-link active">Trang Chủ</a>
          <a href="shop.html" class="nav-item nav-link">Sản Phẩm</a>
          <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              >Cá Nhân
            </a>
            <div class="dropdown-menu m-0 bg-secondary rounded-0">
              <a href="cart.html" class="dropdown-item">Giỏ Hàng</a>
              <a href="chackout.html" class="dropdown-item">Thanh Toán</a>
              <a href="testimonial.html" class="dropdown-item">Đánh Giá</a>
              <a href="/view/admin/error.jsp" class="dropdown-item">404 Page</a>
            </div>
          </div>
          <a href="contact.html" class="nav-item nav-link">Liên Hệ</a>
        </div>
        <div class="d-flex m-3 me-2">
          <div id="searchBox" class="d-flex">
            <input
              type="text"
              class="form-control me-2"
              placeholder="Tìm kiếm..."
              aria-label="Search"
            />
            <button
              class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
              id="searchButton"
            >
              <i class="fas fa-search text-primary"></i>
            </button>
          </div>
          <!-- kiểm tra người dùng có đăng nhập hay không -->
          <c:if test="${not empty pageContext.request.userPrincipal}">
            <a href="#" class="position-relative me-4 my-auto">
              <i class="fa fa-shopping-bag fa-2x"></i>
              <span
                class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                style="top: -5px; left: 15px; height: 20px; min-width: 20px"
                >3
              </span>
            </a>
            <div class="dropdown my-auto">
              <a
                href="#"
                class="dropdown"
                role="button"
                id="dropdownMenuLink"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <i class="fas fa-user fa-2x"></i>
              </a>
              <ul
                class="dropdown-menu dropdown-menu-end p-4"
                arialabelledby="dropdownMenuLink"
              >
                <li
                  class="d-flex align-items-center flex-column"
                  style="min-width: 200px"
                >
                  <img
                    style="
                      width: 100px;
                      height: 100px;
                      border-radius: 50%;
                      overflow: hidden;
                    "
                    src="/images/hieuvo.jpg"
                  />
                  <c:out value="${pageContext.request.userPrincipal.name}" />
                </li>
                <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                <li>
                  <hr class="dropdown-divider" />
                </li>
                <li>
                  <form action="/logout" method="post">
                    <input
                      type="hidden"
                      name="${_csrf.parameterName}"
                      value="${_csrf.token}"
                    />
                    <button class="dropdown-item btn">Đăng xuất</button>
                  </form>
                </li>
              </ul>
            </div>
          </c:if>
          <c:if test="${ empty pageContext.request.userPrincipal}">
            <div class="d-flex justify-content-between">
              <a
                href="/login"
                class="btn btn-primary rounded-pill shadow-sm hover-shadow me-2"
                >Đăng Nhập</a
              >
              <a
                href="/register"
                class="btn btn-outline-secondary rounded-pill shadow-sm hover-shadow"
                >Đăng Ký</a
              >
            </div>
          </c:if>
        </div>
      </div>
    </nav>
  </div>
</div>
