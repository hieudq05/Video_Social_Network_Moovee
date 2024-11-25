<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <body>
        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-md py-0 z-3 shadow-lg">
            <div class="container-fluid bg-dark-subtle px-3 py-3 rounded-0">
                <a href="/adminHome.html" class="navbar-brand"
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
                                class="nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4 active"
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
                                :class="active === '/admin/users' ? 'active' : ''"
                                @click="goToManageUsers"
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
                                @click="goToManageVideos"
                                :class="active.includes('/admin/videos') ? 'active' : ''"
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
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link text-light fs-7 text-opacity-50 fw-medium rounded-4"
                                id="report"
                                data-bs-toggle="tab"
                                data-bs-target="#profile-tab-pane"
                                type="button"
                                role="tab"
                                aria-controls="profile-tab-pane"
                                aria-selected="false"
                            >
                                Báo cáo - thống kê
                            </a>
                        </li>
                    </ul>
                    <div class="dropdown">
                        <a
                            class="btn p-1 border-0 bg-white rounded-circle shadow-sm"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <img
                                src="/public/wallpaper-4k-hinh-nen-4k-xanh-muot-dep_100025898.jpg"
                                alt=""
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
                                    href="#"
                                >
                                    <span class="material-symbols-outlined">
                                        account_circle
                                    </span>
                                    <span>Xem hồ sơ</span>
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
        <div class="container setup-frame py-5 row mx-auto gap-4">
            <!-- Video Container -->
            <div class="col-xxl col-lg-5 col-md">
                <a
                    class="icon-link text-decoration-none icon-link-hover text-white"
                    href="manageVideo.html"
                >
                    Video
                    <i class="bi bi-chevron-right mb-2 fw-bolder text-white-50">
                        <use xlink:href="#arrow-right"></use>
                    </i>
                </a>
                <div class="fs-7 text-white-50 fw-light">
                    <span>29</span> video được đăng trong hôm nay
                </div>
                <div
                    class="row m-0 rounded-4 mt-3 border-secondary border-opacity-25 border-height-1 p-3 gap-2"
                >
                    <!-- Video Model -->
                    <a
                            href="#"
                            class="vd text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                                src="https://i.pinimg.com/736x/0a/f8/bb/0af8bba77716067d579e4f7cadb3d0d5.jpg"
                                alt="background video"
                                class="ar-video-home rounded-3 p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="truncate-text">
                                Video's titlesadasfasd
                            </div>
                            <div class="fs-8 fw-light">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng ngày 26-10-2024
                            </div>
                        </div>
                    </a>
                    <a
                            href="#"
                            class="vd text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                                src="https://i.pinimg.com/736x/0a/f8/bb/0af8bba77716067d579e4f7cadb3d0d5.jpg"
                                alt="background video"
                                class="ar-video-home rounded-3 p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="truncate-text">
                                Video's titlesadasfasd
                            </div>
                            <div class="fs-8 fw-light">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng ngày 26-10-2024
                            </div>
                        </div>
                    </a>
                    <a
                            href="#"
                            class="vd text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                                src="https://i.pinimg.com/736x/0a/f8/bb/0af8bba77716067d579e4f7cadb3d0d5.jpg"
                                alt="background video"
                                class="ar-video-home rounded-3 p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="truncate-text">
                                Video's titlesadasfasd
                            </div>
                            <div class="fs-8 fw-light">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng ngày 26-10-2024
                            </div>
                        </div>
                    </a>
                    <a
                            href="#"
                            class="vd text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                                src="https://i.pinimg.com/736x/0a/f8/bb/0af8bba77716067d579e4f7cadb3d0d5.jpg"
                                alt="background video"
                                class="ar-video-home rounded-3 p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="truncate-text">
                                Video's titlesadasfasd
                            </div>
                            <div class="fs-8 fw-light">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng ngày 26-10-2024
                            </div>
                        </div>
                    </a>
                    <a
                            href="#"
                            class="vd text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                                src="https://i.pinimg.com/736x/0a/f8/bb/0af8bba77716067d579e4f7cadb3d0d5.jpg"
                                alt="background video"
                                class="ar-video-home rounded-3 p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="truncate-text">
                                Video's titlesadasfasd
                            </div>
                            <div class="fs-8 fw-light">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng ngày 26-10-2024
                            </div>
                        </div>
                    </a>
                    <a
                            href="#"
                            class="vd text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                                src="https://i.pinimg.com/736x/0a/f8/bb/0af8bba77716067d579e4f7cadb3d0d5.jpg"
                                alt="background video"
                                class="ar-video-home rounded-3 p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="truncate-text">
                                Video's titlesadasfasd
                            </div>
                            <div class="fs-8 fw-light">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng ngày 26-10-2024
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <!-- User Container -->
            <div class="col-xxl col-lg-5 col-md">
                <a
                    class="icon-link text-decoration-none icon-link-hover text-white"
                    href="#"
                >
                    Người dùng
                    <i class="bi bi-chevron-right mb-2 fw-bolder text-white-50">
                        <use xlink:href="#arrow-right"></use>
                    </i>
                </a>
                <div class="fs-7 text-white-50 fw-light">
                    <span>999</span> người dùng đã đăng ký tài khoản
                </div>
                <div
                    class="row m-0 rounded-4 mt-3 border-secondary border-opacity-25 border-height-1 p-3 gap-2"
                >
                    <!-- User Model -->
                    <a
                        href="#"
                        class="user text-decoration-none col-12 row m-0 p-2 rounded-4"
                    >
                        <img
                            src="https://i.pinimg.com/736x/6d/db/d5/6ddbd536eb112e2441ac83a3842db937.jpg"
                            alt="background video"
                            class="user-avt p-0 col-5"
                        />
                        <div class="col-7 text-white">
                            <div class="text-truncate">Dương Quốc Hiếu</div>
                            <div class="fs-8 fw-light">2610 người theo dõi</div>
                            <div class="fs-8 fw-light text-white-50">
                                Đăng video gần đây
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Report Container -->
            <div class="col-xxl-5 col-md-12 mb-md-5">
                <a
                    href="#"
                    class="icon-link text-decoration-none icon-link-hover text-white"
                >
                    Báo cáo - thống kê
                    <i class="bi bi-chevron-right mb-2 fw-bolder text-white-50">
                        <use xlink:href="#arrow-right"></use>
                    </i>
                </a>
                <div class="fs-7 text-white-50 fw-light">
                    Báo cáo thống kế số liệu liên quan như lượt xem, lượt thích,
                    ...
                </div>
                <div
                    class="row m-0 rounded-4 mt-3 border-secondary border-opacity-25 border-height-1 p-4 gap-4"
                >
                    <div class="row m-0 p-0">
                        <div
                            class="col-6 pe-4 border-right-1 border-secondary-subtle"
                        >
                            <div class="fs-1 fw-medium">2610</div>
                            <div class="fs-6 fw-light">Tổng số lượt xem</div>
                            <div class="fs-6 text-success">
                                <span
                                    class="material-symbols-outlined position-relative me-1"
                                    style="top: 5px"
                                >
                                    trending_up
                                </span>
                                <span>Tăng 209% so với hôm qua</span>
                            </div>
                        </div>
                        <div class="col-6 ps-4">
                            <div class="fs-1 fw-medium">99</div>
                            <div class="fs-6 fw-light">Tổng số lượt xem</div>
                            <div class="fs-6 text-danger">
                                <span
                                    class="material-symbols-outlined position-relative me-1"
                                    style="top: 5px"
                                >
                                    trending_down
                                </span>
                                <span>Giảm 9% so với hôm qua</span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex flex-wrap gap-3">
                        <a
                            class="btn btn-light rounded-4 btn-sm px-3 fs-7 fw-medium"
                        >
                            Xem báo cáo về người dùng
                        </a>
                        <a
                            class="btn btn-light rounded-4 btn-sm px-3 fs-7 fw-medium"
                        >
                            Video thịnh hành
                        </a>
                        <a
                            class="btn btn-light rounded-4 btn-sm px-3 fs-7 fw-medium"
                        >
                            Chi tiết số liệu từng video
                        </a>
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
        const report = document.getElementById("report");
        home.addEventListener("click", () => {
            location.href = "/adminHome.html";
        });
        user.addEventListener("click", () => {
            location.href = "/manageUser.html";
        });
        video.addEventListener("click", () => {
            location.href = "/manageVideo.html";
        });
        report.addEventListener("click", () => {
            location.href = "/report.html";
        });
    </script>
</html>
