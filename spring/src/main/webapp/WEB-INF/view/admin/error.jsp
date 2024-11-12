<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang Lỗi</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      .error-container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 40px;
        text-align: center;
        width: 80%;
        max-width: 600px;
      }
      .error-container h2 {
        color: #d9534f;
        font-size: 36px;
        margin-bottom: 20px;
      }
      .error-container p {
        color: #6c757d;
        font-size: 18px;
        margin-bottom: 30px;
      }
      .error-container a {
        text-decoration: none;
        color: #ffffff;
        background-color: #007bff;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
        transition: background-color 0.3s ease;
      }
      .error-container a:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <div class="error-container">
      <h2>Oops! Có gì đó không đúng.</h2>
      <p>${error}</p>
      <a href="/admin/product">Quay lại danh sách sản phẩm</a>
    </div>
  </body>
</html>
