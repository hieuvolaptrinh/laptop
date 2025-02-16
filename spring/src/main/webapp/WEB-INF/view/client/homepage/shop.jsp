z<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!-- format kiểu dữ liệu double nếu số nó dài quá  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet" />
    <title>Home</title>
  </head>

  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <jsp:include page="../layout/banner.jsp" />

    <!-- Vesitable Shop Start-->
    <div class="container-fluid fruite">
      <div class="container py-5">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="mb-3">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Tất cả sản phẩm
                  </li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
              <div class="row g-4">
                <div class="col-md-4 col-12">
                  <div class="row g-4">
                    <!-- factory -->
                    <div class="col-12 text-start">
                      <div class="mb-2"><b>Hãng sản xuất</b></div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="factory-1"
                          value="APPLE"
                        />
                        <label class="form-check-label" for="factory-1"
                          >Apple</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="factory-2"
                          value="ASUS"
                        />
                        <label class="form-check-label" for="factory-2"
                          >Asus</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="factory-3"
                          value="LENOVO"
                        />
                        <label class="form-check-label" for="factory-3"
                          >Lenovo</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="factory-4"
                          value="DELL"
                        />
                        <label class="form-check-label" for="factory-4"
                          >Dell</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="factory-5"
                          value="LG"
                        />
                        <label class="form-check-label" for="factory-5"
                          >LG</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="factory-6"
                          value="ACER"
                        />
                        <label class="form-check-label" for="factory-6"
                          >Acer</label
                        >
                      </div>
                    </div>
                    <!-- Price -->
                    <div class="col-12 text-start">
                      <div class="mb-2"><b>Mục đích</b></div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="tagert-1"
                          value="GAMING"
                        />
                        <label class="form-check-label" for="tagert-1"
                          >Gaming</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="tagert-1"
                          value="SINHVIEN-VANPHONG"
                        />
                        <label class="form-check-label" for="tagert-2"
                          >Sinh Viên - Văn Phòng
                        </label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="tagert-3"
                          value="THIET-KE-DO-HOA"
                        />
                        <label class="form-check-label" for="tagert-3"
                          >Thiết kế đồ họa
                        </label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="tagert-4"
                          value="MONG-NHE"
                        />
                        <label class="form-check-label" for="tagert-4"
                          >Mỏng Nhẹ
                        </label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="tagert-5"
                          value="MONG-NHE"
                        />
                        <label class="form-check-label" for="tagert-5"
                          >Doanh Nhân</label
                        >
                      </div>
                    </div>
                    <div class="col-12 text-start">
                      <div class="mb-2"><b>Mức Giá</b></div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="price-2"
                          value="duoi-10-trieu"
                        />
                        <label class="form-check-label" for="price-2"
                          >Dưới 10 triệu</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="price-3"
                          value="10-15-trieu"
                        />
                        <label class="form-check-label" for="price-3"
                          >Từ 10 - 15 triệu</label
                        >
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="price-4"
                          value="15-20-trieu"
                        />
                        <label class="form-check-label" for="price-4"
                          >Từ 15 - 20 triệu</label
                        >
                      </div>

                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="price-5"
                          value="tren-20-trieu"
                        />
                        <label class="form-check-label" for="price-5"
                          >Trên 20 triệu</label
                        >
                      </div>
                    </div>
                    <!-- SORT  -->
                    <div class="col-12 text-start">
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="radio"
                          name="flexRadioDefault"
                          id="gia-tang-dan"
                        />
                        <label class="form-check-label" for="gia-tang-dan">
                          Giá tăng dần
                        </label>
                      </div>
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="radio"
                          name="flexRadioDefault"
                          id="gia-giam-dan"
                          checked
                        />
                        <label class="form-check-label" for="gia-giam-dan">
                          Giá giảm dần
                        </label>
                      </div>
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="radio"
                          name="flexRadioDefault"
                          id="khong-sap-xep"
                          checked
                        />
                        <label class="form-check-label" for="khong-sap-xep">
                          Không sắp xếp
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <!--  -->

                <!--  -->
                <div class="col-md-8 col-12">
                  <div class="row g-4">
                    <!-- list product -->
                    <div class="col-12">
                      <div class="row">
                        <c:forEach var="product" items="${products}">
                          <div class="col-md-4 col-lg-4 col-xl-4 mt-2">
                            <div
                              class="rounded position-relative fruite-item d-flex flex-column"
                              style="height: 100%"
                            >
                              <div class="fruite-img">
                                <img
                                  src="/images/product/${product.image}"
                                  class="img-fluid w-100 rounded-top"
                                  alt=""
                                />
                              </div>
                              <div
                                class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px"
                              >
                                Laptop
                              </div>
                              <div
                                class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column justify-content-between"
                                style="flex: 1"
                              >
                                <h4
                                  class="text-truncate"
                                  style="font-size: 15px"
                                >
                                  <a
                                    href="/product/${product.id}"
                                    class="text-dark text-decoration-none"
                                    >${product.productName}</a
                                  >
                                </h4>
                                <p
                                  class="text-truncate"
                                  style="
                                    font-size: 13px;
                                    max-height: 40px;
                                    overflow: hidden;
                                    text-overflow: ellipsis;
                                  "
                                >
                                  ${product.shortDesc}
                                </p>
                                <div
                                  class="d-flex flex-column align-items-center mt-auto"
                                >
                                  <p
                                    class="text-dark fs-5 fw-bold mb-3"
                                    style="font-size: 15px; text-align: center"
                                  >
                                    <fmt:formatNumber
                                      value="${product.price}"
                                      type="number"
                                    />
                                    đ
                                  </p>
                                  <form
                                    method="post"
                                    action="/add-product-to-cart/${product.id}"
                                  >
                                    <input
                                      type="hidden"
                                      name="${_csrf.parameterName}"
                                      value="${_csrf.token}"
                                    />
                                    <button
                                      class="btn border border-secondary rounded-pill px-3 text-primary"
                                    >
                                      <i
                                        class="fa fa-shopping-bag me-2 text-primary"
                                      ></i>
                                      Add to cart
                                    </button>
                                  </form>
                                </div>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </div>
                    </div>
                    <!-- page -->
                    <div class="col-12">
                      <!-- page -->
                      <nav aria-label="Page navigation example ">
                        <ul
                          class="d-flex justify-content-center"
                          style="list-style: none"
                        >
                          <li
                            class="page-item ${1 eq currentPage ? 'disabled' : ''}"
                          >
                            <a
                              class="page-link rounded"
                              href="/shop?page=${currentPage-1}"
                              aria-label="Previous"
                              >&laquo;</a
                            >
                          </li>
                          <c:forEach
                            begin="0"
                            end="${totalPages-1}"
                            varStatus="loop"
                          >
                            <li
                              class="page-item ${ (loop.index+1) eq currentPage ? 'active' : '' }"
                            >
                              <a
                                class="page-link rounded text-truncate"
                                style="min-width: 40px"
                                href="/shop?page=${loop.index+1}"
                                >${loop.index+1}</a
                              >
                            </li>
                          </c:forEach>
                          <li
                            class="page-item ${totalPages eq currentPage ? 'disabled' : ''}"
                          >
                            <a
                              class="page-link rounded"
                              href="/shop?page=${currentPage+1}"
                              aria-label="Next"
                              >&raquo;</a
                            >
                          </li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../layout/feature.jsp" />

    <!-- Tastimonial End -->
    <!-- footer -->
    <jsp:include page="../layout/footer.jsp" />

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
  </body>
</html>
