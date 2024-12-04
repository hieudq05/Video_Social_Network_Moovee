<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ page
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

        <div class="container setup-frame py-5 row mx-auto gap-4">
            <!-- Video Container -->
            <div class="col-xl-4 col-md-5 col-12">
                <a
                    class="icon-link text-decoration-none icon-link-hover text-white"
                    href="${pageContext.request.contextPath}/admin/manage-video"
                >
                    Video
                    <i class="bi bi-chevron-right mb-2 fw-bolder text-white-50">
                        <use xlink:href="#arrow-right"></use>
                    </i>
                </a>
                <div class="fs-7 text-white-50 fw-light">
                    <span>${countVideoInDay}</span> video được đăng trong hôm
                    nay
                </div>
                <div class="row m-0 rounded-4 mt-3 px-2 gap-3">
                    <c:forEach items="${recentVideos}" var="video">
                        <!-- Video Model -->
                        <a
                            href="${pageContext.request.contextPath}/admin/report/videos/video?videoId=${video.id}"
                            class="vd text-decoration-none col-12 row m-0 p-0 rounded-4 bg-secondary bg-opacity-10 border-secondary border-opacity-25 border-height-1 overflow-hidden"
                        >
                            <img
                                src="${video.urlImage}"
                                alt="background video"
                                class="ar-video-home p-0 col-5 h-100 object-fit-cover"
                            />
                            <div class="col-7 text-white p-3">
                                <div class="text-truncate">${video.title}</div>
                                <div class="fs-8 fw-light">
                                    ${video.fullnameUser}
                                </div>
                                <div class="fs-8 fw-light text-white-50">
                                    ${video.postedDate}
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>

            <!-- User Container -->
            <div class="col-xl col-md-5 col-12">
                <a
                    class="icon-link text-decoration-none icon-link-hover text-white"
                    href="${pageContext.request.contextPath}/admin/manage-user"
                >
                    Người dùng
                    <i class="bi bi-chevron-right mb-2 fw-bolder text-white-50">
                        <use xlink:href="#arrow-right"></use>
                    </i>
                </a>
                <div class="fs-7 text-white-50 fw-light">
                    <span>${countUser}</span> người dùng đã đăng ký tài khoản
                </div>
                <div class="row m-0 rounded-4 mt-3 px-2 gap-3">
                    <c:forEach items="${users}" var="user" varStatus="uStatus">
                        <!-- User Model -->
                        <a
                            href="${pageContext.request.contextPath}/admin/report/users/user?userId=${user.userId}"
                            class="user text-decoration-none col-12 row m-0 p-3 rounded-4 bg-secondary bg-opacity-10 border-secondary border-opacity-25 border-height-1"
                        >
                            <img
                                src="${user.avatarImage}"
                                alt="background video"
                                class="user-avt p-0 col-5"
                            />
                            <div class="col text-white pe-0">
                                <div class="truncate-text">
                                    ${user.fullName}
                                </div>
                                <div class="fs-8 fw-light text-white-50">
                                    <span class="fs-6"
                                        >#${uStatus.index+1}</span
                                    >
                                    số người theo dõi
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>

            <!-- Report Container -->
            <div class="col-md-12 col-xl-4 mb-md-5 col-12">
                <div
                    class=""
                >
                    Báo cáo - thống kê
                </div>
                <div class="fs-7 text-white-50 fw-light">
                    Báo cáo thống kế số liệu liên quan như lượt xem, lượt thích,
                    ...
                </div>
                <div
                    class="row m-0 rounded-4 mt-3 bg-secondary bg-opacity-10 border-secondary border-opacity-25 border-height-1 p-4 gap-2"
                >
                    <div class="row m-0 p-0">
                        <div
                            class="col-6 pe-4 border-right-1 border-secondary-subtle"
                        >
                            <div class="fs-1 fw-medium">
                                ${countViewCurrMonth}
                            </div>
                            <div class="fs-6 fw-light text-white-50">Tổng số lượt xem</div>
                            <div class="fs-6 text-success">
                                <span
                                    id="data-trending-view"
                                    class="material-symbols-outlined position-relative me-1"
                                    style="top: 5px"
                                >
                                    trending_up
                                </span>
                                <span
                                    ><span id="data-view">Tăng 209%</span> so
                                    với tháng trước</span
                                >
                            </div>
                        </div>
                        <div class="col-6 ps-4">
                            <div class="fs-1 fw-medium">
                                ${countLikeCurrMonth}
                            </div>
                            <div class="fs-6 fw-light text-white-50">Tổng số lượt thích</div>
                            <div class="fs-6 text-danger">
                                <span
                                    id="data-trending-like"
                                    class="material-symbols-outlined position-relative me-1"
                                    style="top: 5px"
                                >
                                    trending_down
                                </span>
                                <span
                                    ><span id="data-like">Giảm 9%</span> so với
                                    tháng trước</span
                                >
                            </div>
                        </div>
                    </div>
                    <!-- <div class="d-flex flex-wrap gap-3">
                        <a
                            class="btn btn-light rounded-4 btn-sm px-3 fs-7 fw-medium"
                        >
                            Báo cáo về người dùng
                        </a>
                        <a
                            class="btn btn-light rounded-4 btn-sm px-3 fs-7 fw-medium"
                        >
                            Chi tiết số liệu từng video
                        </a>
                    </div> -->
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <script>
        const home = document.getElementById("home");
        const user = document.getElementById("user");
        const video = document.getElementById("video");
        const dataView = document.getElementById("data-view");
        const dataLike = document.getElementById("data-like");
        const dataTrendingLike = document.getElementById("data-trending-like");
        const dataTrendingView = document.getElementById("data-trending-view");

        if(${countViewCurrMonth - countViewPrevMonth == 0}){
            dataTrendingView.innerHTML = "trending_flat"
            dataTrendingView.classList.add("text-warning");
            dataView.innerText = `Không tăng`;
            dataView.parentElement.classList.add("text-warning");
        } else if (${countViewCurrMonth > countViewPrevMonth}) {
            dataTrendingView.innerHTML = "trending_up"
            dataTrendingView.classList.add("text-success");
            dataView.innerText = `Tăng <fmt:formatNumber value="${(countViewCurrMonth / (countViewPrevMonth>0?countViewPrevMonth:1)) * 100}" maxFractionDigits="2" groupingUsed="false"/>%`;
            dataView.parentElement.classList.add("text-success");
        } else {
            dataTrendingView.innerHTML = "trending_down"
            dataTrendingView.classList.add("text-danger");
            dataView.innerText = `Giảm <fmt:formatNumber value="${(countViewCurrMonth / (countViewPrevMonth>0?countViewPrevMonth:1)) * 100}" maxFractionDigits="2" groupingUsed="false"/>%`;
            dataView.parentElement.classList.add("text-danger");
        }

        if(${countLikeCurrMonth - countLikePrevMonth == 0}){
            dataTrendingLike.innerHTML = "trending_flat"
            dataTrendingLike.classList.add("text-warning");
            dataLike.innerText = `Không tăng`;
            dataLike.parentElement.classList.add("text-warning");
        } else if (${countLikeCurrMonth > countLikePrevMonth}) {
            dataTrendingLike.innerHTML = "trending_up"
            dataTrendingLike.classList.add("text-success");
            dataLike.innerText = `Tăng <fmt:formatNumber value="${(countLikeCurrMonth / (countLikePrevMonth>0?countLikePrevMonth:1)) * 100}" maxFractionDigits="2" groupingUsed="false"/>%`;
            dataLike.parentElement.classList.add("text-success");
        } else {
            dataTrendingLike.innerHTML = "trending_down"
            dataTrendingLike.classList.add("text-danger");
            dataLike.innerText = `Giảm <fmt:formatNumber value="${(countLikeCurrMonth / (countLikePrevMonth>0?countLikePrevMonth:1)) * 100}" maxFractionDigits="2" groupingUsed="false"/>%`;
            dataLike.parentElement.classList.add("text-danger");
        }

        home.addEventListener("click", () => {
            location.href = "${pageContext.request.contextPath}/admin";
        });
        user.addEventListener("click", () => {
            location.href = "${pageContext.request.contextPath}/admin/manage-user";
        });
        video.addEventListener("click", () => {
            location.href = "${pageContext.request.contextPath}/admin/manage-video";
        });
    </script>
</html>
