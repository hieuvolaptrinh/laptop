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
    <title>Create New Product</title>
    <link href="/css/styles.css" rel="stylesheet" />

    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>

    <!-- preview image when upload file  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  </head>
  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Manage Product</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Product</li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>Create new product</h3>
                  <hr />
                  <form:form
                    method="post"
                    action="/admin/product/create"
                    modelAttribute="newProduct"
                    class="row"
                    enctype="multipart/form-data"
                  >
                    <!--  enctype="multipart/form-data" để mình có thể tương tác được với file-->
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorEmail">
                        <form:errors path="productName" cssClass="is-invalid" />
                      </c:set>
                      <!-- tên sp -->
                      <label class="form-label">Name Product</label>
                      <form:input
                        type="text"
                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                        path="productName"
                      />
                      <td>
                        <form:errors
                          path="productName"
                          cssClass="invalid-feedback"
                        />
                      </td>
                    </div>
                    <!-- giá -->
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorPrice">
                        <form:errors path="price" cssClass="is-invalid" />
                      </c:set>
                      <label class="form-label">Price:</label>
                      <form:input
                        type="text"
                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                        path="price"
                      />
                      <td>
                        <form:errors path="price" cssClass="invalid-feedback" />
                      </td>
                    </div>
                    <!-- miêu tả cụ thể -->
                    <div class="mb-3 col-12 col-md-12">
                      <label class="form-label">Detail description:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="detailDesc"
                      />
                    </div>
                    <!-- miêu tả ngắn -->
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorShortDetail">
                        <form:errors path="shortDesc" cssClass="is-invalid" />
                      </c:set>
                      <label class="form-label"
                        >Short Detail Description:</label
                      >
                      <form:input
                        type="text"
                        class="form-control ${not empty errorShortDetail ? 'is-invalid' : ''}"
                        path="shortDesc"
                      />
                      <td>
                        <form:errors
                          path="shortDesc"
                          cssClass="invalid-feedback"
                        />
                      </td>
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <c:set var="errorQuantity">
                        <form:errors path="quantity" cssClass="is-invalid" />
                      </c:set>
                      <label class="form-label">Quantity:</label>
                      <form:input
                        type="text"
                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                        path="quantity"
                      />
                      <td>
                        <form:errors
                          path="quantity"
                          cssClass="invalid-feedback"
                        />
                      </td>
                    </div>
                    <!-- -----------------------------------role ------------------------------------------->
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Factory:</label>
                      <form:select class="form-select" path="factory">
                        <form:option value="HP">HP</form:option>
                        <form:option value="ASUS">ASUS</form:option>
                        <form:option value="Apple">Apple(MacBook)</form:option>
                        <form:option value="ROG">ROG</form:option>
                        <form:option value="Lenovo">Lenovo</form:option>
                        <form:option value="Acer">Acer</form:option>
                      </form:select>
                    </div>
                    <!-- taget -->
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Target:</label>
                      <form:select class="form-select" path="target">
                        <form:option value="Văn Phòng">Văn Phòng</form:option>
                        <form:option value="Gaming">Gaming</form:option>
                        <form:option value="Thiết kế đồ họa"
                          >Thiết kế đồ họa</form:option
                        >
                        <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                        <form:option value="Doanh nhân">Doanh nhân</form:option>
                        <form:option value="Sinh Viên">Sinh Viên</form:option>
                      </form:select>
                    </div>
                    <!-- -----------------------------------avatar ------------------------------------------->
                    <div class="mb-3 col-12 col-md-6">
                      <label for="file" class="form-label">Image:</label>
                      <input
                        name="productImage"
                        class="form-control"
                        type="file"
                        id="file"
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
                        Create new product
                      </button>
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </main>
        <!-- footer -->
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
