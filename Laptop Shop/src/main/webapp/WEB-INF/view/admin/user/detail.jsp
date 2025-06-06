<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Detail User - Hiếu Võ</title>
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
            <h1 class="mt-4">Quản lý người dùng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/admin">Trang quản trị</a>
              </li>
              <li class="breadcrumb-item active">Người dùng</li>
            </ol>
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>Thông tin người dùng: ${id}</h3>
                  </div>

                  <hr />

                  <div class="card" style="width: 60%">
                    <div class="card-header">Thông tin người dùng</div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">ID: ${user.id}</li>
                      <li class="list-group-item">
                        Role: ${user.role.roleName}
                      </li>
                      <li class="list-group-item">Email: ${user.email}</li>
                      <li class="list-group-item">Tên: ${user.fullName}</li>
                      <li class="list-group-item">Địa chỉ: ${user.address}</li>
                      <li class="list-group-item">
                        <c:if test="${not empty user.avatar}">
                          <img
                            src="${pageContext.request.contextPath}/images/avatar/${user.avatar}"
                            alt="Avatar"
                            style="max-width: 150px; max-height: 150px"
                          />
                        </c:if>
                        <c:if test="${empty user.avatar}">
                          <p>avater is empty</p>
                        </c:if>
                      </li>
                    </ul>
                  </div>
                  <a href="/admin/user" class="btn btn-success mt-3">Back</a>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <!-- --------------------------------------begin footer ----------------------------------------------------->
    <jsp:include page="../layout/footer.jsp" />
    <!-- --------------------------------------end footer ----------------------------------------------------->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
