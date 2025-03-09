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

    <title>Dashboard - Hiếu Võ</title>
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
              <li class="breadcrumb-item active">Thống Kê</li>
            </ol>
            <div class="row">
              <!-- user -->
              <div class="col-xl-4 col-md-4">
                <div class="card bg-primary text-white mb-4">
                  <div class="card-body"><h4>Người dùng ${cuontUser}</h4></div>
                  <div
                    class="card-footer d-flex align-items-center justify-content-between"
                  >
                    <a
                      class="small text-white stretched-link"
                      href="/admin/user"
                      >Xem chi tiết</a
                    >
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>
              <!-- product -->
              <div class="col-xl-4 col-md-4">
                <div class="card bg-info text-white mb-4">
                  <div class="card-body"><h4>Sản phẩm ${countProduct}</h4></div>
                  <div
                    class="card-footer d-flex align-items-center justify-content-between"
                  >
                    <a
                      class="small text-white stretched-link"
                      href="/admin/product"
                      >Xem chi tiết</a
                    >
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>
              <!-- product -->
              <div class="col-xl-4 col-md-4">
                <div class="card bg-dark text-white mb-4">
                  <div class="card-body"><h4>Đơn hàng: ${countOrder}</h4></div>
                  <div
                    class="card-footer d-flex align-items-center justify-content-between"
                  >
                    <a
                      class="small text-white stretched-link"
                      href="/admin/order"
                      >Xem chi tiết</a
                    >
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xl-6">
                <div class="card mb-4">
                  <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    Thông tin tại chính
                  </div>
                  <div class="card-body">
                    <canvas id="myAreaChart" width="100%" height="40"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-xl-6">
                <div class="card mb-4">
                  <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Tăng trưởng doanh thu
                  </div>
                  <div class="card-body">
                    <canvas id="myBarChart" width="100%" height="40"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
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
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/chart-area-demo.js"></script>
    <script src="/js/chart-bar-demo.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/datatables-simple-demo.js"></script>
  </body>
</html>
