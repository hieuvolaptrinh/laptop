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
            <h1 class="mt-4">Quản lý người dùng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/admin">Trang quản trị</a>
              </li>
              <li class="breadcrumb-item active">Người dùng</li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>Table users</h3>
                    <a href="/admin/user/create" class="btn btn-primary"
                      >Tạo mới người dùng</a
                    >
                  </div>

                  <hr />
                  <table
                    class="table table-hover table-striped col-12 col-md-9 col-lg-8 mx-auto"
                  >
                    <thead class="thead-light">
                      <tr class="table-success">
                        <th class="text-center">ID</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Tên</th>
                        <th class="text-center">Role</th>
                        <th class="text-center">Điều chỉnh</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="user" items="${usersArray}">
                        <tr>
                          <td>${user.id}</td>
                          <td>${user.email}</td>
                          <td>${user.fullName}</td>
                          <td>${user.role.roleName}</td>
                          <td
                            class="d-flex justify-content-around align-items-center"
                          >
                            <button class="btn btn-success">
                              <a
                                class="text-dark"
                                href="/admin/user/${user.id}"
                              >
                                <i class="fas fa-eye"></i> View</a
                              >
                            </button>
                            <button class="btn btn-warning mx-2">
                              <a href="/admin/user/update/${user.id}"
                                ><i class="fas fa-pencil-alt"></i> Update</a
                              >
                            </button>
                            <button class="btn btn-danger">
                              <a href="/admin/user/delete/${user.id}"
                                ><i class="fas fa-trash"></i> Delete</a
                              >
                            </button>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <!-- page -->
                  <nav aria-label="Page navigation example d-flex ">
                    <ul class="pagination justify-content-center">
                      <!-- previous page -->
                      <li class="page-item">
                        <a
                          class="${1 eq currentPage ? 'disabled page-link ' : 'page-link'}"
                          href="/admin/user?page=${currentPage-1}"
                          aria-label="Previous"
                        >
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <!-- render page index -->
                      <c:forEach
                        begin="0"
                        end="${totalPages-1}"
                        varStatus="loop"
                      >
                        <li class="page-item">
                          <!-- active pageNumber -->
                          <a
                            class="${(loop.index+1) eq currentPage ? 'active page-link ' : 'page-link'}"
                            href="/admin/user?page=${loop.index+1}"
                          >
                            ${loop.index+1}
                          </a>
                        </li>
                      </c:forEach>
                      <!-- next page -->
                      <li class="page-item">
                        <a
                          class="${totalPages eq currentPage ? 'disabled page-link ' : 'page-link'}"
                          href="/admin/user?page=${currentPage+1}"
                          aria-label="Next"
                        >
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">Next</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </main>
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
