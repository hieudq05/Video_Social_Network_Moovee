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
                                class="pointer nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4"
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
                                class="nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4 active"
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
        <div class="py-5 setup-frame frame-list-video container px-0">
            <div
                class="border-height-1 border-secondary border-opacity-25 frame-fit-parent z-0 rounded-3 overflow-hidden"
            >
                <div
                    class="row pointer gx-5 m-0 bg-dark fs-8 fw-semibold h-fit border-bottom border-secondary border-opacity-25"
                >
                    <div class="col-8 col-xl-6 tr-table-hover py-3">
                        <i class="bi bi-filter-circle me-2 fs-6"></i>Video
                    </div>
                    <div class="col tr-table-hover py-3">
                        <i class="bi bi-filter-circle me-2 fs-6"></i>Người đăng
                    </div>
                    <div class="d-none d-xl-flex col tr-table-hover py-3">
                        <i class="bi bi-filter-circle me-2 fs-6"></i>Ngày đăng
                    </div>
                    <div class="d-none d-xl-flex col tr-table-hover py-3">
                        <i class="bi bi-filter-circle me-2 fs-6"></i>Trạng thái
                    </div>
                </div>

                <div
                    class="overflow-scroll cus-h-container-table"
                    id="container-row"
                >
                    <!-- Row table model -->
                    <div
                        class="d-flex justify-content-center align-items-center pt-3"
                        id="loading"
                    >
                        <div
                            class="spinner-grow text-white"
                            style="width: 1rem; height: 1rem"
                            role="status"
                        >
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="toast-container position-fixed bottom-0 end-0 p-3">
                <div
                    id="liveToastDelete"
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
                        Xoá thành công video khỏi hệ thống
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
        const status = document.getElementById("status");
        const loading = document.getElementById("loading");
        const containerRow = document.getElementById("container-row");
        const liveToastDelete = new bootstrap.Toast(
            document.getElementById("liveToastDelete")
        );

        loading.classList.add("d-none");

        var page = 0;
        var isEnd = false;
        var isLoading = false;
        var pageSizes = 8;

        const loadVideo = async () => {
            isLoading = true;
            loading.classList.remove("d-none");
            const res = await fetch(
                "${pageContext.request.contextPath}/admin/manage-video/load-video?page=" +
                    page +
                    "&pageSize=" +
                    pageSizes
            );
            const data = await res.json();
            if (data.length < pageSizes) {
                isEnd = true;
            }
            data.forEach((video) => {
                const row = document.createElement("div");

                row.classList.add(
                    "row",
                    "position-relative",
                    "tr-table-hover",
                    "m-0",
                    "h-fit",
                    "fs-7",
                    "fw-light",
                    "gx-5",
                    "align-items-center",
                    "border-bottom",
                    "border-secondary",
                    "border-opacity-25",
                    "py-4"
                );
                row.innerHTML =
                    '<div class="d-flex align-items-center gap-2 col-8 col-xl-6">' +
                    "<img " +
                    'src="' +
                    video.urlImage +
                    '" ' +
                    'alt="background video" ' +
                    'class="ar-video-home vd-i-t rounded-2" />' +
                    '<div class="truncate-text">' +
                    video.title +
                    "</div>" +
                    "</div>" +
                    '<div class="col">' +
                    video.fullnameUser +
                    "</div>" +
                    '<div class="d-none d-xl-flex col">' +
                    video.postedDate[2] +
                    "-" +
                    video.postedDate[1] +
                    "-" +
                    video.postedDate[0] +
                    "</div>" +
                    '<div class="d-none d-xl-flex col">' +
                    "<span " +
                    'class="' +
                    (video.active == true ? "bg-success" : "bg-danger") +
                    ' w-fit fw-medium bg-opacity-10 fs-8 d-flex align-items-center gap-1 px-2 py-1 rounded-3">' +
                    '<div class="dot ' +
                    (video.active == true ? "bg-success" : "bg-danger") +
                    '"></div>' +
                    (video.active == true ? "Hoạt động" : "Bị ẩn") +
                    "</span>" +
                    "</div>" +
                    '<div class="position-absolute w-fit rounded-3 p-0" style="right: 10px !important">' +
                    "<div " +
                    'class="btn tr-table-hover px-2 py-1 border-0" ' +
                    'data-bs-toggle="dropdown" ' +
                    'aria-expanded="false">' +
                    '<i class="bi bi-three-dots-vertical"></i>' +
                    "</div>" +
                    '<ul class="dropdown-menu fs-8 overflow-hidden py-0">' +
                    "<li>" +
                    '<a class="dropdown-item py-2 fw-light" href="${pageContext.request.contextPath}/admin/report/videos/video?videoId=' +
                    video.id +
                    '">' +
                    '<i class="bi bi-folder2-open me-2 fs-6"></i>Hiển thị báo cáo' +
                    "</a>" +
                    "</li>" +
                    "<li>" +
                    '<a class="dropdown-item py-2 fw-light" href="${pageContext.request.contextPath}/admin/manage-video/video?videoId=' +
                    video.id +
                    '">' +
                    '<i class="bi bi-marker-tip fs-6" style="margin-right: 0.25rem"></i>Chỉnh sửa video' +
                    "</a>" +
                    "</li>" +
                    '<li><hr class="dropdown-divider my-0" /></li>' +
                    "<li>" +
                    '<a class="dropdown-item py-2 text-danger fw-light delete-dropdown" ' +
                    'data-bs-toggle="modal" data-bs-target="#dM' +
                    video.id +
                    '">' +
                    '<i class="bi bi-trash3 me-2"></i>Xoá video' +
                    "</a>" +
                    "</li>" +
                    "</ul>" +
                    "</div>" +
                    "<form " +
                    'class="modal fade" ' +
                    'id="dM' +
                    video.id +
                    '" ' +
                    'data-bs-backdrop="static" ' +
                    'data-bs-keyboard="false" ' +
                    'tabindex="-1" ' +
                    'aria-labelledby="staticBackdropLabel" ' +
                    'aria-hidden="true">' +
                    '<div class="modal-dialog modal-dialog-centered">' +
                    '<div class="modal-content rounded-4">' +
                    "<div " +
                    'class="modal-header p-3 border-bottom border-secondary border-opacity-25">' +
                    "<div " +
                    'class="mb-1 fw-bold" ' +
                    'style="font-size: 1rem">' +
                    "Xoá video" +
                    "</div>" +
                    "</div>" +
                    "<div " +
                    'class="modal-body border-bottom border-secondary border-opacity-25">' +
                    '<div class="">' +
                    "Vui lòng nhấp vào " +
                    '<span class="text-danger">xác nhận</span> ' +
                    "khi chắc chắn muốn xoá video " +
                    '"<span ' +
                    'class="fw-semibold text-decoration-underline">' +
                    video.title +
                    '</span>".' +
                    "</div>" +
                    "<div>" +
                    "Thao tác này không thể hoàn tác." +
                    "</div>" +
                    "</div>" +
                    '<div class="modal-footer py-2 border-0 px-2">' +
                    "<button " +
                    'type="button" ' +
                    'class="btn border-secondary bg-body-secondary fs-8 rounded-3 py-1" ' +
                    'data-bs-dismiss="modal">' +
                    "Huỷ bỏ" +
                    "</button>" +
                    "<button " +
                    'type="button" ' +
                    'data-bs-dismiss="modal" ' +
                    'class="btn btn-danger fs-8 rounded-3 py-1 dV">' +
                    "Xác nhận" +
                    "</button>" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</form>";
                containerRow.insertBefore(row, containerRow.lastElementChild);
            });
            page++;
            isLoading = false;
            loading.classList.add("d-none");
        };

        loadVideo();

        window.addEventListener("scroll", () => {
            if (
                window.scrollY + window.innerHeight >=
                    document.documentElement.scrollHeight &&
                !isEnd &&
                !isLoading
            ) {
                loadVideo();
            }
        });

        const observer = new MutationObserver(() => {
            const buttons = document.querySelectorAll("button[class*='dV']");
            buttons.forEach((button) => {
                if (!button.hasAttribute("data-event-added")) {
                    button.addEventListener("click", async function () {
                        const res = await fetch(
                            "${pageContext.request.contextPath}/admin/manage-video/delete-video?videoId=" +
                                button.parentElement.parentElement.parentElement.parentElement.id.split(
                                    "dM"
                                )[1],
                            {
                                method: "DELETE",
                            }
                        );
                        if (res.status == 200) {
                            containerRow.removeChild(
                                button.parentElement.parentElement.parentElement
                                    .parentElement.parentElement
                            );
                            liveToastDelete.show();
                        }
                    });
                    button.setAttribute("data-event-added", "true"); // Đánh dấu nút đã được gắn sự kiện
                }
            });
        });

        // Lắng nghe thay đổi trong body hoặc container của modal
        observer.observe(document.body, { childList: true, subtree: true });

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
    </script>
</html>
