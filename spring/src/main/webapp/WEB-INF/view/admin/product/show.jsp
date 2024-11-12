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

    <title>Manage Product</title>
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
            <h1 class="mt-4">Dashboard</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div>
        </main>
        <!-- bảng sản phẩm  -->
        <div class="mt-5">
          <div class="row">
            <div class="col-12 mx-auto">
              <div class="d-flex justify-content-between mx-3">
                <h3>List Product</h3>
                <a href="/admin/product/create" class="btn btn-primary"
                  >Create Product</a
                >
              </div>
              <hr />
              <table
                class="table table-hover table-striped col-12 col-md-9 col-lg-8 mx-auto"
              >
                <thead class="thead-light">
                  <tr class="table-success">
                    <th class="text-center">ProductID</th>
                    <th class="text-center">Product Name</th>
                    <th class="text-center">Product Price</th>
                    <th class="text-center">Factory</th>
                    <th class="text-center">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="product" items="${products}">
                    <tr>
                      <td>${product.productId}</td>
                      <td>${product.productName}</td>
                      <td>${product.price}</td>
                      <td>${product.factory}</td>
                      <td
                        class="d-flex justify-content-around align-items-center"
                      >
                        <button class="btn btn-success">
                          <a
                            class="text-dark"
                            href="/admin/product/${product.productId}"
                          >
                            <i class="fas fa-eye"></i> View</a
                          >
                        </button>
                        <button class="btn btn-warning mx-2">
                          <a href="/admin/product/update/${product.productId}"
                            ><i class="fas fa-pencil-alt"></i> Update</a
                          >
                        </button>
                        <button class="btn btn-danger">
                          <a href="/admin/product/delete/${product.productId}"
                            ><i class="fas fa-trash"></i> Delete</a
                          >
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
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
