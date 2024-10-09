<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- font awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
    <title>Table User</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between">
        <h1>Table User</h1>
        <div class="d-flex align-items-center">
          <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
        </div>
      </div>
    </div>
    <div class="container mt-5">
      <div class="row">
        <table
          class="table table-hover table-striped col-12 col-md-9 col-lg-8 mx-auto"
        >
          <thead class="thead-light">
            <tr class="table-success">
              <th class="text-center">ID</th>
              <th class="text-center">Email</th>
              <th class="text-center">Full Name</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${usersArray}">
              <tr>
                <td>${user.id}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td class="d-flex justify-content-around align-items-center">
                  <button class="btn btn-success">
                    <a class="text-dark" href="/admin/user/${user.id}">
                      <i class="fas fa-eye"></i> View</a
                    >
                  </button>
                  <button class="btn btn-warning mx-2">
                    <i class="fas fa-pencil-alt"></i> Update
                  </button>
                  <button class="btn btn-danger">
                    <i class="fas fa-trash"></i> Delete
                  </button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
