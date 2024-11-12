<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/11/24
  Time: 09:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8 %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link
          rel="stylesheet"
          href="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/css/bootstrap.min.css"
  />
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,300,0,0"
  />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/style/style.css" />
  <title>Moove - Đăng nhập</title>
</head>
<body class="row bg-dark-subtle">
<div class="container bg-dark-custom col-xl-4 col-md-6 col-10 mx-auto rounded-4 p-5 pb-4">
  <div class="fs-5 pb-5 text-center text-light">
    Đăng nhập vào MOOVE
  </div>
  <form action="" method="post" class="row gap-3">
    <div class="position-relative">
      <label
              for="emailInput"
              class="fs-9 px-3 py-2 fw-light position-absolute text-secondary"
      >Email</label
      >
      <div class="d-flex align-items-center">
        <input
                type="email"
                class="form-control fs-6 fw-light pe-5 pt-4 pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                id="emailInput"
                placeholder="Nhập email của bạn"
        />
        <span
                class="material-symbols-outlined position-absolute text-secondary"
                style="right: 25px"
        >
                            alternate_email
                        </span>

      </div>
    </div>
    <div class="position-relative">
      <label
              for="passwordInput"
              class="fs-9 px-3 py-2 fw-light position-absolute text-secondary"
      >Mật khẩu</label
      >
      <div class="d-flex align-items-center">
        <input
                type="password"
                class="form-control fs-6 fw-light pe-5 pt-4 pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                id="passwordInput"
                placeholder="Nhập mật khẩu của bạn"
        />
        <span
                class="material-symbols-outlined position-absolute text-secondary"
                style="right: 25px"
        >
                            key_vertical
                        </span>

      </div>
    </div>
    <div class="row mx-0 mt-3 gap-3">
      <button
              type="button"
              class="btn bg-white text-dark fs-7 fw-medium rounded-3 py-2 border-0"
      >
        Đăng nhập
      </button>
      <button
              type="button"
              class="btn bg-dark text-light fs-7 fw-light rounded-3 py-2 d-flex align-items-center justify-content-center gap-2 border-dark-subtle"
      >
        <img
                src="${pageContext.request.contextPath}/views/imgs/Google__G__logo.svg.png"
                alt="logo_google"
                style="height: 1.2rem"
        />
        Hoặc đăng nhập bằng Google
      </button>
    </div>
    <div class="fs-7 text-center text-light py-3 fw-light">
      Bạn đã có tài khoản?
      <a href="${pageContext.request.contextPath}/views/signup.jsp" class="text-purple">Đăng ký</a>
    </div>
  </form>
</div>
<a
        href="${pageContext.request.contextPath}/views/index.jsp"
        class="btn d-flex justify-content-center align-items-center bg-dark rounded-4 py-2 border-0"
        style="width: fit-content"
>
  <span class="material-symbols-outlined fs-3"> arrow_back </span>
</a>
<script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
