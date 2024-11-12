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
              <li class="breadcrumb-item active">Products</li>
            </ol>
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="row">
                    <div class="d-flex justify-content-between">
                      <h3>Sản phẩm: ${product.productName}</h3>
                    </div>
                    <hr />
                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="card">
                        <div class="card-header">Thông tin sản phẩm</div>
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">
                            ID: ${product.productId}
                          </li>
                          <li class="list-group-item">
                            Price : ${product.price}
                          </li>
                          <li class="list-group-item">
                            Detail description: ${product.detailDesc}
                          </li>
                          <li class="list-group-item">
                            Short description: ${product.shortDesc}
                          </li>
                          <li class="list-group-item">
                            Quantity: ${product.quantity}
                          </li>
                          <li class="list-group-item">Sold: ${product.sold}</li>
                          <li class="list-group-item">
                            Factory: ${product.factory}
                          </li>
                          <li class="list-group-item">
                            Target: ${product.target}
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6">
                      <c:if test="${not empty product.image}">
                        <img
                          src="${pageContext.request.contextPath}/images/product/${product.image}"
                          alt="Avatar"
                          style="max-width: 100%; max-height: 100%"
                        />
                      </c:if>
                      <c:if test="${empty product.image}">
                        <p>Image is empty</p>
                      </c:if>
                    </div>
                  </div>
                  <hr />
                  <a href="/admin/product" class="btn btn-success mt-3">Back</a>
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
