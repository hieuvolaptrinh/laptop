<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Order - Hiếu Võ</title>
    <!-- này để tạo phân trang table nè -->
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="sb-nav-fixed">
    <!---------------------------------------------------------begin header--------------------------------------- -->
    <jsp:include page="../layout/header.jsp" />
    <!----------------------------------------------------------end  header--------------------------------------- -->
    <div id="layoutSidenav">
      <!-- --------------------------------------begin side bar ----------------------------------------------------->
      <jsp:include page="../layout/sidebar.jsp" />
      <!-- --------------------------------------end side bar ----------------------------------------------------->
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Trang quản trị</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/admin">Trang quản trị</a>
              </li>
              <li class="breadcrumb-item active">Trang quản trị</li>
            </ol>
          </div>
        </main>
        <!-- List order detail -->
        <div class="mt-5">
          <div class="row">
            <div class="col-12 mx-auto">
              <div class="d-flex justify-content-between mx-3">
                <h3>Danh sách đơn hàng</h3>
              </div>
              <hr />
              <table
                class="table table-hover table-striped col-12 col-md-9 col-lg-8 mx-auto"
              >
                <thead class="thead-light">
                  <tr class="table-success">
                    <th class="text-center">Mã đơn hàng</th>
                    <th class="text-center">Tổng tiền</th>
                    <th class="text-center">Tên người dùng</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center">Điều chỉnh</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="order" items="${orders}">
                    <tr class="table-light text-center">
                      <th>${order.id}</th>
                      <td>
                        <fmt:formatNumber
                          type="number"
                          value="${order.totalPrice}"
                        />
                        đ
                      </td>
                      <td>${order.user.fullName}</td>
                      <td>${order.status}</td>
                      <td>
                        <a
                          href="/admin/order/${order.id}"
                          class="btn btn-success"
                          >View</a
                        >
                        <a
                          href="/admin/order/update/${order.id}"
                          class="btn btn-warning mx-2"
                          >Update</a
                        >
                        <a
                          href="/admin/order/delete/${order.id}"
                          class="btn btn-danger"
                          >Delete</a
                        >
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- --------------------------------------begin side bar ----------------------------------------------------->
        <jsp:include page="../layout/footer.jsp" />
        <!-- --------------------------------------end side bar ----------------------------------------------------->
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
