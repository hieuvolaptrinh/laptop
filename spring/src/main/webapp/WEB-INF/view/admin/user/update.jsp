<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update User</title>
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
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center mt-5">
        <div class="col-xxl-10 col-lg-9 col-md-8 col-sm-10 col-12 mx-auto">
          <h2 class="text-center mb-4">Update User</h2>
          <form:form
            method="post"
            action="/admin/user/update"
            modelAttribute="user"
          >
            <div class="mb-3 d-none">
              <label for="password" class="form-label">Id</label>
              <form:input id="id" type="text" class="form-control" path="id" />
            </div>
            <!-- Email -->
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <form:input
                type="email"
                class="form-control"
                path="email"
                disabled="true"
              />
            </div>
            <!-- Full Name -->
            <div class="mb-3">
              <label for="fullName" class="form-label">Full Name</label>
              <form:input type="text" class="form-control" path="fullName" />
            </div>

            <!-- Address -->
            <div class="mb-3">
              <label for="address" class="form-label">Address</label>
              <form:input type="text" class="form-control" path="address" />
            </div>

            <!-- Phone -->
            <div class="mb-3">
              <label for="phone" class="form-label">Phone Number</label>
              <form:input type="tel" class="form-control" path="phone" />
            </div>
            <!-- Submit Button -->
            <div class="d-grid">
              <button class="btn btn-danger">
                <a href="/admin/user">Update</a>
              </button>
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
