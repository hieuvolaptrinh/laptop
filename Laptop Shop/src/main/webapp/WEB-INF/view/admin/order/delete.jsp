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

    <title>Quản Lý Đơn Hàng</title>
    <!-- này để tạo phân trang table nè -->
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />

    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Orders</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/admin">Trang quản trị</a>
              </li>
              <li class="breadcrumb-item">
                <a href="/admin/order">Dơn hàng</a>
              </li>
              <li class="breadcrumb-item active">Xóa</li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>Xóa mã đơn ${id}</h3>
                  </div>

                  <hr />
                  <div class="alert alert-danger">
                    Bạn có chắc chắn muốn xóa đơn hàng này không?
                  </div>
                  <form:form
                    method="post"
                    action="/admin/order/delete"
                    modelAttribute="newOrder"
                  >
                    <div class="mb-3" style="display: none">
                      <label class="form-label">Id:</label>
                      <form:input
                        value="${id}"
                        type="text"
                        class="form-control"
                        path="id"
                      />
                    </div>
                    <button class="btn btn-danger">Confirm</button>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </main>
        <!-- --------------------------------------begin side footer ----------------------------------------------------->
        <jsp:include page="../layout/footer.jsp" />
        <!-- --------------------------------------end side footer ----------------------------------------------------->
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
