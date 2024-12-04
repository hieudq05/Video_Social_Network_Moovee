<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation"></script>
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/views/style.css"
        />
        <title>Document</title>
    </head>
    <style>
        .nav-link {
            color: #ffffff90;
        }
        .nav-link:hover {
            color: #ffffff;
        }
    </style>
    <body>

        <c:set value="${video}" var="video" />
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
        <div class="container-fluid setup-frame row m-0 p-0 h-100-w-nav">
            <div
                class="col-lg-3 col-12 border-height-1 border-0 border-end py-3 px-4"
            >
                <a
                    href="${pageContext.request.contextPath}/admin/manage-video"
                    class="icon-link text-decoration-none fs-7 icon-link-hover pointer text-light px-2 py-1 rounded-3"
                    style="
                        --bs-icon-link-transform: translate3d(-0.25rem, 0, 0);
                    "
                >
                    <i
                        class="bi bi-chevron-left position-relative"
                        style="bottom: 3px"
                    >
                        <use xlink:href="#arrow-left"></use>
                    </i>
                    Danh sách video
                </a>
                <div class="">
                    <img
                        src="${video.urlImage}"
                        alt=""
                        class="img-fluid rounded-4 mt-4"
                        style="width: 300px"
                    />
                    <div class="mt-2 truncate-text">
                        ${video.title}
                    </div>
                    <div class="text-secondary fs-7 mb-2">${video.poster.fullname}</div>
                    <a href="${pageContext.request.contextPath}/admin/report/users/user?userId=${video.poster.id}"
                        class="btn btn-light rounded-3 fs-7 py-1"
                        >Xem báo cáo số liệu về tác giả</a
                    >
                </div>
            </div>
            <div
                class="col-lg-9 col-12 p-0 pb-5 m-0 px-4 overflow-scroll frame-fit-parent"
            >
                <div class="row pt-5 m-0 p-0">
                    <div class="col-12">
                        <div class="fs-4 fw-medium">Số liệu thống kê video</div>
                    </div>
                </div>
                <div
                    class="row mt-4 p-0 col-12 mx-0 bg-opacity-10 bg-secondary border-height-1 border-secondary border-opacity-50 rounded-4 overflow-hidden border-bottom"
                >
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button
                                class="nav-link active border-transparent rounded-0 p-4 px-5"
                                id="home-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#tab1"
                                type="button"
                                role="tab"
                                aria-controls="home-tab-pane"
                                aria-selected="true"
                            >
                                <div class="fs-8 text-secondary">
                                    Số lượt xem
                                </div>
                                <div class="fs-3 fw-light">${fn:length(video.recents)}</div>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button
                                class="nav-link border-transparent rounded-0 p-4 px-5"
                                id="profile-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#tab2"
                                type="button"
                                role="tab"
                                aria-controls="profile-tab-pane"
                                aria-selected="false"
                            >
                                <div class="fs-8 text-secondary">
                                    Số lượt chia sẻ
                                </div>
                                <div class="fs-3 fw-light">${fn:length(video.shares)}</div>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button
                                class="nav-link border-transparent rounded-0 p-4 px-5"
                                id="contact-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#tab3"
                                type="button"
                                role="tab"
                                aria-controls="contact-tab-pane"
                                aria-selected="false"
                            >
                                <div class="fs-8 text-secondary">
                                    Số lượt bình luận
                                </div>
                                <div class="fs-3 fw-light">${fn:length(video.comments)}</div>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button
                                class="nav-link border-transparent rounded-0 p-4 px-5"
                                id="contact-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#tab4"
                                type="button"
                                role="tab"
                                aria-controls="contact-tab-pane"
                                aria-selected="false"
                            >
                                <div class="fs-8 text-secondary">
                                    Số lượt thích
                                </div>
                                <div class="fs-3 fw-light">${fn:length(video.likes)}</div>
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content p-0" id="myTabContent">
                        <div
                            class="tab-pane fade py-3 bg-dark show active"
                            id="tab1"
                            role="tabpanel"
                            aria-labelledby="tab1"
                            tabindex="0"
                        >
                            <canvas id="lineChart"></canvas>
                        </div>
                        <div
                            class="tab-pane fade py-3 bg-dark"
                            id="tab2"
                            role="tabpanel"
                            aria-labelledby="tab2"
                            tabindex="0"
                        >
                            <canvas id="lineChart2"></canvas>
                            <c:if test="${fn:length(video.shares)>0}">
                                <div class="px-3">
                                    <div class="fs-6 fw-semibold mt-4 mb-2">
                                        Chi tiết lượt chia sẻ
                                    </div>
                                    <div
                                            class="border-height-1 border-secondary border-opacity-25 frame-fit-parent z-0 rounded-3 overflow-hidden"
                                    >
                                        <div
                                                class="row pointer gx-5 m-0 bg-dark fs-8 fw-semibold h-fit border-bottom border-secondary border-opacity-25"
                                        >
                                            <div class="col tr-table-hover py-3">
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Người chia sẻ
                                            </div>
                                            <div class="col tr-table-hover py-3">
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Ngày chia sẻ
                                            </div>
                                            <div
                                                    class="d-none d-xl-flex col tr-table-hover py-3"
                                            >
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Chia sẻ tới
                                            </div>
                                        </div>
                                        <div
                                                class="overflow-scroll cus-h-container-table"
                                        >
                                            <c:forEach items="${video.shares}" var="share">
                                                <!-- Row table model -->
                                                <div
                                                        class="row position-relative tr-table-hover m-0 h-fit fs-7 fw-light gx-5 align-items-center border-bottom border-secondary border-opacity-25 py-3"
                                                >
                                                    <div
                                                            class="d-flex align-items-center gap-2 col"
                                                    >
                                                        <img
                                                                src="${share.userShare.avartar}"
                                                                alt="background video"
                                                                class="avt"
                                                        />
                                                        <div class="truncate-text">
                                                                ${share.userShare.fullname}
                                                        </div>
                                                    </div>
                                                    <div class="col">${share.date}</div>
                                                    <div class="d-none d-xl-flex col">
                                                            ${share.emailReceive}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div
                            class="tab-pane fade py-3 bg-dark"
                            id="tab3"
                            role="tabpanel"
                            aria-labelledby="tab3"
                            tabindex="0"
                        >
                            <canvas id="lineChart3"></canvas>
                            <c:if test="${fn:length(video.comments)>0}">
                                <div class="px-3">
                                    <div class="fs-6 fw-semibold mt-4 mb-2">
                                        Chi tiết lượt bình luận
                                    </div>
                                    <div
                                            class="border-height-1 border-secondary border-opacity-25 frame-fit-parent z-0 rounded-3 overflow-hidden"
                                    >
                                        <div
                                                class="row pointer gx-5 m-0 bg-dark fs-8 fw-semibold h-fit border-bottom border-secondary border-opacity-25"
                                        >
                                            <div class="col tr-table-hover py-3">
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Người bình luận
                                            </div>
                                            <div class="col tr-table-hover py-3">
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Ngày bình luận
                                            </div>
                                            <div
                                                    class="d-flex col-6 tr-table-hover py-3"
                                            >
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Nội dung
                                            </div>
                                        </div>
                                        <div
                                                class="overflow-scroll cus-h-container-table"
                                        >
                                            <c:forEach items="${video.comments}" var="comment">
                                                <!-- Row table model -->
                                                <div
                                                        class="row position-relative tr-table-hover m-0 h-fit fs-7 fw-light gx-5 align-items-center border-bottom border-secondary border-opacity-25 py-3"
                                                >
                                                    <div
                                                            class="d-flex align-items-center gap-2 col"
                                                    >
                                                        <img
                                                                src="${comment.userComment.avartar}"
                                                                alt="background video"
                                                                class="avt"
                                                        />
                                                        <div class="truncate-text">
                                                                ${comment.userComment.fullname}
                                                        </div>
                                                    </div>
                                                    <div class="col">${comment.commentDate}</div>
                                                    <div class="d-flex col-6 pe-5">
                                                            ${comment.comment}
                                                    </div>
<%--                                                    <div--%>
<%--                                                            class="position-absolute w-fit rounded-3 p-0"--%>
<%--                                                            style="right: 10px !important"--%>
<%--                                                    >--%>
<%--                                                        <div--%>
<%--                                                                class="btn tr-table-hover px-2 py-1 border-0 text-danger"--%>
<%--                                                                data-bs-toggle="modal"--%>
<%--                                                                data-bs-target="#dM${comment.id}"--%>
<%--                                                        >--%>
<%--                                                            <i class="bi bi-trash3"></i>--%>
<%--                                                        </div>--%>

<%--                                                        <!-- Modal delete -->--%>
<%--                                                        <div--%>
<%--                                                                class="modal fade"--%>
<%--                                                                id="dM${comment.id}"--%>
<%--                                                                data-bs-backdrop="static"--%>
<%--                                                                data-bs-keyboard="false"--%>
<%--                                                                tabindex="-1"--%>
<%--                                                                aria-labelledby="staticBackdropLabel"--%>
<%--                                                                aria-hidden="true"--%>
<%--                                                        >--%>
<%--                                                            <div--%>
<%--                                                                    class="modal-dialog modal-dialog-centered"--%>
<%--                                                            >--%>
<%--                                                                <div--%>
<%--                                                                        class="modal-content rounded-4"--%>
<%--                                                                >--%>
<%--                                                                    <div--%>
<%--                                                                            class="modal-header p-3 border-bottom border-secondary border-opacity-25"--%>
<%--                                                                    >--%>
<%--                                                                        <div--%>
<%--                                                                                class="mb-1 fw-bold"--%>
<%--                                                                                style="--%>
<%--                                                                        font-size: 1rem;--%>
<%--                                                                    "--%>
<%--                                                                        >--%>
<%--                                                                            Xoá bình luận--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div--%>
<%--                                                                            class="modal-body border-bottom border-secondary border-opacity-25"--%>
<%--                                                                    >--%>
<%--                                                                        <div class="">--%>
<%--                                                                            Vui lòng--%>
<%--                                                                            nhấp vào--%>
<%--                                                                            <span--%>
<%--                                                                                    class="text-danger"--%>
<%--                                                                            >xác--%>
<%--                                                                        nhận</span--%>
<%--                                                                            >--%>
<%--                                                                            khi chắc--%>
<%--                                                                            chắn muốn--%>
<%--                                                                            xoá bình luận này--%>
<%--                                                                        </div>--%>
<%--                                                                        <div>--%>
<%--                                                                            Thao tác này--%>
<%--                                                                            không thể--%>
<%--                                                                            hoàn tác.--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div--%>
<%--                                                                            class="modal-footer py-2 border-0 px-2"--%>
<%--                                                                    >--%>
<%--                                                                        <button--%>
<%--                                                                                type="button"--%>
<%--                                                                                class="btn border-secondary bg-body-secondary fs-8 rounded-3 py-1"--%>
<%--                                                                                data-bs-dismiss="modal"--%>
<%--                                                                        >--%>
<%--                                                                            Huỷ bỏ--%>
<%--                                                                        </button>--%>
<%--                                                                        <button--%>
<%--                                                                                type="button"--%>
<%--                                                                                class="btn btn-danger fs-8 rounded-3 py-1"--%>
<%--                                                                        >--%>
<%--                                                                            Xác nhận--%>
<%--                                                                        </button>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div
                            class="tab-pane fade py-3 bg-dark"
                            id="tab4"
                            role="tabpanel"
                            aria-labelledby="tab4"
                            tabindex="0"
                        >
                            <canvas id="lineChart4"></canvas>
                            <c:if test="${fn:length(video.likes)>0}">
                                <div class="px-3">
                                    <div class="fs-6 fw-semibold mt-4 mb-2">
                                        Chi tiết lượt thích
                                    </div>
                                    <div
                                            class="border-height-1 border-secondary border-opacity-25 frame-fit-parent z-0 rounded-3 overflow-hidden"
                                    >
                                        <div
                                                class="row pointer gx-5 m-0 bg-dark fs-8 fw-semibold h-fit border-bottom border-secondary border-opacity-25"
                                        >
                                            <div class="col tr-table-hover py-3">
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Người thích
                                            </div>
                                            <div class="col tr-table-hover py-3">
                                                <i
                                                        class="bi bi-filter-circle me-2 fs-6"
                                                ></i
                                                >Ngày thích
                                            </div>
                                        </div>
                                        <div
                                                class="overflow-scroll cus-h-container-table"
                                        >
                                            <c:forEach items="${video.likes}" var="like">
                                                <!-- Row table model -->
                                                <div
                                                        class="row position-relative tr-table-hover m-0 h-fit fs-7 fw-light gx-5 align-items-center border-bottom border-secondary border-opacity-25 py-3"
                                                >
                                                    <div
                                                            class="d-flex align-items-center gap-2 col"
                                                    >
                                                        <img
                                                                src="${like.userLike.avartar}"
                                                                alt="background video"
                                                                class="avt"
                                                        />
                                                        <div class="truncate-text">
                                                                ${like.userLike.fullname}
                                                        </div>
                                                    </div>
                                                    <div class="col">${like.date}</div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            const currentDate = new Date();
            const result = [];

            for (let i = 4; i >=0; i--) {
                // Tạo một đối tượng Date mới
                const date = new Date(
                    currentDate.getFullYear(),
                    currentDate.getMonth() - i,
                    1
                );

                // Lấy tháng và năm, định dạng thành chuỗi "MM-yyyy"
                const month = (date.getMonth() + 1).toString().padStart(2, "0"); // Đảm bảo có 2 chữ số
                const year = date.getFullYear();

                result.push(month+"-"+year);
            }

            document.addEventListener("DOMContentLoaded", function () {
                const ctxView = document
                    .getElementById("lineChart")
                    .getContext("2d");
                const ctxShare = document
                    .getElementById("lineChart2")
                    .getContext("2d");
                const ctxComment = document
                    .getElementById("lineChart3")
                    .getContext("2d");
                const ctxLike = document
                    .getElementById("lineChart4")
                    .getContext("2d");

                // Gradient for the area below the line
                const gradient = ctxView.createLinearGradient(0, 0, 0, 400);
                gradient.addColorStop(0, "rgb(65, 180, 217, 0.1)");
                gradient.addColorStop(1, "rgb(65, 180, 217, 0)");

                const dataView = {
                    labels: result,
                    datasets: [
                        {
                            label: "Lượt xem",
                            data: [
                            ${countView[4]}, ${countView[3]}, ${countView[2]}, ${countView[1]}, ${countView[0]},
                            ], // Dữ liệu của trục Y
                            borderColor: "rgb(65, 180, 217)", // Màu đường line
                            borderWidth: 2,
                            fill: true, // Tô nền dưới đường
                            backgroundColor: gradient, // Gradient cho nền
                            tension: 0, // Nét thẳng (không bo tròn)
                            pointRadius: 0,
                        },
                    ],
                };

                const dataLike = {
                    labels: result,
                    datasets: [
                        {
                            label: "Thích",
                            data: [
                            ${countLike[4]}, ${countLike[3]}, ${countLike[2]}, ${countLike[1]}, ${countLike[0]},
                            ], // Dữ liệu của trục Y
                            borderColor: "rgb(65, 180, 217)", // Màu đường line
                            borderWidth: 2,
                            fill: true, // Tô nền dưới đường
                            backgroundColor: gradient, // Gradient cho nền
                            tension: 0, // Nét thẳng (không bo tròn)
                            pointRadius: 0,
                        },
                    ],
                };

                const dataComment = {
                    labels: result,
                    datasets: [
                        {
                            label: "Bình luận",
                            data: [
                            ${countComment[4]}, ${countComment[3]}, ${countComment[2]}, ${countComment[1]}, ${countComment[0]},
                            ], // Dữ liệu của trục Y
                            borderColor: "rgb(65, 180, 217)", // Màu đường line
                            borderWidth: 2,
                            fill: true, // Tô nền dưới đường
                            backgroundColor: gradient, // Gradient cho nền
                            tension: 0, // Nét thẳng (không bo tròn)
                            pointRadius: 0,
                        },
                    ],
                };

                const dataShare = {
                    labels: result,
                    datasets: [
                        {
                            label: "Chia sẻ",
                            data: [
                            ${countShare[4]}, ${countShare[3]}, ${countShare[2]}, ${countShare[1]}, ${countShare[0]},
                            ], // Dữ liệu của trục Y
                            borderColor: "rgb(65, 180, 217)", // Màu đường line
                            borderWidth: 2,
                            fill: true, // Tô nền dưới đường
                            backgroundColor: gradient, // Gradient cho nền
                            tension: 0, // Nét thẳng (không bo tròn)
                            pointRadius: 0,
                        },
                    ],
                };

                const configLike = {
                    type: "line",
                    data: dataLike,
                    options: {
                        responsive: true, // Cho phép điều chỉnh kích thước khi thay đổi kích thước cửa sổ
                        maintainAspectRatio: true, // Giữ tỷ lệ của biểu đồ
                        aspectRatio: 4, // Tỷ lệ chiều rộng/chiều cao
                        responsive: true,
                        plugins: {
                            tooltip: {
                                intersect: false,
                                mode: "nearest",
                                enabled: true,
                                callbacks: {
                                    label: function(tooltipItem) {
                                        let value = tooltipItem.raw;
                                        // Kiểm tra nếu giá trị bằng 0
                                        if (value === 0) {
                                            return '0';  // Đảm bảo giá trị 0 hiển thị rõ ràng
                                        } else {
                                            return value; // Hiển thị giá trị khác
                                        }
                                    },
                                    beforeLabel: function (tooltipItem) {
                                        // Không trả về gì sẽ loại bỏ ô màu
                                    },
                                    title: function (context) {
                                        return context[0].label+" (lượt thích)"; // Hiển thị ngày
                                    },
                                },
                                displayColors: false,
                                titleFont: {
                                    size: 11,
                                    weight: "light",
                                },
                                bodyFont: {
                                    size: 30,
                                },
                                fontFamily: "system-ui",
                                titleColor: "#ffffff90",
                                bodyColor: "rgb(65, 180, 217)",
                                backgroundColor: "#1a1d20",
                                padding: {
                                    top: 10,
                                    bottom: 10,
                                    left: 20,
                                    right: 20,
                                },
                            },
                            legend: {
                                display: false, // Ẩn chú thích
                            },
                        },
                        scales: {
                            x: {
                                grid: {
                                    display: false, // Tắt lưới trục X
                                },
                                ticks: {
                                    color: "#ffffff", // Màu chữ trên trục X
                                    font: {
                                        family: "system-ui",
                                        size: 11,
                                    },
                                    color: "#ffffff90",
                                    padding: 20,
                                },
                            },
                            y: {
                                position: "right",
                                margin: 10,
                                grid: {
                                    color: "rgba(255, 255, 255, 0.1)", // Màu lưới trục Y
                                },
                                ticks: {
                                    color: "#ffffff", // Màu chữ trên trục Y
                                    font: {
                                        family: "system-ui",
                                        size: 12,
                                    },
                                    color: "#ffffff90",
                                    stepSize: 1, // Bước nhảy
                                    beginAtZero: true, // Bắt đầu từ 0
                                    padding: 30,
                                },
                            },
                        },
                    },
                };

                const configView = {
                    type: "bar",
                    data: dataView,
                    options: {
                        responsive: true, // Cho phép điều chỉnh kích thước khi thay đổi kích thước cửa sổ
                        maintainAspectRatio: true, // Giữ tỷ lệ của biểu đồ
                        aspectRatio: 4, // Tỷ lệ chiều rộng/chiều cao
                        responsive: true,
                        borderRadius: 7,
                        plugins: {
                            tooltip: {
                                intersect: false,
                                mode: "nearest",
                                enabled: true,
                                callbacks: {
                                    label: function(tooltipItem) {
                                        let value = tooltipItem.raw;
                                        // Kiểm tra nếu giá trị bằng 0
                                        if (value === 0) {
                                            return '0';  // Đảm bảo giá trị 0 hiển thị rõ ràng
                                        } else {
                                            return value; // Hiển thị giá trị khác
                                        }
                                    },
                                    beforeLabel: function (tooltipItem) {
                                        // Không trả về gì sẽ loại bỏ ô màu
                                    },
                                    title: function (context) {
                                        return context[0].label+" (lượt xem)"; // Hiển thị ngày
                                    },
                                },
                                displayColors: false,
                                titleFont: {
                                    size: 11,
                                    weight: "light",
                                },
                                bodyFont: {
                                    size: 30,
                                },
                                fontFamily: "system-ui",
                                titleColor: "#ffffff90",
                                bodyColor: "rgb(65, 180, 217)",
                                backgroundColor: "#1a1d20",
                                padding: {
                                    top: 10,
                                    bottom: 10,
                                    left: 20,
                                    right: 20,
                                },
                            },
                            legend: {
                                display: false, // Ẩn chú thích
                            },
                        },
                        scales: {
                            x: {
                                grid: {
                                    display: false, // Tắt lưới trục X
                                },
                                ticks: {
                                    font: {
                                        family: "system-ui",
                                        size: 11,
                                    },
                                    color: "#ffffff90",
                                    padding: 20,
                                },
                            },
                            y: {
                                position: "right",
                                margin: 10,
                                grid: {
                                    color: "rgba(255, 255, 255, 0.1)", // Màu lưới trục Y
                                },
                                ticks: {
                                    font: {
                                        family: "system-ui",
                                        size: 12,
                                    },
                                    color: "#ffffff90",
                                    stepSize: 1, // Bước nhảy
                                    beginAtZero: true, // Bắt đầu từ 0
                                    padding: 30,
                                },
                            },
                        },
                    },
                };

                const configComment = {
                    type: "line",
                    data: dataComment,
                    options: {
                        responsive: true, // Cho phép điều chỉnh kích thước khi thay đổi kích thước cửa sổ
                        maintainAspectRatio: true, // Giữ tỷ lệ của biểu đồ
                        aspectRatio: 4, // Tỷ lệ chiều rộng/chiều cao
                        responsive: true,
                        plugins: {
                            tooltip: {
                                intersect: false,
                                mode: "nearest",
                                enabled: true,
                                callbacks: {
                                    label: function(tooltipItem) {
                                        let value = tooltipItem.raw;
                                        // Kiểm tra nếu giá trị bằng 0
                                        if (value === 0) {
                                            return '0';  // Đảm bảo giá trị 0 hiển thị rõ ràng
                                        } else {
                                            return value; // Hiển thị giá trị khác
                                        }
                                    },
                                    beforeLabel: function (tooltipItem) {
                                        // Không trả về gì sẽ loại bỏ ô màu
                                    },
                                    title: function (context) {
                                        return context[0].label+" (bình luận)"; // Hiển thị ngày
                                    },
                                },
                                displayColors: false,
                                titleFont: {
                                    size: 11,
                                    weight: "light",
                                },
                                bodyFont: {
                                    size: 30,
                                },
                                fontFamily: "system-ui",
                                titleColor: "#ffffff90",
                                bodyColor: "rgb(65, 180, 217)",
                                backgroundColor: "#1a1d20",
                                padding: {
                                    top: 10,
                                    bottom: 10,
                                    left: 20,
                                    right: 20,
                                },
                            },
                            legend: {
                                display: false, // Ẩn chú thích
                            },
                        },
                        scales: {
                            x: {
                                grid: {
                                    display: false, // Tắt lưới trục X
                                },
                                ticks: {
                                    color: "#ffffff", // Màu chữ trên trục X
                                    font: {
                                        family: "system-ui",
                                        size: 11,
                                    },
                                    color: "#ffffff90",
                                    padding: 20,
                                },
                            },
                            y: {
                                position: "right",
                                margin: 10,
                                grid: {
                                    color: "rgba(255, 255, 255, 0.1)", // Màu lưới trục Y
                                },
                                ticks: {
                                    color: "#ffffff", // Màu chữ trên trục Y
                                    font: {
                                        family: "system-ui",
                                        size: 12,
                                    },
                                    color: "#ffffff90",
                                    stepSize: 1, // Bước nhảy
                                    beginAtZero: true, // Bắt đầu từ 0
                                    padding: 30,
                                },
                            },
                        },
                    },
                };

                const configShare = {
                    type: "line",
                    data: dataShare,
                    options: {
                        responsive: true, // Cho phép điều chỉnh kích thước khi thay đổi kích thước cửa sổ
                        maintainAspectRatio: true, // Giữ tỷ lệ của biểu đồ
                        aspectRatio: 4, // Tỷ lệ chiều rộng/chiều cao
                        responsive: true,
                        plugins: {
                            tooltip: {
                                intersect: false,
                                mode: "nearest",
                                enabled: true,
                                callbacks: {
                                    label: function(tooltipItem) {
                                        let value = tooltipItem.raw;
                                        // Kiểm tra nếu giá trị bằng 0
                                        if (value === 0) {
                                            return '0';  // Đảm bảo giá trị 0 hiển thị rõ ràng
                                        } else {
                                            return value; // Hiển thị giá trị khác
                                        }
                                    },
                                    beforeLabel: function (tooltipItem) {
                                        // Không trả về gì sẽ loại bỏ ô màu
                                    },
                                    title: function (context) {
                                        return context[0].label+" (chia sẻ)"; // Hiển thị ngày
                                    },
                                },
                                displayColors: false,
                                titleFont: {
                                    size: 11,
                                    weight: "light",
                                },
                                bodyFont: {
                                    size: 30,
                                },
                                fontFamily: "system-ui",
                                titleColor: "#ffffff90",
                                bodyColor: "rgb(65, 180, 217)",
                                backgroundColor: "#1a1d20",
                                padding: {
                                    top: 10,
                                    bottom: 10,
                                    left: 20,
                                    right: 20,
                                },
                            },
                            legend: {
                                display: false, // Ẩn chú thích
                            },
                        },
                        scales: {
                            x: {
                                grid: {
                                    display: false, // Tắt lưới trục X
                                },
                                ticks: {
                                    color: "#ffffff", // Màu chữ trên trục X
                                    font: {
                                        family: "system-ui",
                                        size: 11,
                                    },
                                    color: "#ffffff90",
                                    padding: 20,
                                },
                            },
                            y: {
                                position: "right",
                                margin: 10,
                                grid: {
                                    color: "rgba(255, 255, 255, 0.1)", // Màu lưới trục Y
                                },
                                ticks: {
                                    color: "#ffffff", // Màu chữ trên trục Y
                                    font: {
                                        family: "system-ui",
                                        size: 12,
                                    },
                                    color: "#ffffff90",
                                    stepSize: 1, // Bước nhảy
                                    beginAtZero: true, // Bắt đầu từ 0
                                    padding: 30,
                                },
                            },
                        },
                    },
                };

                new Chart(ctxView, configView);
                new Chart(ctxLike, configLike);
                new Chart(ctxShare, configShare);
                new Chart(ctxComment, configComment);
            });

            const home = document.getElementById("home");
            const user = document.getElementById("user");
            const video = document.getElementById("video");

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
    </body>
</html>
