<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
    <title>Document</title>
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
          class="col-xl-8 col-lg-8 mx-auto col-8 table table-hover table-dark table-striped"
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
            <tr>
              <td>1</td>
              <td>Mark</td>
              <td>Otto</td>
              <td class="d-flex justify-content-around align-items-center">
                <button class="btn btn-success">View</button>
                <button class="btn btn-warning mx-2">Update</button>
                <button class="btn btn-danger">Delete</button>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>Jacob</td>
              <td>Thornton</td>
              <td class="d-flex justify-content-around align-items-center">
                <button class="btn btn-success">View</button>
                <button class="btn btn-warning mx-2">Update</button>
                <button class="btn btn-danger">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
