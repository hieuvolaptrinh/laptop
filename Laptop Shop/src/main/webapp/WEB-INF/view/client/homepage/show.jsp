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

    <!--  -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
    />
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

    <!-- Fruits Shop Start-->
    <!-- <div class="container-fluid fruite py-5">
      <div class="container py-5">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="col-lg-4 text-start">
              <h1>Our Organic Products</h1>
            </div>
            <div class="col-lg-8 text-end">
              <ul class="nav nav-pills d-inline-flex text-center mb-5">
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill active"
                    data-bs-toggle="pill"
                    href="#tab-1"
                  >
                    <span class="text-dark" style="width: 130px"
                      >All Products</span
                    >
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex py-2 m-2 bg-light rounded-pill"
                    data-bs-toggle="pill"
                    href="#tab-2"
                  >
                    <span class="text-dark" style="width: 130px"
                      >Vegetables</span
                    >
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill"
                    data-bs-toggle="pill"
                    href="#tab-3"
                  >
                    <span class="text-dark" style="width: 130px">Fruits</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill"
                    data-bs-toggle="pill"
                    href="#tab-4"
                  >
                    <span class="text-dark" style="width: 130px">Bread</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill"
                    data-bs-toggle="pill"
                    href="#tab-5"
                  >
                    <span class="text-dark" style="width: 130px">Meat</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-5.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Grapes</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-5.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Grapes</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-2.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Raspberries</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-4.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Apricots</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-3.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Banana</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-1.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Oranges</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-2.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Raspberries</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-5.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Grapes</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-2" class="tab-pane fade show p-0">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-5.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Grapes</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-2.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Raspberries</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-3" class="tab-pane fade show p-0">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-1.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Oranges</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-6.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Apple</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-4" class="tab-pane fade show p-0">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-5.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Grapes</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-4.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Apricots</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-5" class="tab-pane fade show p-0">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-3.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Banana</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-2.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Raspberries</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                      <div class="rounded position-relative fruite-item">
                        <div class="fruite-img">
                          <img
                            src="/client/img/fruite-item-1.jpg"
                            class="img-fluid w-100 rounded-top"
                            alt=""
                          />
                        </div>
                        <div
                          class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                          style="top: 10px; left: 10px"
                        >
                          Fruits
                        </div>
                        <div
                          class="p-4 border border-secondary border-top-0 rounded-bottom"
                        >
                          <h4>Oranges</h4>
                          <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit sed do eiusmod te incididunt
                          </p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              $4.99 / kg
                            </p>
                            <a
                              href="#"
                              class="btn border border-secondary rounded-pill px-3 text-primary"
                              ><i
                                class="fa fa-shopping-bag me-2 text-primary"
                              ></i>
                              Add to cart</a
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- Fruits Shop End-->

    <!-- Vesitable Shop Start-->
    <div class="container-fluid fruite">
      <div class="container py-5">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="col-lg-4 text-start">
              <h1>Sản phẩm nổi bật</h1>
            </div>
            <div class="col-lg-8 text-end">
              <ul class="nav nav-pills d-inline-flex text-center mb-5">
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill active text-decoration-none"
                    href="/shop"
                  >
                    <span class="text-dark" style="width: 130px"
                      >Tất cả sản phẩm</span
                    >
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <!-- duyệt qua mỗi sản phẩm từ csdl -->
                    <c:forEach var="product" items="${products}">
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
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
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4 style="font-size: 15px">
                              <a href="/product/${product.id}">
                                ${product.productName}</a
                              >
                            </h4>
                            <p style="font-size: 13px">${product.shortDesc}</p>
                            <div
                              class="d-flex justify-content-center flex-lg-wrap"
                            >
                              <p
                                class="text-dark fs-5 fw-bold mb-3"
                                style="
                                  font-size: 15px;
                                  text-align: center;
                                  width: 100%;
                                "
                              >
                                <fmt:formatNumber
                                  value="${product.price}"
                                  type="number"
                                />
                                đ
                              </p>
                              <!-- phải có cái này vì javaspring sử dụng scurity nó có 3 trường luôn
                    Csrf token: token ứng với lượt truy cập web của user. Cần token này để phòng tránh
                    CSRF (Cross Site Request Forgery) . Hiểu 1 cách đơn giản, là tăng độ an toàn cho
                    website của bạn 
                    -->
                              <!-- <form
                                method="post"
                                action="/add-product-to-cart/${product.id}"
                              >
                                <input
                                  type="hidden"
                                  name="${_csrf.parameterName}"
                                  value="${_csrf.token}"
                                />
                                <button
                                  href="#"
                                  class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"
                                >
                                  <i
                                    class="fa fa-shopping-bag me-2 text-primary"
                                  ></i>
                                  Mua Ngay
                                </button>
                              </form> -->

                              <!-- sửa để tối ưu UI UX -->
                              <button
                                data-product-id="${product.id}"
                                class="btnAddToCartHomePage mx-auto btn btn-primary border border-secondary"
                              >
                                Thêm vào giỏ hàng
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../layout/feature.jsp" />
    <!-- Vesitable Shop End -->

    <!-- Bestsaler Product Start -->
    <!-- <div class="container-fluid py-5">
      <div class="container py-5">
        <div class="text-center mx-auto mb-5" style="max-width: 700px">
          <h1 class="display-4">Bestseller Products</h1>
          <p>
            Latin words, combined with a handful of model sentence structures,
            to generate Lorem Ipsum which looks reasonable.
          </p>
        </div>
        <div class="row g-4">
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="/client/img/best-product-1.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="/client/img/best-product-2.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="/client/img/best-product-3.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="/client/img/best-product-4.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="/client/img/best-product-5.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="/client/img/best-product-6.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="/client/img/fruite-item-1.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-4">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="/product/${product.id}"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="/client/img/fruite-item-2.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-4">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="/product/${product.id}"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="/client/img/fruite-item-3.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-4">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="/product/${product.id}"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="/client/img/fruite-item-4.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-2">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="/product/${product.id}"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- Bestsaler Product End -->
    <!-- Tastimonial Start -->
    <div class="container-fluid testimonial py-5">
      <div class="container py-5">
        <div class="testimonial-s text-center">
          <h4 class="text-primary">Our Testimonial</h4>
          <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
        </div>
        <div class="owl-carousel testimonial-carousel">
          <div class="testimonial-item img-border-radius bg-light rounded p-4">
            <div class="position-relative">
              <i
                class="fa fa-quote-right fa-2x text-secondary position-absolute"
                style="bottom: 30px; right: 0"
              ></i>
              <div class="mb-4 pb-4 border-bottom border-secondary">
                <p class="mb-0">
                  Lorem Ipsum is simply dummy text of the printing Ipsum has
                  been the industry's standard dummy text ever since the 1500s,
                </p>
              </div>
              <div class="d-flex align-items-center flex-nowrap">
                <div class="bg-secondary rounded">
                  <img
                    src="/client/img/testimonial-1.jpg"
                    class="img-fluid rounded"
                    style="width: 100px; height: 100px"
                    alt=""
                  />
                </div>
                <div class="ms-4 d-block">
                  <h4 class="text-dark">Client Name</h4>
                  <p class="m-0 pb-3">Profession</p>
                  <div class="d-flex pe-5">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="testimonial-item img-border-radius bg-light rounded p-4">
            <div class="position-relative">
              <i
                class="fa fa-quote-right fa-2x text-secondary position-absolute"
                style="bottom: 30px; right: 0"
              ></i>
              <div class="mb-4 pb-4 border-bottom border-secondary">
                <p class="mb-0">
                  Lorem Ipsum is simply dummy text of the printing Ipsum has
                  been the industry's standard dummy text ever since the 1500s,
                </p>
              </div>
              <div class="d-flex align-items-center flex-nowrap">
                <div class="bg-secondary rounded">
                  <img
                    src="/client/img/testimonial-1.jpg"
                    class="img-fluid rounded"
                    style="width: 100px; height: 100px"
                    alt=""
                  />
                </div>
                <div class="ms-4 d-block">
                  <h4 class="text-dark">Client Name</h4>
                  <p class="m-0 pb-3">Profession</p>
                  <div class="d-flex pe-5">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="testimonial-item img-border-radius bg-light rounded p-4">
            <div class="position-relative">
              <i
                class="fa fa-quote-right fa-2x text-secondary position-absolute"
                style="bottom: 30px; right: 0"
              ></i>
              <div class="mb-4 pb-4 border-bottom border-secondary">
                <p class="mb-0">
                  Lorem Ipsum is simply dummy text of the printing Ipsum has
                  been the industry's standard dummy text ever since the 1500s,
                </p>
              </div>
              <div class="d-flex align-items-center flex-nowrap">
                <div class="bg-secondary rounded">
                  <img
                    src="/client/img/testimonial-1.jpg"
                    class="img-fluid rounded"
                    style="width: 100px; height: 100px"
                    alt=""
                  />
                </div>
                <div class="ms-4 d-block">
                  <h4 class="text-dark">Client Name</h4>
                  <p class="m-0 pb-3">Profession</p>
                  <div class="d-flex pe-5">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
  </body>
</html>
