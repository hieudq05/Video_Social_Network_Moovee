<%@ page import="service.like.ILikeService" %>
<%@ page import="service.like.LikeService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Moovee</title>
</head>

<style>
    .link-vd:hover {
        text-decoration: underline !important;
    }
    .py-1-5{
        padding-top: 0.3rem;
        padding-bottom: 0.3rem;
    }
    .video{
        transition: all 0.3s ease;
    }
    .video:hover{
        scale: 1.03;
    }
    .flip-horizontal {
        transform: scaleX(-1);
    }
    .spinner-size {
        width: 18px !important;
        height: 18px !important;
    }
</style>

<body>

<c:set value="${sessionScope.get('user')}" var="userAuth"></c:set>

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
                                    href="${pageContext.request.contextPath}/moovee/profile/"
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

<!-- Main content -->
<div class="setup-frame container pb-5 mb-5">
    <main>
        <c:if test="${userAuth!=null }">
            <c:if test="${ userAuth.number==null || userAuth.gender==null
            || userAuth.avartar==null || userAuth.coverImage==null }">
                <a href="${pageContext.request.contextPath}/moovee/profile" class="mt-4 btn bg-secondary bg-opacity-10 text-warning fs-7">
                    <i class="bi bi-cone-striped"></i>
                    Hoàn thành hồ sơ cá nhân của bạn.
                </a>
            </c:if>
        </c:if>
        <!-- Category bar -->
        <div class="container py-4 px-0">
            <ul
                    class="nav nav-pills d-flex w-100"
                    id="myTab"
                    role="tablist"
            >
                <li class="nav-item" role="presentation">
                    <button
                            class="active py-1-5 nav-link text-light fs-7 text-opacity-50 fw-medium rounded-3"
                            id="all"
                            data-bs-toggle="tab"
                            data-bs-target="#home-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="home-tab-pane"
                            aria-selected="true"
                    >
                        Tất cả
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button
                            class="nav-link text-light fs-7 py-1-5 text-opacity-50 fw-medium rounded-3"
                            id="trending"
                            data-bs-toggle="tab"
                            data-bs-target="#home-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="home-tab-pane"
                            aria-selected="true"
                    >
                        Thịnh hành
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button
                            class="nav-link text-light fs-7 py-1-5 text-opacity-50 fw-medium rounded-3"
                            id="new"
                            data-bs-toggle="tab"
                            data-bs-target="#profile-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="profile-tab-pane"
                            aria-selected="false"
                    >
                        Mới nhất
                    </button>
                </li>
            </ul>
        </div>

        <!-- Video list -->
        <div class="container px-0">
            <div class="row g-4" id="containerVideo">
                <c:forEach items="${videos}" var="video">
                    <!-- Video model -->
                    <div class="col-12 col-md-6 col-lg-4 h-100">
                        <div
                                class="position-relative d-flex flex-column justify-content-between"
                        >
                            <img
                                    src="${video.urlImage}"
                                    onclick="goToVideo('${video.id}')"
                                    class="w-100 video cursor-pointer object-fit-cover rounded-3 pointer"
                            />
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
                                        <span class="fs-7 fw-medium"
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

                                        <ul
                                                class="dropdown-menu rounded-4 border-0 shadow-lg overflow-hidden bg-dark-subtle"
                                        >
                                            <li>
                                                <button
                                                        class="dropdown-item d-flex gap-3 fs-8 align-items-center py-1 pe-4"
                                                        href="#"
                                                >
                                                    <i
                                                            class="bi bi-person-check-fill fs-5"
                                                    ></i>
                                                    <span>Xem hồ sơ</span>
                                                </button>
                                            </li>
                                            <li>
                                                <button
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#shareModal"
                                                        class="dropdown-item d-flex gap-3 fs-8 align-items-center py-2 pe-4"
                                                        href="#"
                                                >
                                                    <i
                                                            class="bi bi-send-fill fs-6"
                                                    ></i>
                                                    <span>Chia sẻ</span>
                                                </button>
                                            </li>
                                        </ul>
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
                                            class="modal-dialog modal-dialog-centered"
                                    >
                                        <div class="modal-content">
                                            <div
                                                    class="modal-header position-relative bg-opacity-50"
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
                                                                class="d-flex flex-column w-100"
                                                        >
                                                                <span
                                                                        class="fs-8 fw-semibold"
                                                                >Người
                                                                    nhận</span
                                                                >
                                                            <input
                                                                    type="email"
                                                                    class="form-control fs-6 w-100 mt-2"
                                                                    placeholder="Nhập email nguời nhận"
                                                            />
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <div
                                                    class="modal-footer d-flex justify-content-end border-opacity-50"
                                            >
                                                <button
                                                        type="button"
                                                        class="btn bg-purple-custom text-light fs-7 fw-medium rounded-4"
                                                        data-bs-dismiss="modal"
                                                >
                                                    Chia sẻ
                                                </button>
                                            </div>
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
                                        class="d-flex align-items-center gap-1 text-white-50 fs-7"
                                >
                                    <div class="d-flex fs-7 gap-1">
                                        <span>
                                                ${fn:length(video.recents)}
                                        </span> lượt xem
                                    </div>
                                    •
                                    <div class="d-flex fs-7 gap-1">
                                        <span>${fn:length(video.likes)}</span> thích
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <div class="row justify-content-center">
                <button
                        id="loadMore"
                        class="btn d-flex align-items-center justify-content-center w-fit bg-white rounded-4 mt-4 fs-7 text-dark pe-3 border-0 px-4"
                >
                    Xem thêm
                    <span class="material-symbols-outlined">
                                keyboard_arrow_down
                            </span>
                </button>
                <div
                        id="loading"
                        class="d-none py-2 d-flex align-items-center justify-content-center w-fit bg-white rounded-4 mt-4 fs-7 text-dark pe-3 border-0 px-4"
                >
                    Đang tải
                    <div class="spinner-grow text-black spinner-size ms-2" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script>
    var page = 0;
    const pagesize = 6;
    var isLoading = false;
    var isEnd = false;

    const containerVideo = document.getElementById('containerVideo');
    const all = document.getElementById("all");
    const trending = document.getElementById("trending");
    const newLink = document.getElementById("new");
    const loadMore = document.getElementById("loadMore");
    const loading = document.getElementById("loading");

    async function loadVideo (typeVideo) {
        if (isLoading || isEnd) return;
        isLoading = true;
        loading.classList.remove('d-none');
        loadMore.classList.add('d-none');
        const response = await fetch("${pageContext.request.contextPath}/moovee"+typeVideo.toString()+"?page="+page+"&pageSize="+pagesize);
        if(!response.ok) {
            isLoading = false;
            loading.classList.add('d-none');
            console.alert('Đã xảy ra lỗi khi tải video');
            return;
        }
        const data = await response.json();
        if(data.length == 0) {
            containerVideo.innerHTML = "<div class='text-center fs-7 text-white-50 py-5'>Không có video nào</div>";
        } else {
            data.forEach((video) => {
                const videoElement = document.createElement('div');
                videoElement.classList.add('col-12', 'col-md-6', 'col-lg-4', 'h-100');
                videoElement.innerHTML = 
                "<div class='position-relative d-flex flex-column justify-content-between'>" +
                    "<img " +
                        "src='"+video.urlImage+"' " +
                        "onclick='goToVideo(\""+ video.id+"\")' " +
                        "class='w-100 video cursor-pointer object-fit-cover rounded-3 pointer' />" +
                    "<div class='mt-2'>" +
                        "<div class='d-flex justify-content-between'>" +
                            "<a " +
                                "href='${pageContext.request.contextPath}/"+video.posterId+"' " +
                                "class='d-flex gap-2 align-items-center text-decoration-none text-light'>" +
                                "<img " +
                                    "src='"+video.urlAvatarImage+"' " +
                                    "alt='avt' " +
                                    "class='avt' />" +
                                "<span class='fs-7 fw-medium'>" +
                                    video.fullnameUser +
                                "</span>" +
                                "<span class='text-white-50'>•</span>" +
                                "<span class='text-white-50 fs-8'>" +
                                    video.postedDate +
                                "</span>" +
                            "</a>" +
                            "<div class='dropdown'>" +
                                "<a class='btn p-0 border-0' href='#' role='button' data-bs-toggle='dropdown' aria-expanded='false'>" +
                                    "<span class='material-symbols-outlined'>more_vert</span>" +
                                "</a>" +
                                "<ul class='dropdown-menu rounded-4 border-0 shadow-lg overflow-hidden bg-dark-subtle'>" +
                                    "<li>" +
                                        "<button class='dropdown-item d-flex gap-3 fs-8 align-items-center py-1 pe-4'>" +
                                            "<i class='bi bi-person-check-fill fs-5'></i>" +
                                            "<span>Xem hồ sơ</span>" +
                                        "</button>" +
                                    "</li>" +
                                    "<li>" +
                                        "<button data-bs-toggle='modal' data-bs-target='#shareModal' class='dropdown-item d-flex gap-3 fs-8 align-items-center py-2 pe-4'>" +
                                            "<i class='bi bi-send-fill fs-6'></i>" +
                                            "<span>Chia sẻ</span>" +
                                        "</button>" +
                                    "</li>" +
                                "</ul>" +
                            "</div>" +
                        "</div>" +
                        "<div onclick='goToVideo(\""+video.id+"\")' class='mb-1 truncate-text pe-2 fw-medium pointer link-vd'>" +
                            video.title +
                        "</div>" +
                        "<div class='d-flex align-items-center gap-1 text-white-50 fs-7'>" +
                            "<div class='d-flex fs-7 gap-1'>" +
                                "<span>"+video.viewCount+"</span> lượt xem" +
                            "</div>" +
                            "•" +
                            "<div class='d-flex fs-7 gap-1'>" +
                                "<span>"+video.likeCount+"</span> thích" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
                containerVideo.appendChild(videoElement);
            });
        }
        page++;
        isLoading = false;
        if (data.length < pagesize) {
            isEnd = true;
            loadMore.classList.add('d-none');
            loading.classList.add('d-none');
        } else {
            loadMore.classList.remove('d-none');
            loading.classList.add('d-none');
        }
    };

    var url = "/all";

    all.addEventListener("click", () => {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "/all";
        loadVideo(urlMyVideo);
    });

    trending.addEventListener("click", () => {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "/trending";
        loadVideo(urlMyVideo);
    })

    newLink.addEventListener("click", () => {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "/new";
        loadVideo(urlMyVideo);
    })

    const goToVideo = (urlVideo) => {
        location.href = "${pageContext.request.contextPath}/moovee/videos/" + urlVideo;
    }

    loadMore.addEventListener('click', function () {
        loadVideo(url);
    });

    loadVideo(url);
    
</script>
</body>
</html>
