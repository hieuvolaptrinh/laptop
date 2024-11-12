<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>Update Product</title>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>

  <body class="sb-nav-fixed">
    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        const orgImage = "${newProduct.image}";
        console.log(orgImage);

        if (orgImage) {
          const urlImage = "/images/product/" + orgImage;
          $("#avatarPreview").attr("src", urlImage);
          $("#avatarPreview").css({ display: "block" });
        }

        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
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
            <h1 class="mt-4">Update Product</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div>
        </main>
        <!-- bảng sản phẩm  -->
        <div class="mt-5">
          <div class="row">
            <div class="col-md-6 col-12 mx-auto">
              <h3>Create new product</h3>
              <hr />
              <form:form
                method="post"
                action="/admin/product/update"
                class="row"
                enctype="multipart/form-data"
                modelAttribute="newProduct"
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
                  <label class="form-label">Short Detail Description:</label>
                  <form:input
                    type="text"
                    class="form-control ${not empty errorShortDetail ? 'is-invalid' : ''}"
                    path="shortDesc"
                  />
                  <td>
                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
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
                    <form:errors path="quantity" cssClass="invalid-feedback" />
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
                  <label for="productImage" class="form-label">Image:</label>
                  <input
                    class="form-control"
                    type="file"
                    id="avatarFile"
                    accept=".png, .jpg, .jpeg"
                    name="productImage"
                  />
                </div>
                <div class="col-12 mb-3">
                  <img
                    style="max-height: 250px; display: none"
                    alt="avatar preview"
                    id="avatarPreview"
                  />
                </div>
                <div class="col-12 mb-5">
                  <button type="submit" class="btn btn-warning">Update</button>
                </div>
              </form:form>
            </div>
          </div>
        </div>
        <!-- --------------------------------------begin footer ----------------------------------------------------->
        <jsp:include page="../layout/footer.jsp" />
        <!-- --------------------------------------end footer ----------------------------------------------------->
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
