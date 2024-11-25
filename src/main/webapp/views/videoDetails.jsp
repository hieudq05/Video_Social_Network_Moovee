<%@ page import="service.like.ILikeService" %>
<%@ page import="service.like.LikeService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<style>
    .link-vd:hover {
        text-decoration: underline !important;
    }

    .flip-horizontal {
        transform: scaleX(-1);
    }
</style>

<body>

<c:set value="${sessionScope.get('user')}" var="userAuth"></c:set>
<c:set value="${detailsVideo}" var="detailsVideo"></c:set>

<!-- Navbar -->
<nav
        class="navbar fixed-top navbar-expand-md py-0 z-3 shadow-lg"
        style="z-index: 1000 !important"
>
    <div class="container-fluid bg-blur px-3 py-3 rounded-0">
        <a href="${pageContext.request.contextPath}/moovee" class="navbar-brand">Moove</a>
        <%--        <form action="" role="search">--%>
        <%--            <div class="input-group">--%>
        <%--                <input--%>
        <%--                        type="text"--%>
        <%--                        name="search"--%>
        <%--                        style="width: 250px"--%>
        <%--                        class="form-control rounded-start-4 border-secondary-subtle fs-7 shadow-none bg-transparent"--%>
        <%--                        placeholder="Tìm kiếm video, người dùng..."--%>
        <%--                />--%>
        <%--                <button--%>
        <%--                        class="btn border-secondary-subtle d-flex align-items-center justify-content-center rounded-end-4 bg-dark bg-opacity-50"--%>
        <%--                        type="submit"--%>
        <%--                >--%>
        <%--                            <span class="material-symbols-outlined">--%>
        <%--                                search--%>
        <%--                            </span>--%>
        <%--                </button>--%>
        <%--            </div>--%>
        <%--        </form>--%>
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
                class="collapse navbar-collapse flex-grow-0 gap-3"
                id="navbarSupportedContent"
                style="width: fit-content"
        >
            <c:if test="${userAuth!=null}">
                <a
                        href="${pageContext.request.contextPath}/moovee/upload"
                        style="
                            padding-top: 6px;
                            padding-bottom: 6px;
                            width: fit-content;
                        "
                        class="btn bg-purple-custom border-0 fs-7 fw-medium text-light rounded-4 d-flex align-items-center gap-1"
                >
                        <span class="material-symbols-outlined">
                            video_call
                        </span>
                    Đăng video</a
                >
            </c:if>
            <c:if test="${userAuth!=null}">
                <div class="dropdown">
                    <div
                            class="btn p-1 border-0 bg-white rounded-circle shadow-sm"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                    >
                        <img
                                src="${userAuth.avartar==null?'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A':userAuth.avartar}"
                                alt=""
                                style="height: 30px; width: 30px"
                                class="rounded-circle"
                        />
                    </div>

                    <ul
                            class="dropdown-menu dropdown-menu-end mt-2 rounded-4 border-0 shadow-lg overflow-hidden bg-dark p-2"
                    >
                        <li>
                            <a
                                    class="dropdown-item d-flex gap-2 fs-7 align-items-center py-2 pe-5 rounded-3"
                                    href="${pageContext.request.contextPath}/moovee/profile"
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
                                        history
                                    </span>
                                <span>Đã xem</span>
                            </a>
                        </li>
                        <li>
                            <a
                                    class="dropdown-item d-flex gap-2 fs-7 align-items-center py-2 pe-5 rounded-3"
                                    href="#"
                            >
                                    <span class="material-symbols-outlined">
                                        favorite
                                    </span>
                                <span>Yêu thích</span>
                            </a>
                        </li>
                        <li>
                            <a
                                    class="dropdown-item d-flex gap-2 fs-7 align-items-center py-2 pe-5 rounded-3"
                                    href="${pageContext.request.contextPath}/moovee/logout"
                            >
                                    <span class="material-symbols-outlined">
                                        logout
                                    </span>
                                <span>Đăng xuất</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </c:if>

            <c:if test="${sessionScope.get('user')==null}">
                <a
                        href="${pageContext.request.contextPath}/login"
                        class="btn bg-white border-0 fs-7 fw-medium text-dark py-2 rounded-4"
                >Đăng nhập</a
                >
            </c:if>
        </div>
    </div>
</nav>

<!-- Main -->
<main class="justify-content-center d-flex setup-frame pt-5">
    <div class="container row p-0 pb-5">
        <div class="col-xl-9 col-lg-8 col-md-12">
            <iframe
                    class="rounded-4 video-detail shadow-light z-1"
                    width="560"
                    height="315"
                    src="${detailsVideo.urlVideo}"
                    title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    allowfullscreen
            ></iframe>

            <div
                    class="container z-2 mt-2 py-3 px-0 bg-black bg-opacity-10 px-3 rounded-4"
            >
                <div class="row mb-3 gap-2 align-items-center">
                    <div
                            class="d-flex align-items-center col-md col-12"
                    >
                        <a href="#">
                            <img
                                    src="${detailsVideo.poster.avartar}"
                                    alt="avatar"
                                    class="rounded-circle"
                                    style="width: 30px; height: 30px"
                            />
                        </a>
                        <div class="d-flex flex-column ms-2 col-auto">
                            <a
                                    href="#"
                                    class="fw-bold fs-6 text-decoration-none text-light"
                            >${detailsVideo.poster.fullname}</a
                            >
                            <div
                                    class="fw-light fs-8 text-secondary-emphasis"
                            >
                                <span id="countFollowOfUser">${fn:length(detailsVideo.poster.follows)}</span> người theo dõi
                            </div>
                        </div>
                    </div>
                    <div class="d-flex flex-wrap col-auto gap-2">
                        <c:if test="${userAuth.id != detailsVideo.poster.id}">
                            <button
                                    id="btnFollow"
                                    data-user-id="${userAuth.id}"
                                    data-is-followed="${isLiked}"
                                    data-follow-id="${detailsVideo.poster.id}"
                                    class="btn h-fit d-flex align-items-center px-3 bg-purple-custom fs-7 fw-medium rounded-3"
                            >
                                <i id="ringFollow" class="bi bi-bell-fill ms-1 d-none"></i>
                                <div>Theo dõi</div>
                            </button>
                        </c:if>
                        <button
                                id="btn-like"
                                data-video-id="${detailsVideo.id}"
                                data-user-id="${userAuth.id}"
                                data-is-liked="${isLiked}"
                                class="btn bg-secondary bg-opacity-25 fw-medium h-fit border-0 d-flex gap-1 align-items-center fs-6 rounded-3"
                        >
                            <i class="bi bi-heart"></i>
                            <span>${fn:length(detailsVideo.likes)}</span>
                        </button>
                        <button
                                id="btnShare"

                                class="btn h-fit d-flex gap-1 align-items-center py-1 fs-7 fw-medium bg-secondary bg-opacity-25 rounded-3"
                        >
                            <i class="bi bi-reply fs-5 d-flex justify-content-center flip-horizontal"
                               style="height: 24px"></i>
                            Chia sẻ
                        </button>
                    </div>
                </div>
                <div
                        class="fw-bold row m-0 mb-1"
                        style="line-height: normal"
                >
                    ${detailsVideo.title}
                </div>
                <div class="fs-7 row m-0 mb-2">
                    ${detailsVideo.decription}
                </div>
                <div class="d-flex gap-3 text-light text-opacity-75">
                    <div class="d-flex fs-7 gap-1 align-items-center">
                        <span class="fw-semibold">${fn:length(detailsVideo.recents)}</span> lượt xem
                    </div>
                    <div class="d-flex fs-7 gap-1 align-items-center">
                        <span class="fw-semibold">${fn:length(detailsVideo.shares)}</span> lượt chia
                        sẻ
                    </div>
                    <div>•</div>
                    <div class="d-flex fs-7 gap-1 align-items-center">
                        <span class="fw-semibold">${detailsVideo.postedDate}</span>
                    </div>
                </div>
            </div>
            <form class="row m-0 mt-3 gap-2" id="formComment">
                <input
                        type="text"
                        placeholder="Thêm bình luận..."
                        class="form-control rounded-3 fs-7 py-2 border-dark-subtle col"
                />
                <button
                        id="btnUploadComment"
                        class="btn bg-white text-dark fs-6 fw-medium rounded-3 col-auto px-3"
                >
                    Đăng
                </button>
            </form>
            <div class="row m-0 mt-4 gap-3">
                <c:if test="${fn:length(detailsVideo.comments)>0}">
                    <div
                            class="d-flex gap-1 align-items-center p-0"
                            style="font-size: 1.1rem"
                    >
                        <i class="bi bi-chat-fill me-1"></i>
                        <span class="fw-bold">${fn:length(detailsVideo.comments)}</span>
                        <span class="fw-bold">Bình luận</span>
                    </div>
                    <div
                            class="row m-0 p-0 gap-4 bg-black bg-opacity-10 p-3 rounded-4"
                    >
                        <c:forEach items="${detailsVideo.comments}" var="comment">
                            <div class="row m-0 p-0 align-items-center">
                                <div
                                        class="col d-flex align-items-start p-0 gap-2"
                                >
                                    <a
                                            href=""
                                            class="fw-bold text-decoration-none text-light"
                                    >
                                        <img
                                                src="${comment.userComment.avtImage}"
                                                class="rounded-circle col-auto"
                                                style="width: 30px; height: 30px"
                                        />
                                    </a>
                                    <div class="col">
                                        <div class="fs-7">
                                            <a
                                                    href="#"
                                                    class="fw-bold text-decoration-none text-light"
                                            >${comment.userComment.fullname}</a
                                            >
                                            <span class="text-white-50">•</span>
                                            <span class="text-white-50 fs-8"
                                            >${comment.userComment.email}</span
                                            >
                                        </div>
                                        <div class="fw-light fs-7">
                                                ${comment.comment}
                                        </div>
                                    </div>
                                </div>
<%--                                <div class="col-auto p-0">--%>
<%--                                    <button--%>
<%--                                            class="btn bg-transparent fs-7 p-0 border-0 px-1 pe-2 rounded-3 d-flex align-items-center justify-content-center"--%>
<%--                                    >--%>
<%--                                        <span--%>
<%--                                                class="material-symbols-outlined fs-5"--%>
<%--                                        >--%>
<%--                                            favorite--%>
<%--                                        </span>--%>
<%--                                        <span class="fw-medium">9</span>--%>
<%--                                    </button>--%>
<%--                                </div>--%>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${fn:length(detailsVideo.comments)<=0}">
                    <div
                            class="d-flex gap-1 align-items-center p-0"
                            style="font-size: 1.1rem"
                    >
                        <i class="bi bi-chat-fill me-1"></i>
                        <span class="fw-bold">Chưa có bình luận nào</span>
                    </div>
                </c:if>

            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-12 rounded-4 py-0">
            <div
                    class="col-12 fw-semibold mb-3 mt-lg-0 mt-3"
                    style="font-size: 1.1rem"
            >
                Video liên quan
            </div>
            <div class="row gy-3 px-md-0 px-4">
                <!-- Video model -->
                <c:forEach items="${detailsVideo.poster.videos}" var="video">
                    <!-- Video model -->
                    <c:if test="${video.id != detailsVideo.id}">
                        <div class="col-12 col-md-6 col-lg-12 h-100">
                            <div
                                    class="position-relative d-flex flex-column justify-content-between"
                            >
                                <img
                                        src="${video.urlImage}"
                                        onclick="goToVideo('${video.id}')"
                                        class="w-100 video cursor-pointer object-fit-cover rounded-3 pointer"
                                />
                                    <%--                            <div--%>
                                    <%--                                    class="position-absolute top-0 start-0 z-1 w-fit ps-2 pt-1"--%>
                                    <%--                            >--%>
                                    <%--                                    <span--%>
                                    <%--                                            class="bg-black px-2 py-1 bg-opacity-50 rounded-3 fs-8"--%>
                                    <%--                                    >26:00</span--%>
                                    <%--                                    >--%>
                                    <%--                            </div>--%>
                                <div class="mt-2">
                                    <div class="d-flex justify-content-between">
                                        <a
                                                href="${pageContext.request.contextPath}/${video.poster.id}"
                                                class="d-flex gap-2 align-items-center text-decoration-none text-light"
                                        >
                                            <img
                                                    src="${video.poster.avartar}"
                                                    alt="avt"
                                                    class="avt"
                                            />
                                            <span class="fs-7 fw-medium text-truncate"
                                            >${video.poster.fullname}</span
                                            >
                                            <span class="text-white-50">•</span>
                                            <span class="text-white-50 fs-8"
                                            >${video.postedDate}</span
                                            >
                                        </a>
                                        <div class="dropdown">
                                            <a
                                                    class="btn p-0 border-0"
                                                    href="#"
                                                    role="button"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false"
                                            >
                                                <span
                                                        class="material-symbols-outlined"
                                                >
                                                    more_vert
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                    <div
                                            class="modal fade"
                                            id="shareModal"
                                            data-bs-backdrop="static"
                                            data-bs-keyboard="false"
                                            tabindex="-1"
                                            aria-labelledby="staticBackdropLabel"
                                            aria-hidden="true"
                                    >
                                        <div
                                                class="modal-dialog modal-dialog-centered modal-lg"
                                        >
                                            <div class="modal-content">
                                                <div
                                                        class="modal-header position-relative"
                                                >
                                                    <div
                                                            class="modal-title fs-5 text-center w-100"
                                                            id="staticBackdropLabel"
                                                    >
                                                        Chia sẻ đến
                                                    </div>
                                                    <button
                                                            type="button"
                                                            class="btn-close bg-secondary bg-opacity-10 rounded-circle p-2 fs-7 position-absolute"
                                                            data-bs-dismiss="modal"
                                                            aria-label="Close"
                                                    ></button>
                                                </div>
                                                <form
                                                        action=""
                                                        method="post"
                                                        class="modal-body"
                                                >
                                                    <div>
                                                        <div
                                                                class="row align-items-center"
                                                        >
                                                            <div
                                                                    class="d-flex gap-2 align-items-center col-5"
                                                            >
                                                                <img
                                                                        src=""
                                                                        alt="avt"
                                                                        class="avt"
                                                                        style="
                                                                        width: 34px;
                                                                        height: 34px;
                                                                    "
                                                                />
                                                                <div
                                                                        class="d-flex flex-column"
                                                                >
                                                                    <span
                                                                            class="fs-7 fw-semibold"
                                                                    >Name of
                                                                        author</span
                                                                    >
                                                                    <span
                                                                            class="fs-8"
                                                                    >hieudqpd10569@gmail.com</span
                                                                    >
                                                                </div>
                                                            </div>
                                                            <span
                                                                    class="material-symbols-outlined col-2 justify-content-center d-flex p-0"
                                                            >
                                                                forward_to_inbox
                                                            </span>

                                                            <div
                                                                    class="d-flex gap-2 align-items-center col-5"
                                                            >
                                                                <img
                                                                        src=""
                                                                        alt="avt"
                                                                        class="avt"
                                                                        style="
                                                                        width: 34px;
                                                                        height: 34px;
                                                                    "
                                                                />
                                                                <div
                                                                        class="d-flex flex-column w-100"
                                                                >
                                                                    <span
                                                                            class="fs-7 fw-semibold"
                                                                    >Người
                                                                        nhận</span
                                                                    >
                                                                    <input
                                                                            type="email"
                                                                            class="form-control fs-8 rounded-0 py-0 border-0 px-0 w-100"
                                                                            placeholder="Nhập email nguời nhận"
                                                                    />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label
                                                                    class="fs-7 fw-semibold mt-3"
                                                            >Nội dung</label
                                                            >
                                                            <textarea
                                                                    class="form-control fs-7 fw-light mb-3 rounded-3 py-0 px-2 py-2"
                                                                    rows="3"
                                                                    placeholder="Hãy chia sẻ cảm nhận của bạn về video này..."
                                                            ></textarea>
                                                        </div>
                                                    </div>

                                                    <button
                                                            type="button"
                                                            class="btn btn-primary bg-purple-custom border-0 fs-6 rounded-3 w-fit float-end"
                                                    >
                                                        Chia sẻ ngay
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                            onclick="goToVideo('${video.id}')"
                                            class="mb-1 truncate-text pe-2 fw-medium pointer link-vd"
                                    >
                                            ${video.title}
                                    </div>

                                    <div
                                            class="d-flex align-items-center gap-1 text-white-50 fs-8"
                                    >
                                        <div class="d-flex fs-8 gap-1">
                                        <span>
                                                ${video.viewCount}
                                        </span> lượt xem
                                        </div>
                                        •
                                        <div class="d-flex fs-8 gap-1">
                                            <span>${fn:length(video.likes)}</span> thích
                                        </div>
                                        •
                                        <div class="d-flex fs-8 gap-1">
                                            ${video.postedDate}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>

    <%-- Modal Login --%>
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="titleModalLogin" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h1 class="modal-title fs-5" id="titleModalLogin">Bạn thích video này?</h1>
                </div>
                <div class="modal-body fs-7 pt-1 pb-2">
                    Đăng nhập hoặc tạo tài khoản để thể hiện ý kiến của mình.
                </div>
                <div class="modal-footer border-0">
                    <a class="btn btn-secondary fs-7 bg-secondary bg-opacity-25 border-0">Đăng ký</a>
                    <a href="${pageContext.request.contextPath}/login"
                       class="btn btn-primary fs-7 bg-purple-custom border-0">Đăng nhập</a>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal Share --%>
    <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="titleModalShare" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="titleModalShare">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
    const btnLike = document.getElementById("btn-like");
    const btnShare = document.getElementById("btnShare");
    const btnFollow = document.getElementById("btnFollow");
    const btnUploadComment = document.getElementById("btnUploadComment");
    const formComment = document.getElementById("formComment");
    const ringFollow = document.getElementById("ringFollow");
    const countFollowOfUser = document.getElementById("countFollowOfUser");

    const goToVideo = (urlVideo) => {
        location.href = "${pageContext.request.contextPath}/moovee/videos/" + urlVideo;
    }

    const setupBtnLike = (like, btnLike) => {
        if (like) {
            btnLike.classList.remove("bg-secondary");
            btnLike.classList.remove("bg-opacity-25");
            btnLike.classList.add("bg-white");
            btnLike.classList.add("text-black");
            btnLike.children[0].classList.remove("bi-heart");
            btnLike.children[0].classList.add("bi-heart-fill");
            btnLike.children[0].classList.add("text-danger");
        } else {
            btnLike.classList.remove("bg-white");
            btnLike.classList.remove("text-black");
            btnLike.classList.add("bg-secondary");
            btnLike.classList.add("bg-opacity-25");
            btnLike.children[0].classList.add("bi-heart");
            btnLike.children[0].classList.remove("bi-heart-fill");
            btnLike.children[0].classList.remove("text-danger");
        }
    }

    document.addEventListener('DOMContentLoaded', () => {

        if (${userAuth!=null}) {

            // Like button
            const videoId = btnLike.dataset.videoId;
            const userId = btnLike.dataset.userId;

            const url = "http://localhost:8080/ASSSIGNMENT_war_exploded/moovee/videos/checkLike";
            const params = {
                userId: userId,
                videoId: videoId,
            }
            const queryString = new URLSearchParams(params).toString();
            const options = {
                method: 'GET',
            }

            fetch(url + "?" + queryString, options)
                .then((response) => {
                    return response.json();
                }).then((data) => {
                if (data) {
                    btnLike.dataset.isLiked = data.isLiked;
                    setupBtnLike(data.isLiked, btnLike);
                } else {
                    console.error('Error fetching like status: ', data);
                }
            }).catch((error) => {
                console.error('Error: ', error);
                alert('Không thể kết nối đến server!')
            })

            btnLike.addEventListener("click", () => {

                const url = "http://localhost:8080/ASSSIGNMENT_war_exploded/moovee/videos/like"

                const data = {
                    userId: userId,
                    videoId: videoId,
                    isLiked: btnLike.dataset.isLiked,
                }

                const options = {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data),
                }

                fetch(url, options)
                    .then((response) => {
                        return response.json();
                    }).then((data) => {
                    if (data) {
                        btnLike.dataset.isLiked = data.isLiked;
                        setupBtnLike(data.isLiked, btnLike);
                        btnLike.children[1].textContent =
                            data.isLiked
                                ? Number.parseInt(btnLike.children[1].textContent) + 1
                                : Number.parseInt(btnLike.children[1].textContent) - 1
                    } else {
                        console.error('Error fetching like status: ', data);
                    }
                }).catch((error) => {
                    console.error('Error: ', error);
                    alert('Không thể kết nối đến server!')
                })
            })

            // Follow button
            if (btnFollow) {
                const userIdOfFollow = btnFollow.dataset.userId;
                const followIdOfFollow = btnFollow.dataset.followId;

                const urlFollow = "http://localhost:8080/ASSSIGNMENT_war_exploded/moovee/checkFollow";
                const paramsFollow = {
                    userId: userIdOfFollow,
                    followId: followIdOfFollow,
                }
                const queryStringFollow = new URLSearchParams(paramsFollow).toString();
                const optionsFollow = {
                    method: 'GET',
                }

                fetch(urlFollow + "?" + queryStringFollow, optionsFollow)
                    .then((response) => {
                        return response.json();
                    }).then((data) => {
                    btnFollow.dataset.isFollowed = data.isFollowed;
                    btnFollow.textContent = data.isFollowed ? 'Đang theo dõi' : 'Theo dõi'
                    if (data.isFollowed) {
                        ringFollow.classList.remove("d-none");
                        btnFollow.insertBefore(ringFollow, btnFollow.children[0]);
                    } else {
                        if (btnFollow.contains(ringFollow)) {
                            btnFollow.removeChild(ringFollow);
                        }
                    }
                }).catch((error) => {
                    console.error('Error: ', error);
                    alert('Không thể kết nối đến server!')
                });

                btnFollow.addEventListener("click", () => {
                    const url = "http://localhost:8080/ASSSIGNMENT_war_exploded/moovee/follow";

                    const data = {
                        userId: userIdOfFollow,
                        followId: followIdOfFollow,
                        isFollowed: btnFollow.dataset.isFollowed,
                    }

                    const options = {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data),
                    }

                    fetch(url, options)
                        .then((response) => {
                            return response.json();
                        }).then((data) => {
                        btnFollow.dataset.isFollowed = data.isFollowed;
                        btnFollow.textContent = data.isFollowed ? 'Đang theo dõi' : 'Theo dõi'
                        if (data.isFollowed) {
                            ringFollow.classList.remove("d-none");
                            btnFollow.insertBefore(ringFollow, btnFollow.children[0]);
                            countFollowOfUser.textContent = Number.parseInt(countFollowOfUser.textContent) + 1
                        } else {
                            if (btnFollow.contains(ringFollow)) {
                                btnFollow.removeChild(ringFollow);
                            }
                            countFollowOfUser.textContent = Number.parseInt(countFollowOfUser.textContent) - 1
                        }
                    })
                })
            }

        } else {
            btnLike.setAttribute("data-bs-target", "#loginModal");
            btnLike.setAttribute("data-bs-toggle", "modal")
            btnShare.setAttribute("data-bs-target", "#loginModal");
            btnShare.setAttribute("data-bs-toggle", "modal")
            btnFollow.setAttribute("data-bs-target", "#loginModal");
            btnFollow.setAttribute("data-bs-toggle", "modal")
            btnUploadComment.setAttribute("data-bs-target", "#loginModal");
            btnUploadComment.setAttribute("data-bs-toggle", "modal")
        }
    })
</script>
<script>
</script>
</html>
