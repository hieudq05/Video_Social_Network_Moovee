<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/style.css"/>
    <title>Document</title>
</head>
<body>
<div class="login-container">
    <div
            class="container bg-dark-subtle col-xl-4 col-md-6 col-10 mx-auto rounded-4 p-5 pb-4"
    >
        <div class="fs-5 pb-5 fw-medium text-center text-light">
            Đăng nhập vào MOOVE
        </div>
        <div>
            <div class="fs-8 mb-2 text-danger">${error}</div>
            <form
                    action="${pageContext.request.contextPath}/login"
                    method="post"
                    class="row gap-3"
                    id="form-login"
            >
                <div class="position-relative">
                    <label
                            for="email"
                            class="fs-9 px-3 py-2 fw-light position-absolute text-secondary"
                    >Email</label
                    >
                    <div class="d-flex align-items-center">
                        <input
                                type="text"
                                class="form-control fs-6 fw-light pe-5 pt-4 pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                                id="email"
                                name="email"
                                placeholder="Nhập email"
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
                            for="password"
                            class="fs-9 px-3 py-2 fw-light position-absolute text-secondary"
                    >Mật khẩu</label
                    >
                    <div class="d-flex align-items-center">
                        <input
                                type="password"
                                class="form-control fs-6 fw-light pe-5 pt-4 pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                                id="password"
                                name="password"
                                placeholder="Nhập mật khẩu"
                        />
                        <span
                                class="material-symbols-outlined position-absolute text-secondary"
                                style="right: 25px"
                        >
                                        lock
                                    </span>
                    </div>
                </div>
                <div class="row mx-0 mt-3 gap-3">
                    <button
                            id="btn-login"
                            type="submit"
                            class="btn bg-white text-dark fs-7 fw-medium rounded-3 py-2 border-0"
                    >
                        Đăng nhập
                    </button>
                    <button
                            id="btn-login-google"
                            type="button"
                            class="btn disabled bg-dark text-light fs-7 fw-light rounded-3 py-2 d-flex align-items-center justify-content-center gap-2 border-dark-subtle"
                    >
                        <img
                                src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png"
                                alt="logo_google"
                                style="height: 1.2rem"
                        />
                        Hoặc đăng nhập bằng Google
                    </button>
                </div>
                <div
                        class="fs-7 text-center text-light py-3 fw-light"
                >
                    Bạn chưa có tài khoản?
                    <a href="${pageContext.request.contextPath}/signup" class="text-purple"
                    >Đăng ký</a
                    >
                </div>
            </form>
        </div>
    </div>

    <a
            href="${pageContext.request.contextPath}/moovee"
            class="btn d-flex justify-content-center align-items-center bg-dark-subtle rounded-4 py-2 border-0"
            style="width: fit-content"
    >
        <span class="material-symbols-outlined fs-3"> arrow_back </span>
    </a>
</div>
<script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
    const message = document.getElementById("message");
    const messageContent = document.getElementById("message-content");
    const email = document.getElementById("email");
    const password = document.getElementById("password");
    const btnLogin = document.getElementById("btn-login");
    const btnLoginGoogle = document.getElementById("btn-login-google");
    const formLogin = document.getElementById("form-login");
    const regexMail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    const regexPassword =
        /^(?=(.*[A-Z]))(?=(.*[a-zA-Z]))(?=(.*\d))[a-zA-Z\d]{8,}$/;
    const regexUppercase = /[A-Z]/;
    const regexLengthAndAlphaNum = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    const passwordRequire = document.getElementById("password-require");

    btnLogin.disabled = true;

    email.addEventListener("input", () => {
        if (email.value !== "" && password.value !== "") {
            btnLogin.disabled = false;
        }
    });

    password.addEventListener("input", () => {
        if (email.value !== "" && password.value !== "") {
            btnLogin.disabled = false;
        }
    });
</script>
</html>
