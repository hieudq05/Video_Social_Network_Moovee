<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/style.css" />
        <title>Document</title>
    </head>

    <style>
        body {
            justify-content: center;
            align-items: center;
            height: 100vh;
            gap: 1rem;
        }

        a {
            color: #fff;
            text-decoration: none;
        }
    </style>

    <body class="row flex-md-row flex-column">
        <a href="${pageContext.request.contextPath}/admin" class="col-md-auto col-sm-4 col-7 d-flex flex-column align-items-center bg-purple-custom bg-opacity-25 py-3 px-5 rounded-4">
            <i class="bi bi-person-badge-fill fs-1"></i>
            <div>Trình quản lý</div>
        </a>
        <a href="${pageContext.request.contextPath}/moovee" class="col-md-auto col-sm-4 col-7 d-flex flex-column align-items-center bg-purple-custom bg-opacity-25 py-3 px-5 rounded-4">
            <i class="bi bi-houses-fill fs-1"></i>
            <div class="">Trang chủ</div>
        </a>
        <script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    </body>
</html>
