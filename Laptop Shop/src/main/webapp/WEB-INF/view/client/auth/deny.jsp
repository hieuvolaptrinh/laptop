<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Access Denied</title>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      rel="stylesheet"
    />
    <style>
      body {
        background: linear-gradient(45deg, #4f4747, #f7f7f7);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
      }
      .error-container {
        text-align: center;
        padding: 40px;
        background: rgba(0, 0, 0, 0.838);
        border-radius: 20px;
        backdrop-filter: blur(10px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
      }
      .error-icon {
        font-size: 80px;
        color: #ff6b6b;
        margin-bottom: 20px;
        animation: pulse 2s infinite;
      }
      @keyframes pulse {
        0% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.1);
        }
        100% {
          transform: scale(1);
        }
      }
      .error-code {
        font-size: 72px;
        font-weight: bold;
        color: #ff6b6b;
        margin-bottom: 10px;
      }
      .error-message {
        font-size: 24px;
        margin-bottom: 30px;
        color: #dfe6e9;
      }
      .btn-custom {
        background: #ff6b6b;
        border: none;
        padding: 12px 30px;
        border-radius: 30px;
        font-weight: 600;
        transition: all 0.3s ease;
      }
      .btn-custom:hover {
        background: #ff5252;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
          <div class="error-container">
            <i class="fas fa-exclamation-triangle error-icon"></i>
            <div class="error-code">403</div>
            <div class="error-message">Truy cập bị từ chối!</div>
            <p class="mb-4">
              Xin lỗi, bạn không có quyền truy cập vào trang này.
            </p>
            <a href="/" class="btn btn-custom">
              <i class="fas fa-home me-2"></i>Về Trang Chủ
            </a>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
