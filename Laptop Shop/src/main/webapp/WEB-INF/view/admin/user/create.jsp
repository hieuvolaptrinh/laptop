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
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create User</title>
    <link href="/css/styles.css" rel="stylesheet" />

    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>

    <!-- preview image when upload file  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
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
            <div class="mt-5">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>Tạo mới tài khoản</h3>
                  <hr />
                  <form:form
                    method="post"
                    action="/admin/user/create"
                    modelAttribute="newUser"
                    class="row"
                    enctype="multipart/form-data"
                  >
                    <!--  enctype="multipart/form-data" để mình có thể tương tác được với file-->
                    <!-- email -->
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorEmail">
                        <form:errors path="email" cssClass="is-invalid" />
                      </c:set>
                      <label class="form-label">Email:</label>
                      <form:input
                        type="email"
                        class="form-control ${not empty errorEmail ? 'is-invalid':'' }"
                        path="email"
                      />
                      <td>
                        <form:errors path="email" cssClass="invalid-feedback" />
                      </td>
                    </div>
                    <!-- password -->
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorPassWord">
                        <form:errors path="password" cssClass="is-invalid" />
                      </c:set>
                      <label class="form-label">Mật khẩu:</label>
                      <form:input
                        type="password"
                        class="form-control ${not empty errorPassWord ? 'is-invalid':'' }"
                        path="password"
                      />
                      <td>
                        <form:errors
                          path="password"
                          cssClass="invalid-feedback"
                        />
                      </td>
                    </div>
                    <!-- phone number -->
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorPhone">
                        <form:errors path="phone" cssClass="is-invalid" />
                      </c:set>
                      <label class="form-label">Số điện thoại:</label>
                      <form:input
                        type="text"
                        class="form-control ${not empty errorPhone ? 'is-invalid':'' }"
                        path="phone"
                      />
                      <td>
                        <form:errors path="phone" cssClass="invalid-feedback" />
                      </td>
                    </div>
                    <!-- full name -->
                    <c:set var="errorName">
                      <form:errors path="fullName" cssClass="is-invalid" />
                    </c:set>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Tên:</label>
                      <form:input
                        type="text"
                        class="form-control ${not empty errorName ? 'is-invalid':'' }"
                        path="fullName"
                      />
                      <td>
                        <form:errors
                          path="fullName"
                          cssClass="invalid-feedback"
                        />
                      </td>
                    </div>
                    <div class="mb-3 col-12">
                      <label class="form-label">Địa chỉ:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="address"
                      />
                    </div>
                    <!-- -----------------------------------role ------------------------------------------->
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Quyền:</label>
                      <form:select class="form-select" path="role.roleName">
                        <form:option value="ADMIN">ADMIN</form:option>
                        <form:option value="USER">USER</form:option>
                      </form:select>
                    </div>
                    <!-- -----------------------------------avatar ------------------------------------------->
                    <div class="mb-3 col-12 col-md-6">
                      <label for="avatarFile" class="form-label">Avatar:</label>
                      <input
                        name="hieuvoFile"
                        class="form-control"
                        type="file"
                        id="avatarFile"
                        multiple
                        accept=".png, .jpg, .jpeg"
                      />
                      <!-- phải có type là file mới upload được file -->
                      <!-- bên csdl mình đâu có để biến gì để lưu file đâu
                                     nên bên này mình không sử dung path để lưu
                                     mình sử dụng luôn là name -->
                    </div>
                    <!-- preview avatar -->
                    <div class="col-12 mb-3">
                      <img
                        style="max-height: 250px; display: none"
                        alt="avatar preview"
                        id="avatarPreview"
                      />
                    </div>
                    <div class="col-12 mb-5">
                      <button type="submit" class="btn btn-primary">
                        Create
                      </button>
                    </div>
                  </form:form>
                </div>
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
