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
    <title>Delete A User</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between">
        <h1>Delete a user with id: ${id}</h1>
      </div>
      <div class="alert alert-danger">Are you sure delete a user ?????</div>

      <form:form
        action="/admin/user/delete"
        method="post"
        modelAttribute="newUser"
      >
        <!--  -->
        <div class="mb-3 d-none">
          <label for="password" class="form-label">Id</label>
          <form:input
            value="${id}"
            id="id"
            type="text"
            class="form-control"
            path="id"
          />
        </div>
        <button class="btn btn-danger">Confirm</button>
      </form:form>
    </div>
  </body>
</html>
