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
    <title>Update a user - Hiếu Võ</title>
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
            <h1 class="mt-4">Manage Users</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Users</li>
            </ol>
          </div>
          <!-- update -->
          <div class="container">
            <div class="row justify-content-center mt-5">
              <div
                class="col-xxl-10 col-lg-9 col-md-8 col-sm-10 col-12 mx-auto"
              >
                <h2 class="text-center mb-4">Update User</h2>
                <form:form
                  method="post"
                  action="/admin/user/update"
                  modelAttribute="user"
                >
                  <div class="mb-3 d-none">
                    <label for="password" class="form-label">Id</label>
                    <form:input
                      id="id"
                      type="text"
                      class="form-control"
                      path="id"
                    />
                  </div>
                  <!-- Email -->
                  <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <form:input
                      type="email"
                      class="form-control"
                      path="email"
                      disabled="true"
                    />
                  </div>
                  <!-- Full Name -->
                  <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="fullName"
                    />
                  </div>

                  <!-- Address -->
                  <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="address"
                    />
                  </div>

                  <!-- Phone -->
                  <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <form:input type="tel" class="form-control" path="phone" />
                  </div>
                  <!-- Submit Button -->
                  <div class="d-grid">
                    <button class="btn btn-warning">
                      <a href="/admin/user">Update</a>
                    </button>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
