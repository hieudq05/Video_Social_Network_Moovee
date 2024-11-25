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
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/views/style.css"
        />
        <title>Document</title>
    </head>
    <body>
        <div class="login-container">
            <div
                class="container bg-dark-subtle col-xl-4 col-md-6 col-10 mx-auto rounded-4 p-5 pb-4"
            >
                <div class="fs-5 pb-5 text-center text-light">
                    Đăng ký tài khoản mới
                </div>
                <div>
                    <form
                        action="${pageContext.request.contextPath}/signup"
                        method="post"
                        class="row gap-3"
                    >
                        <div class="position-relative">
                            <label
                                for="name"
                                class="fs-9 px-3 py-2 fw-light position-absolute text-secondary"
                                >Họ và tên</label
                            >
                            <div class="d-flex align-items-center">
                                <input
                                    type="text"
                                    class="form-control pt-4 pe-5 fs-6 fw-light pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                                    id="name"
                                    name="fullname"
                                    placeholder="Nhập họ và tên của bạn"
                                />
                                <i
                                    style="right: 25px"
                                    class="bi bi-person position-absolute text-secondary fs-4"
                                ></i>
                            </div>
                        </div>
                        <div class="position-relative">
                            <label
                                for="email"
                                class="fs-9 px-3 py-2 fw-light position-absolute text-secondary"
                                >Email</label
                            >
                            <div class="d-flex align-items-center">
                                <input
                                    type="email"
                                    class="form-control fs-6 fw-light pe-5 pt-4 pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                                    id="email"
                                    name="email"
                                    placeholder="Nhập email của bạn"
                                />
                                <span
                                    class="material-symbols-outlined position-absolute text-secondary"
                                    style="right: 25px"
                                >
                                    alternate_email
                                </span>
                            </div>
                            <div
                                class="text-danger fs-8 mt-1"
                                id="emailCheckStatus"
                            ></div>
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
                                    class="form-control fs-6 fw-light pt-4 pb-2 px-3 rounded-3 flex-fill border-dark-subtle"
                                    id="password"
                                    name="password"
                                    placeholder="Tạo một mât khẩu"
                                />
                                <span
                                    class="material-symbols-outlined position-absolute text-secondary"
                                    style="right: 25px"
                                >
                                    lock
                                </span>
                            </div>
                            <div
                                class="px-2 mt-2 fs-9 text-white-50 fw-light"
                                id="password-require"
                            >
                                <div class="d-flex align-items-center">
                                    <div
                                        style="width: 5px; height: 5px"
                                        class="bg-danger rounded-circle me-1"
                                    ></div>
                                    Mật khẩu phải chứa ít nhất 8 ký tự bao gồm
                                    chữ cái và số
                                </div>
                                <div class="d-flex align-items-center">
                                    <div
                                        style="width: 5px; height: 5px"
                                        class="bg-danger rounded-circle me-1"
                                    ></div>
                                    Mật khẩu phải chứa ít nhất 1 ký tự in hoa
                                </div>
                            </div>
                        </div>
                        <div class="row mx-0 mt-3 gap-3">
                            <button
                                type="submit"
                                id="btn-signup"
                                class="btn bg-white text-dark fs-7 fw-medium rounded-3 py-2 border-0"
                            >
                                Đăng ký
                            </button>
                            <a
                                href="#"
                                id="btn-signup-google"
                                class="btn disabled bg-dark text-light fs-7 fw-light rounded-3 py-2 d-flex align-items-center justify-content-center gap-2 border-dark-subtle"
                            >
                                <img
                                    src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png"
                                    alt="logo_google"
                                    style="height: 1.2rem"
                                />
                                Hoặc đăng ký bằng Google
                            </a>
                        </div>
                        <div class="fs-7 text-center text-light py-3 fw-light">
                            Bạn đã có tài khoản?
                            <a
                                href="${pageContext.request.contextPath}/login"
                                class="text-purple"
                                >Đăng nhập</a
                            >
                        </div>
                    </form>
                </div>
            </div>
            <a
                onclick="window.history.back()"
                class="btn d-flex justify-content-center align-items-center bg-dark-subtle rounded-4 py-2 border-0"
                style="width: fit-content"
            >
                <span class="material-symbols-outlined fs-3"> arrow_back </span>
            </a>
        </div>
        <script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <script>
        const regexMail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        const regexPassword =
            /^(?=(.*[A-Z]))(?=(.*[a-zA-Z]))(?=(.*\d))[a-zA-Z\d]{8,}$/;
        const regexUppercase = /[A-Z]/;
        const regexLengthAndAlphaNum = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
        const passwordRequire = document.getElementById("password-require");
        const name = document.getElementById("name");
        const email = document.getElementById("email");
        const password = document.getElementById("password");
        const btnSignup = document.getElementById("btn-signup");
        const btnSignupGoogle = document.getElementById("btn-signup-google");
        const formSignup = document.getElementById("form-signup");
        const emailCheckStatus = document.getElementById("emailCheckStatus");

        btnSignup.disabled = true;

        password.addEventListener("input", () => {
            if (
                email.value !== "" &&
                regexMail.test(email.value) &&
                password.value !== "" &&
                regexPassword.test(password.value) &&
                name.value !== ""
            ) {
                btnSignup.disabled = false;
            }

            if (regexUppercase.test(password.value)) {
                passwordRequire.children[1].children[0].classList.remove(
                    "bg-danger"
                );
                passwordRequire.children[1].children[0].classList.add(
                    "bg-success"
                );
            } else {
                passwordRequire.children[1].children[0].classList.remove(
                    "bg-success"
                );
                passwordRequire.children[1].children[0].classList.add(
                    "bg-danger"
                );
            }

            if (regexLengthAndAlphaNum.test(password.value)) {
                passwordRequire.children[0].children[0].classList.remove(
                    "bg-danger"
                );
                passwordRequire.children[0].children[0].classList.add(
                    "bg-success"
                );
            } else {
                passwordRequire.children[0].children[0].classList.remove(
                    "bg-success"
                );
                passwordRequire.children[0].children[0].classList.add(
                    "bg-danger"
                );
            }
        });

        name.addEventListener("input", () => {
            if (
                email.value !== "" &&
                regexMail.test(email.value) &&
                password.value !== "" &&
                regexPassword.test(password.value) &&
                name.value !== ""
            ) {
                btnSignup.disabled = false;
            }
        });

        email.addEventListener("focusout", () => {
            const data = {
                email: email.value,
            };
            const query = new URLSearchParams(data);
            const options = {
                method: "GET",
            };
            const url =
                "${pageContext.request.contextPath}/signup/checkExistEmail?" +
                query;
            fetch(url, options)
                .then((response) => {
                    return response.json();
                })
                .then((data) => {
                    if (data.isExistEmail == "false") {
                        email.classList.remove("border-danger");
                        email.classList.add("border-dark-subtle");
                        emailCheckStatus.innerHTML = "";
                    } else {
                        email.classList.add("border-danger");
                        email.classList.remove("border-dark-subtle");
                        emailCheckStatus.innerHTML =
                            "Email đã tồn tại trong hệ thống";
                    }

                    if (
                        email.value !== "" &&
                        regexMail.test(email.value) &&
                        password.value !== "" &&
                        regexPassword.test(password.value) &&
                        name.value !== ""
                        && data.isExistEmail == "false"
                    ) {
                        btnSignup.disabled = false;
                    }
                })
                .catch((error) => {
                    console.error("Error:", error);
                });
        });
    </script>
</html>
