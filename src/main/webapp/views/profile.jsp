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
    <title>Document</title>
</head>

<style>
    .bg-no-cvi {
        background: linear-gradient(#ffffff20, #ffffff05) !important;
    }


    .fl-c:hover {
        background-color: #ffffff05 !important;
    }

    .avt-lg{
        width: 170px !important;
        height: 170px !important;
        object-fit: cover !important;
    }

    .spinner-size {
        width: 18px !important;
        height: 18px !important;
    }
</style>

<body>
<div>

    <c:set value="${sessionScope.get('user')}" var="userAuth"></c:set>
    <c:set value="${fn:length(userAuth.follows)}" var="countFollow"></c:set>
    <c:set value="${fn:length(userAuth.followers)}" var="countFollower"></c:set>

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
    <div class="setup-frame">
        <main>
            <c:if test="${userAuth.coverImage!=null}">
                <img
                        src="${userAuth.coverImage}"
                        class="container-fluid p-0 bg-img d-flex justify-content-center position-relative rounded-bottom-5 shadow-lg"
                />
            </c:if>
            <c:if test="${userAuth.coverImage==null}">
                <div
                        class="container-fluid p-0 bg-img bg-no-cvi d-flex justify-content-center align-items-center text-white text-opacity-25 position-relative rounded-bottom-5 shadow-lg"
                >
                    <span class="pb-5">Chưa thiết lập ảnh bìa</span>
                </div>
            </c:if>
            <div
                    class="container d-flex align-items-center flex-column position-relative py-4"
            >
                <div
                        class="position-absolute p-1 shadow-sm bg-dark-subtle rounded-circle d-flex flex-column justify-content-center align-items-center"
                        style="top: -100px; width: fit-content"
                >
                    <img
                            src="${userAuth.avartar==null?'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A':userAuth.avartar}"
                            alt="background-image"
                            class="rounded-circle avt-lg"
                    />
                </div>
                <div
                        class="position-relative mt-5 py-3 row text-center gap-1"
                >
                    <div class="fs-4 fw-semibold col-12">
                        ${ userAuth.fullname }
                    </div>
                    <div
                            class="col-12 d-flex justify-content-center gap-4 fs-7"
                    >
                        <div
                                class="w-fit pointer"
                                data-bs-toggle="modal"
                                data-bs-target="#followsModal"
                        >
                            <span class="fw-semibold">${countFollower}</span>
                            <span class="fw-light"> Đang theo dõi</span>
                        </div>
                        <div
                                class="w-fit pointer"
                                data-bs-toggle="modal"
                                data-bs-target="#followsModal"
                        >
                            <span class="fw-semibold">${countFollow} </span>
                            <span class="fw-light">Người theo dõi</span>
                        </div>
                        <!-- Modal -->
                        <div
                                class="modal fade"
                                id="followsModal"
                                tabindex="-1"
                                aria-labelledby="exampleModalLabel"
                                aria-hidden="true"
                        >
                            <div
                                    class="modal-dialog modal-dialog-scrollable"
                            >
                                <div
                                        class="modal-content bg-dark-subtle rounded-4 px-3 pt-4 pb-3"
                                >
                                    <div
                                            class="modal-header border-bottom-0 flex-column p-0"
                                    >
                                        <div
                                                class="position-relative d-flex justify-content-center w-100 mb-2"
                                        >
                                            <h1
                                                    class="modal-title fs-5"
                                                    id="exampleModalLabel"
                                            >
                                                ${userAuth.fullname}
                                            </h1>
                                            <button
                                                    type="button"
                                                    class="btn-close rounded-circle fs-7 position-absolute end-0"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close"
                                            ></button>
                                        </div>
                                        <ul
                                                class="nav nav-underline sticky-top bg-dark-subtle w-100"
                                                id="myTab"
                                                role="tablist"
                                        >
                                            <li
                                                    class="nav-item mx-auto"
                                                    role="presentation"
                                            >
                                                <button
                                                        class="nav-link text-light text-opacity-50 fw-medium active"
                                                        id="followLink"
                                                        data-bs-toggle="tab"
                                                        data-bs-target="#home-tab-pane"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="home-tab-pane"
                                                        aria-selected="true"
                                                >
                                                    Đang theo dõi
                                                </button>
                                            </li>
                                            <li
                                                    class="nav-item mx-auto"
                                                    role="presentation"
                                            >
                                                <button
                                                        class="nav-link text-light text-opacity-50 fw-medium"
                                                        id="followerLink"
                                                        data-bs-toggle="tab"
                                                        data-bs-target="#profile-tab-pane"
                                                        type="button"
                                                        role="tab"
                                                        aria-controls="profile-tab-pane"
                                                        aria-selected="false"
                                                >
                                                    Người theo dõi
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-body p-0">
                                        <div
                                                class="tab-content"
                                                id="myTabContent"
                                        >
                                            <div
                                                    class="tab-pane fade show active"
                                                    id="home-tab-pane"
                                                    role="tabpanel"
                                                    aria-labelledby="follow"
                                                    tabindex="0"
                                            >
                                                
                                                <c:if test="${countFollower==0}">
                                                    <div
                                                            class="py-5 text-center d-flex align-items-center px-2 w-100"
                                                    >
                                                        Bạn chưa theo dõi người dùng nào. Hãy theo dõi người dùng khác để xem thêm nhiều nội dung thú vị ❤️.
                                                    </div>
                                                </c:if>

                                                <%-- Follow model --%>
                                                <c:forEach items="${userAuth.followers}" var="follow">
                                                    <div
                                                            class="py-3 d-flex justify-content-between px-2 rounded-3 fl-c"
                                                    >
                                                        <a
                                                                href="#"
                                                                class="d-flex align-items-center gap-3 text-decoration-none text-light"
                                                        >
                                                            <img
                                                                    src="${follow.userFollowed.avartar==null?'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A':follow.userFollowed.avartar}"
                                                                    alt="bg-img"
                                                                    style="
                                                                        width: 34px;
                                                                        height: 34px;
                                                                    "
                                                                    class="avt rounded-circle"
                                                            />
                                                            <div
                                                                    class="text-start"
                                                            >
                                                                <div
                                                                        class="fs-6 fw-semibold"
                                                                >
                                                                        ${follow.userFollowed.fullname}
                                                                </div>
                                                                <div
                                                                        class="fs-8 text-opacity-50 text-light"
                                                                >
                                                                        ${follow.userFollowed.email}
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="">
                                                            <button
                                                                    class="btn bg-secondary h-100 bg-opacity-25 border-0 rounded-3 fs-7 fw-medium"
                                                            >
                                                                Huỷ theo dõi
                                                            </button>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div
                                                    class="tab-pane fade"
                                                    id="profile-tab-pane"
                                                    role="tabpanel"
                                                    aria-labelledby="follower"
                                                    tabindex="0"
                                            >

                                                <c:if test="${countFollow==0}">
                                                    <div
                                                            class="py-5 text-center d-flex align-items-center px-2"
                                                    >
                                                        Chưa có người dùng nào theo dõi bạn. Thu hút người dùng theo dõi bằng cách đăng những nội dung thú vị 🤩🥳.
                                                    </div>

                                                </c:if>

                                                <%-- Follower Model --%>
                                                <c:forEach items="${userAuth.follows}" var="follower">
                                                    <div
                                                            class="py-3 d-flex justify-content-between fl-c px-2 rounded-3"
                                                    >
                                                        <a
                                                                href=""
                                                                class="d-flex align-items-center gap-3 text-decoration-none text-light"
                                                        >
                                                            <img
                                                                    src="${follower.userFollow.avartar==null?'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A':follower.userFollow.avartar}"
                                                                    alt="bg-img"
                                                                    style="
                                                                        width: 34px;
                                                                        height: 34px;
                                                                    "
                                                                    class="avt rounded-circle"
                                                            />
                                                            <div
                                                                    class="text-start"
                                                            >
                                                                <div
                                                                        class="fs-6 fw-semibold"
                                                                >
                                                                        ${follower.userFollow.fullname}
                                                                </div>
                                                                <div
                                                                        class="fs-8 text-opacity-50 text-light"
                                                                >
                                                                        ${follower.userFollow.email}
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="">
                                                            <button
                                                                    class="btn bg-secondary h-100 bg-opacity-25 border-0 rounded-3 fs-7 fw-medium"
                                                            >
                                                                Huỷ theo dõi
                                                            </button>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                            class="col-12 d-flex justify-content-center gap-3 mt-2"
                    >
                        <!-- Button trigger modal -->
                        <button
                                type="button"
                                class="btn bg-secondary py-2 px-3 bg-opacity-10 rounded-4 fs-7 fw-medium"
                                data-bs-toggle="modal"
                                data-bs-target="#profileModal"
                                tabindex="-1"
                        >
                            Chỉnh sửa hồ sơ
                        </button>
                        <div
                                class="modal fade"
                                id="profileModal"
                                tabindex="-1"
                                aria-labelledby="titleEditProfile"
                                aria-hidden="true"

                        >
                            <div
                                    class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
                            >
                                <!-- Form edit profile -->
                                <form
                                        action="${pageContext.request.contextPath}/moovee/profile"
                                        enctype="multipart/form-data"
                                        method="post"
                                        class="modal-content bg-dark-subtle rounded-4 px-3 py-2"
                                >
                                    <div
                                            class="modal-header border-bottom-0"
                                    >
                                        <h1
                                                class="modal-title fs-5"
                                                id="titleEditProfile"
                                        >
                                            Sửa hồ sơ
                                        </h1>
                                        <button
                                                type="button"
                                                class="btn-close rounded-circle fs-7"
                                                data-bs-dismiss="modal"
                                                aria-label="Close"
                                        ></button>
                                    </div>
                                    <div class="modal-body p-0">
                                        <div
                                                class="container-fluid m-0 row gap-2"
                                        >
                                            <div
                                                    class="container-fluid bg-secondary-subtle rounded-4 p-3 p-0"
                                            >
                                                <div class="text-start">
                                                    <div
                                                            class="fs-6 fw-semibold"
                                                    >
                                                        Ảnh đại diện
                                                    </div>
                                                    <div
                                                            class="position-relative justify-content-center d-flex"
                                                            id="containerAvtImage"
                                                    >
                                                        <img
                                                                src="${userAuth.avartar==null?'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A':userAuth.avartar}"
                                                                style="
                                                                        width: 150px !important;
                                                                        height: 150px !important;
                                                                    "
                                                                class="bg-img rounded-circle"
                                                                alt="bg"
                                                                id="avtImage"
                                                        />
                                                        <input
                                                                type="file"
                                                                name="avartar"
                                                                id="avt"
                                                                style="width: 150px;"
                                                                class="position-absolute top-0 h-100 opacity-0 pointer rounded-circle"
                                                        />
                                                        <input type="hidden" value="false" name="isChangeAvt" id="isChangeAvt">

                                                    </div>
                                                    <div class="d-flex justify-content-center">
                                                        <button id="removeAvtImage" type="button" class="btn bg-transparent p-0 mt-1 text-danger border-0 fs-7">Xoá ảnh</button>
                                                    </div>
                                                </div>
                                                <div class="text-start">
                                                    <div
                                                            class="fs-6 fw-semibold mb-1"
                                                    >
                                                        Ảnh bìa
                                                    </div>
                                                    <div
                                                            class="position-relative"
                                                            id="containerCoverImage"
                                                    >

                                                        <div
                                                                id="containerNoCoverImage"
                                                                class="p-0 bg-img bg-no-cvi d-flex justify-content-center align-items-center text-white text-opacity-25 position-relative rounded-3 shadow-lg"
                                                        >
                                                            <span>Chưa thiết lập ảnh bìa</span>
                                                        </div>


                                                        <img
                                                                src="${user.coverImage}"
                                                                class="bg-img rounded-3 w-100"
                                                                alt="bg"
                                                                id="coverImage"
                                                        />

                                                        <input
                                                                type="file"
                                                                name="coverImage"
                                                                id="bg"
                                                                style="
                                                                        cursor: pointer;
                                                                    "
                                                                class="position-absolute z-3 start-0 top-0 w-100 h-100 opacity-0"
                                                        />
                                                        <input type="hidden" value="false" name="isChangeCoverImage" id="isChangeCoverImage">
                                                    </div>
                                                    <div class="d-flex justify-content-center">
                                                        <button id="removeCoverImage" type="button" class="btn bg-transparent p-0 mt-1 text-danger border-0 fs-7">Xoá ảnh</button>
                                                    </div>
                                                </div>
                                                <div class="fs-7 text-white-50 text-start">
                                                    <span class="text-danger">*</span>
                                                    Nhấp vào ảnh để chọn ảnh mới
                                                </div>
                                            </div>
                                            <div
                                                    class="container-fluid bg-secondary-subtle rounded-4 p-3 p-0 mt-1"
                                            >
                                                <div class="text-start">
                                                    <div
                                                            class="fs-6 fw-semibold mb-3"
                                                    >
                                                        Thông tin cá
                                                        nhân
                                                    </div>
                                                    <div
                                                            class="row gap-2"
                                                    >
                                                        <div
                                                                class="row"
                                                        >
                                                            <label
                                                                    for="fullname"
                                                                    class="col-md-4 col-lg-2 text-white-50 col-form-label fs-7"
                                                            >Họ và
                                                                tên</label
                                                            >
                                                            <div
                                                                    class="col-lg-10 col-12"
                                                            >
                                                                <input
                                                                        type="text"
                                                                        class="form-control rounded-3 border-0 fs-7 fw-light py-2 shadow-none"
                                                                        id="fullname"
                                                                        name="fullname"
                                                                        value="${userAuth.fullname}"
                                                                        placeholder="Họ và tên"
                                                                />
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="row"
                                                        >
                                                            <label
                                                                    for="email"
                                                                    class="col-md-4 col-lg-2 text-white-50 col-form-label fs-7"
                                                            >Email</label
                                                            >
                                                            <div
                                                                    class="col-lg-10 col-12"
                                                            >
                                                                <input
                                                                        type="email"
                                                                        class="form-control border-0 rounded-3 fs-6 fw-light py-2 shadow-none"
                                                                        id="email"
                                                                        name="email"
                                                                        value="${userAuth.email}"
                                                                        placeholder="Example@gmail.com"
                                                                />
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="row"
                                                        >
                                                            <label
                                                                    for="number"
                                                                    class="col-md-4 col-lg-2 text-white-50 col-form-label fs-7"
                                                            >Số điện
                                                                thoại</label
                                                            >
                                                            <div
                                                                    class="col-lg-10 col-12"
                                                            >
                                                                <input
                                                                        type="number"
                                                                        class="form-control border-0 rounded-3 fs-6 fw-light py-2 shadow-none"
                                                                        id="number"
                                                                        name="number"
                                                                        value="${fn:contains(userAuth.number, 'TEMP')?'':userAuth.number}"
                                                                        placeholder="0123456789"
                                                                />
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="row align-items-center"
                                                        >
                                                            <label
                                                                    class="col-md-4 col-lg-2 text-white-50 col-form-label fs-7"
                                                            >Giới
                                                                tính</label
                                                            >
                                                            <div
                                                                    class="col-lg-10 col-12 row gap-3 m-0"
                                                            >
                                                                <div
                                                                        class="form-check col-auto"
                                                                >
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            value="true"
                                                                            name="gender"
                                                                            id="male"
                                                                    ${userAuth.gender==null?'':userAuth.gender?'checked':''}
                                                                    />
                                                                    <label
                                                                            class="form-check-label fs-7"
                                                                            for="male"
                                                                    >
                                                                        Nam
                                                                    </label>
                                                                </div>
                                                                <div
                                                                        class="form-check col-auto"
                                                                >
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            id="female"
                                                                            name="gender"
                                                                            value="false"
                                                                    ${userAuth.gender==null?'':userAuth.gender?'':'checked'}

                                                                    />
                                                                    <label
                                                                            class="form-check-label fs-7"
                                                                            for="female"
                                                                    >
                                                                        Nữ
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="row align-items-center"
                                                        >
                                                            <label
                                                                    class="col-md-4 col-lg-2 text-white-50 col-form-label fs-7"
                                                            >Mật
                                                                khẩu</label
                                                            >
                                                            <div
                                                                    class="col-sm-10"
                                                            >
                                                                <a
                                                                        href="#"
                                                                        class="fw-medium fs-7 text-purple"
                                                                >Đổi mật khẩu</a
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                            class="modal-footer border-top-0"
                                    >
                                        <button
                                                type="submit"
                                                id="submitChangeProfile"
                                                class="btn fw-medium bg-purple-custom fs-7 rounded-3"
                                        >
                                            Lưu thay đổi
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <a
                                href="upload.jsp"
                                style="
                                        padding-top: 6px;
                                        padding-bottom: 6px;
                                        width: fit-content;
                                    "
                                class="btn bg-purple-custom py-2 px-3 rounded-4 fs-7 fw-medium"
                        >
                            Đăng video</a
                        >
                    </div>
                </div>
            </div>
            <div class="container p-0">
                <div
                        class="w-fit bg-secondary-subtle p-2 overflow-hidden rounded-5 d-flex gap-2"
                >
                    <ul
                            class="nav nav-pills d-flex w-100"
                            id="myTab"
                            role="tablist"
                    >
                        <li class="nav-item" role="presentation">
                            <button
                                    
                                    class="nav-link text-light fs-6 py-2 text-opacity-50 fw-medium active rounded-4"
                                    id="btn-my-video"
                                    data-bs-toggle="tab"
                                    data-bs-target="#home-tab-pane"
                                    type="button"
                                    role="tab"
                                    aria-controls="home-tab-pane"
                                    aria-selected="true"
                            >
                                Video của tôi
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button
                                    id="btn-recently"
                                    class="nav-link text-light fs-6 text-opacity-50 fw-medium rounded-4"
                                    data-bs-toggle="tab"
                                    type="button"
                                    role="tab"
                            >
                                Đã xem
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button
                                    class="nav-link text-light fs-6 text-opacity-50 fw-medium rounded-4"
                                    id="btn-liked"
                                    data-bs-toggle="tab"
                                    data-bs-target="#profile-tab-pane"
                                    type="button"
                                    role="tab"
                                    aria-controls="profile-tab-pane"
                                    aria-selected="false"
                            >
                                Đã thích
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                    class="nav-link text-light fs-6 text-opacity-50 fw-medium rounded-4"
                                    id="btn-shared"
                                    data-bs-toggle="tab"
                                    data-bs-target="#profile-tab-pane"
                                    type="button"
                                    role="tab"
                                    aria-controls="profile-tab-pane"
                                    aria-selected="false"
                            >
                                Đã chia sẻ
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div
                    class="container bg-secondary-subtle p-4 mt-3 rounded-5"
            >
                <div class="row gy-4" id="containerVideo">
                    <!-- Video model -->
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
</div>
</body>
<script>
    const avt = document.getElementById('avt');
    const bg = document.getElementById('bg');
    const avtImage = document.getElementById('avtImage');
    const coverImage = document.getElementById('coverImage');
    const containerNoCoverImage = document.getElementById('containerNoCoverImage');
    const containerCoverImage = document.getElementById('containerCoverImage');
    const containerAvtImage = document.getElementById('containerAvtImage');
    const removeAvtImage = document.getElementById('removeAvtImage');
    const removeCoverImage = document.getElementById('removeCoverImage');
    const submitChangeProfile = document.getElementById('submitChangeProfile');
    const isChangeAvt = document.getElementById('isChangeAvt');
    const isChangeCoverImage = document.getElementById('isChangeCoverImage');

    if (${userAuth.coverImage==null}) {
        coverImage.parentNode.removeChild(coverImage);
    } else {
        containerNoCoverImage.parentNode.removeChild(containerNoCoverImage);
    }

    removeAvtImage.addEventListener('click', function () {
        avt.value = '';
        isChangeAvt.value = true;
        avtImage.src = 'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A';
    });

    removeCoverImage.addEventListener('click', function () {
        bg.value = '';
        isChangeCoverImage.value = true;
        containerCoverImage.removeChild(coverImage);
        containerCoverImage.appendChild(containerNoCoverImage);
    });

    avt.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                avtImage.src = e.target.result;
                isChangeAvt.value = true;
            };
            reader.readAsDataURL(file);
        } else {
            avtImage.src = 'https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A';
        }
    });

    bg.addEventListener("change", function () {
        const file = bg.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                if (containerCoverImage.children.namedItem('containerNoCoverImage')) {
                    containerCoverImage.removeChild(containerNoCoverImage);
                    containerCoverImage.appendChild(coverImage);
                }
                coverImage.src = e.target.result;
                isChangeCoverImage.value = true;
            };
            reader.readAsDataURL(file);
        } else {
            containerCoverImage.removeChild(coverImage);
            containerCoverImage.appendChild(containerNoCoverImage);
        }
    });
</script>

<script>
    var page = 0;
    const pagesize = 6;
    var isLoading = false;
    var isEnd = false;

    const loading = document.getElementById('loading');
    const containerVideo = document.getElementById('containerVideo');
    const loadMore = document.getElementById('loadMore');
    const btnMyVideo = document.getElementById('btn-my-video');
    const btnRecently = document.getElementById('btn-recently');
    const btnLiked = document.getElementById('btn-liked');
    const btnShared = document.getElementById('btn-shared');

    async function loadVideo (typeVideo) {
        if (isLoading || isEnd) {
            return;
        }
        isLoading = true;
        loading.classList.remove('d-none');
        loadMore.classList.add('d-none');
        const response = await fetch("${pageContext.request.contextPath}/moovee/profile/"+typeVideo.toString()+"?page="+page+"&pageSize="+pagesize);
        if(!response.ok) {
            isLoading = false;
            loading.classList.add('d-none');
            console.alert('Đã xảy ra lỗi khi tải video');
            return;
        }
        const data = await response.json();
        console.log(data.length);
        if(data.length == 0) {
            loadMore.classList.add('d-none');
            loading.classList.add('d-none');
            containerVideo.innerHTML = "<div class='text-center fs-7 text-white-50 py-5'>Không có video nào</div>";
        } else {
            data.forEach((video) => {
                const videoElement = document.createElement('div');
                videoElement.classList.add('col-12', 'col-md-6', 'col-lg-4', 'h-100');
                videoElement.innerHTML = "<div class='position-relative d-flex flex-column justify-content-between'>" +
                    "<img src='" + video.urlImage + "' onclick='goToVideo(\"" + video.id + "\")' class='w-100 video cursor-pointer object-fit-cover rounded-3 pointer' />" +
                    "<div class='mt-2'>" +
                        "<div onclick='goToVideo(\"" + video.id + "\")' class='mb-1 truncate-text pe-2 fw-medium pointer link-vd'>" + video.title + "</div>" +
                        "<div class='d-flex align-items-center gap-1 text-white-50 fs-7'>" +
                            "<div class='d-flex fs-7 gap-1'>" +
                                "<span>" + video.recents.length + "</span> lượt xem" +
                            "</div>" +
                            " • " +
                            "<div class='d-flex fs-7 gap-1'>" +
                                "<span>" + video.likes.length + "</span> thích" +
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

    var urlMyVideo = "my-video";

    btnMyVideo.addEventListener('click', function () {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "my-video";
        loadVideo(urlMyVideo);
    });

    btnRecently.addEventListener('click', function () {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "recently";
        loadVideo(urlMyVideo);
    });

    btnLiked.addEventListener('click', function () {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "favorite";
        loadVideo(urlMyVideo);
    });

    btnShared.addEventListener('click', function () {
        containerVideo.innerHTML = '';
        page = 0;
        isEnd = false;
        urlMyVideo = "shared";
        loadVideo(urlMyVideo);
    });

    loadMore.addEventListener('click', function () {
        loadVideo(urlMyVideo);
    });

    loadVideo(urlMyVideo);
</script>
</html>
