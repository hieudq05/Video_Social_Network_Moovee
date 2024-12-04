<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <c:set value="${user}" var="user" />
        <c:set value="${sessionScope.get('user')}" var="userAuth"></c:set>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-md py-0 z-3 shadow-lg">
            <div class="container-fluid bg-dark-subtle px-3 py-3 rounded-0">
                <a
                    href="${pageContext.request.contextPath}/admin"
                    class="navbar-brand"
                    >Moove <span class="fw-medium">Admin</span></a
                >
                <button
                    class="navbar-toggler fs-7 py-2 rounded-4 shadow-none"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div
                    class="collapse navbar-collapse flex-grow-0 gap-3 w-fit"
                    id="navbarSupportedContent"
                >
                    <ul class="nav nav-pills d-flex" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4"
                                id="home"
                                data-bs-toggle="tab"
                                type="button"
                                role="tab"
                            >
                                Trang chủ
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                class="pointer nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4 active"
                                id="user"
                                data-bs-toggle="tab"
                                data-bs-target="#profile-tab-pane"
                                role="tab"
                                aria-controls="profile-tab-pane"
                                aria-selected="false"
                            >
                                Người dùng
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4"
                                id="video"
                                data-bs-toggle="tab"
                                data-bs-target="#profile-tab-pane"
                                type="button"
                                role="tab"
                                aria-controls="profile-tab-pane"
                                aria-selected="false"
                            >
                                Video
                            </a>
                        </li>
                    </ul>
                    <div class="dropdown">
                        <a
                            class="btn p-1 border-0 bg-white rounded-circle shadow-sm"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <img
                                src="${userAuth.avartar==null?'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A':userAuth.avartar}"
                                alt="avt"
                                style="height: 30px; width: 30px"
                                class="rounded-circle"
                            />
                        </a>

                        <ul
                            class="dropdown-menu dropdown-menu-end mt-2 rounded-4 border-0 shadow-lg overflow-hidden bg-dark p-2"
                        >
                            <li>
                                <a
                                    class="dropdown-item d-flex gap-2 fs-7 align-items-center py-2 pe-5 rounded-3"
                                    href="${pageContext.request.contextPath}/choose-page"
                                >
                                    <span class="material-symbols-outlined">
                                        account_circle
                                    </span>
                                    <span>Thoát trình quản lý</span>
                                </a>
                            </li>

                            <li>
                                <a
                                    class="dropdown-item d-flex gap-2 fs-7 align-items-center py-2 pe-5 rounded-3"
                                    href="#"
                                >
                                    <span class="material-symbols-outlined">
                                        logout
                                    </span>
                                    <span>Đăng xuất</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main -->
        <div class="container pt-3 setup-frame pb-5">
            <a
                href="${pageContext.request.contextPath}/admin/manage-user"
                class="icon-link text-decoration-none fs-7 icon-link-hover pointer text-light border-height-1 px-2 py-1 border-secondary border-opacity-50 bg-secondary bg-opacity-10 rounded-3"
                style="--bs-icon-link-transform: translate3d(-0.25rem, 0, 0)"
            >
                <i
                    class="bi bi-chevron-left position-relative"
                    style="bottom: 3px"
                >
                    <use xlink:href="#arrow-left"></use>
                </i>
                Danh sách người dùng
            </a>
            <div class="col-12 mt-4">
                <div class="fs-3 d-flex align-items-center gap-2">
                    Hồ sơ người dùng
                </div>
            </div>
            <div action="" method="post" class="row m-0 p-0 mt-3">
                <div
                    class="col-12 d-flex flex-column align-items-center position-relative px-0"
                    style="padding: -100px !important"
                >
                    <label for="" class="w-100 fs-7 px-2">Ảnh đại diện</label>
                    <div
                        class="d-flex justify-content-center position-relative w-fit p-1 shadow-sm bg-dark rounded-circle"
                    >
                        <img
                            id="avt"
                            style="width: 160px; height: 160px"
                            class="avt"
                            src="${user.avartar}"
                            alt=""
                        />
                        <input
                            type="file"
                            name="avartar"
                            id="input-avt"
                            class="h-100 w-100 position-absolute avt opacity-0 pointer"
                        />
                    </div>
                    <label for="" class="w-100 mb-2 fs-7 px-2">Ảnh bìa</label>

                    <div
                        class="d-flex justify-content-center position-relative h-fit w-100"
                    >
                        <img
                            id="coverImage"
                            class="bg-img w-100 rounded-4"
                            src="${user.coverImage}"
                            alt=""
                        />
                        <input
                            type="file"
                            name="coverImage"
                            id="input-coverImage"
                            class="h-100 w-100 position-absolute avt opacity-0 pointer"
                        />
                    </div>
                </div>
                <div class="col-lg col-12 position-relative px-0 mt-3">
                    <div class="mt-3 mb-2 w-100 fs-7 px-2">
                        Thông tin tài khoản
                    </div>
                    <div class="text-start bg-dark-subtle p-4 rounded-4">
                        <div class="row gap-2 m-0 p-0">
                            <div class="row m-0 px-0">
                                <label
                                    for="fullname"
                                    class="col-md-4 col-lg-2 col-form-label fs-7"
                                    >Họ và tên</label
                                >
                                <div class="col-lg-10 col-12 px-0">
                                    <input
                                        type="text"
                                        class="form-control rounded-3 fs-7 fw-light py-2 shadow-none"
                                        id="fullname"
                                        name="fullname"
                                        value="${user.fullname}"
                                        placeholder="Họ và tên"
                                    />
                                </div>
                            </div>
                            <div class="row m-0 px-0">
                                <label
                                    for="email"
                                    class="col-md-4 col-lg-2 col-form-label fs-7"
                                    >Email</label
                                >
                                <div class="col-lg-10 col-12 px-0">
                                    <input
                                        type="email"
                                        class="form-control rounded-3 fs-6 fw-light py-2 shadow-none"
                                        id="email"
                                        name="email"
                                        value="${user.email}"
                                        placeholder="Example@gmail.com"
                                    />
                                </div>
                            </div>
                            <div class="row m-0 px-0">
                                <label
                                    for="number"
                                    class="col-md-4 col-lg-2 col-form-label fs-7"
                                    >Số điện thoại</label
                                >
                                <div class="col-lg-10 col-12 px-0">
                                    <input
                                        type="number"
                                        class="form-control rounded-3 fs-6 fw-light py-2 shadow-none"
                                        id="number"
                                        name="number"
                                        value="${user.number}"
                                        placeholder="0123456789"
                                    />
                                </div>
                            </div>
                            <div class="row align-items-center m-0 px-0">
                                <label
                                    for=""
                                    class="col-md-4 col-lg-2 col-form-label fs-7 fw-medium"
                                    >Giới tính</label
                                >
                                <div class="col-lg-10 col-12 row gap-3 m-0">
                                    <div class="form-check col-auto">
                                        <input class="form-check-input"
                                        type="radio" name="gender" id="male"
                                        value="true" ${user.gender?'checked':''}
                                        />
                                        <label
                                            class="form-check-label fs-7"
                                            for="male"
                                        >
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check col-auto">
                                        <input class="form-check-input"
                                        type="radio" name="gender" id="female"
                                        value="false"
                                        ${user.gender?'':'checked'} />
                                        <label
                                            class="form-check-label fs-7"
                                            for="female"
                                        >
                                            Nữ
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-center m-0 px-0">
                                <label
                                    for=""
                                    class="col-md-4 col-lg-2 col-form-label fs-7 fw-medium"
                                    >Trạng thái tài khoản</label
                                >
                                <div class="col-lg-10 col-12 row gap-3 m-0">
                                    <button
                                        type="button"
                                        id="btn-status"
                                        value="${user.active?'true':'false'}"
                                        class="col-auto btn btn-sm rounded-3 bg-secondary bg-opacity-10 border-0 d-flex align-items-center gap-2"
                                    >
                                        <div
                                            class="dot ${user.active?'bg-success':'bg-danger'}"
                                            id="dot"
                                        ></div>
                                        <div id="message-active" class="fs-8">
                                            ${user.active?'Đang hoạt động':'Bị
                                            ẩn'}
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button
                        type="submit"
                        id="btn-save"
                        class="btn btn-light mt-2 rounded-3 fs-7 float-end"
                    >
                        Lưu thay đổi
                    </button>
                </div>
            </div>

            <div class="row mt-4 m-0 p-0">
                <a
                    href="/reportOfVideo.html"
                    class="icon-link w-fit mb-2 text-decoration-none fs-7 icon-link-hover pointer text-light px-2"
                    style="--bs-icon-link-transform: translate3d(0.25rem, 0, 0)"
                >
                    Số liệu thống kê
                    <i
                        class="bi bi-chevron-right position-relative"
                        style="bottom: 3px"
                    >
                        <use xlink:href="#arrow-left"></use>
                    </i>
                </a>
                <div
                    class="gy-2 row border-height-1 m-0 py-3 border-secondary border-opacity-50 rounded-4 bg-secondary bg-opacity-10"
                >
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt xem</div>
                        <div class="fs-3">${countView}</div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt thích</div>
                        <div class="fs-3">${countLike}</div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt bình luận</div>
                        <div class="fs-3">${countComment}</div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt chia sẻ</div>
                        <div class="fs-3">${countShare}</div>
                    </div>
                </div>
            </div>
            <div class="toast-container position-fixed bottom-0 end-0 p-3">
                <div
                    id="liveToastUpdate"
                    class="toast"
                    role="alert"
                    aria-live="assertive"
                    aria-atomic="true"
                >
                    <div class="toast-header">
                        <i
                            class="bi bi-check-circle-fill text-success me-1"
                        ></i>

                        <strong class="me-auto">Moovee</strong>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="toast"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="toast-body">
                        Cập nhật trạng thái người dùng thành công
                    </div>
                </div>
            </div>
            <div class="toast-container position-fixed bottom-0 end-0 p-3">
                <div
                    id="liveToastError"
                    class="toast"
                    role="alert"
                    aria-live="assertive"
                    aria-atomic="true"
                >
                    <div class="toast-header">
                        <i class="bi bi-x-circle-fill text-danger me-1"></i>

                        <strong class="me-auto">Moovee</strong>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="toast"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="toast-body">
                        Đã xảy ra lỗi khi cập nhật người dùng! Vui lòng tải lại
                        trang và thử lại
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <script>
        const home = document.getElementById("home");
        const user = document.getElementById("user");
        const video = document.getElementById("video");

        home.addEventListener("click", () => {
            location.href = "${pageContext.request.contextPath}/admin";
        });
        user.addEventListener("click", () => {
            location.href =
                "${pageContext.request.contextPath}/admin/manage-user";
        });
        video.addEventListener("click", () => {
            location.href =
                "${pageContext.request.contextPath}/admin/manage-video";
        });

        const btnStatus = document.getElementById("btn-status");
        const dot = document.getElementById("dot");
        const messageActive = document.getElementById("message-active");

        btnStatus.addEventListener("click", () => {
            if (dot.classList.contains("bg-success")) {
                dot.classList.remove("bg-success");
                dot.classList.add("bg-danger");
                messageActive.innerHTML = "Bị khoá";
            } else {
                dot.classList.remove("bg-danger");
                dot.classList.add("bg-success");
                messageActive.innerHTML = "Đang hoạt động";
            }
        });
    </script>
    <script>
        const liveToastUpdate = new bootstrap.Toast(
            document.getElementById("liveToastUpdate")
        );
        const liveToastError = new bootstrap.Toast(
            document.getElementById("liveToastError")
        );
        const btnSave = document.getElementById("btn-save");
        const inputAvt = document.getElementById("input-avt");
        const avt = document.getElementById("avt");
        const inputCoverImage = document.getElementById("input-coverImage");
        const coverImage = document.getElementById("coverImage");

        btnSave.addEventListener("click", async () => {
            const gender = document.getElementById("male").checked
                ? true
                : document.getElementById("female").checked
                ? false
                : null;
            const formData = new FormData();
            formData.append("id", "${user.id}");
            if (inputAvt.files[0])
                formData.append("avartar", inputAvt.files[0]);
            if (inputCoverImage.files[0])
                formData.append("coverImage", inputCoverImage.files[0]);
            formData.append(
                "fullname",
                document.getElementById("fullname").value
            );
            formData.append("email", document.getElementById("email").value);
            formData.append("number", document.getElementById("number").value);
            formData.append("gender", gender);
            formData.append(
                "active",
                document.getElementById("dot").classList.contains("bg-success")
            );
            const url =
                "${pageContext.request.contextPath}/admin/manage-user/user";
            const urlParams = new URLSearchParams(url);
            const response = await fetch(url + "?" + urlParams, {
                method: "PUT",
                headers: {
                    enctype: "multipart/form-data",
                },
                body: formData,
            });

            if (response.ok) {
                liveToastUpdate.show();
            } else {
                liveToastError.show();
            }
        });

        inputAvt.addEventListener("change", (e) => {
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = (e) => {
                avt.src = e.target.result;
            };
            reader.readAsDataURL(file);
        });

        inputCoverImage.addEventListener("change", (e) => {
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = (e) => {
                coverImage.src = e.target.result;
            };
            reader.readAsDataURL(file);
        });
    </script>
</html>
