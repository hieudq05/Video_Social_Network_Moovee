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
                                class="rounded-circle object-fit-cover"
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
                        <c:if test="${userAuth.role}">
                            <li>
                                <a
                                        class="dropdown-item d-flex gap-2 fs-7 align-items-center py-2 pe-5 rounded-3"
                                        href="${pageContext.request.contextPath}/choose-page"
                                >
                                    <span class="material-symbols-outlined">
                                        category
                                    </span>
                                    <span>Thoát</span>
                                </a>
                            </li>
                        </c:if>
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
<main>
    <div
            id="content"
            class="container row mx-auto my-4 pt-5 row-gap-4 setup-frame px-0 z-0"
    >
        <div class="col-lg-3 px-0 col-12 h-fit bg-dark z-1">
            <div class="top-6 px-lg-4">
                <div
                        id="container-link-step-1-2"
                        class="list-group bg-secondary bg-opacity-10 py-2 d-flex flex-lg-column flex-row rounded-4 overflow-hidden"
                >
                    <a
                            class="list-group-item bg-transparent d-flex gap-2 list-group-item-action rounded-0 border-0 py-2"
                            href="#step-1"
                    >
                        <i
                                id="icon-check-1"
                                class="bi bi-check-circle-fill text-success opacity-0"
                        ></i>
                        <div class="">
                            <div class="fs-6 fw-medium">
                                Tải lên video
                            </div>
                            <div class="fs-7 text-white-50 fw-light">
                                Chọn video để thêm vào bài viết của bạn.
                            </div>
                        </div>
                    </a>
                    <a
                            id="link-step-2"
                            class="list-group-item bg-transparent d-flex gap-2 list-group-item-action rounded-0 border-0 py-2"
                            href="#list-item-2"
                    >
                        <i
                                id="icon-check-2"
                                class="bi bi-check-circle-fill opacity-0 text-success"
                        ></i>
                        <div class="">
                            <div class="fs-6 fw-medium">
                                Nhập nội dung
                            </div>
                            <div class="fs-7 text-white-50 fw-light">
                                Thêm tiêu đề và mô tả cho video của bạn.
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <form
                action="${pageContext.request.contextPath}/moovee/upload"
                method="post"
                class="col bg-dark rounded-4 px-0"
                id="container-all-step"
        >
            <div
                    data-bs-spy="scroll"
                    data-bs-target="#list-example"
                    data-bs-smooth-scroll="true"
                    class="scrollspy-example"
                    tabindex="0"
                    id="container-step-1-2"
            >
                <div class="h-100 position-relative" id="step-1">
                    <div
                            id="frame-upload"
                            style="border: 1px dashed"
                            class="rounded-4 px-5 d-flex bg-secondary bg-opacity-10 border-secondary video flex-column justify-content-center align-items-center text-center"
                    >
                                <span
                                        class="material-symbols-outlined mb-2"
                                        style="font-size: 5rem"
                                >
                                    arrow_upload_progress
                                </span>
                        <div class="fw-medium">
                            Nhập đường link video từ Youtube vào ô phía
                            dưới
                        </div>
                        <div
                                class="text-white-50 fw-light fs-7 d-sm-flex d-none"
                        >
                            Sau khi nhập đường dẫn tới video và nhấp vào
                            nút kiểm tra, video của bạn sẽ hiển thị ở
                            đây, vui lòng kiểm tra video trước khi thực
                            hiện bước tiếp theo.
                        </div>
                        <a
                                href="https://www.youtube.com"
                                target="_blank"
                                class="btn d-md-flex d-none mt-4 fs-7 fw-medium border-0 rounded-3 px-3 py-0 text-white d-flex gap-2 align-items-center"
                        >
                                    <span
                                            class="yt-icon-shape style-scope yt-icon yt-spec-icon-shape"
                                    ><div
                                            style="
                                                width: 100%;
                                                height: 100%;
                                                display: block;
                                                fill: currentcolor;
                                            "
                                    >
                                            <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    id="yt-ringo2-svg_yt17"
                                                    width="93"
                                                    height="20"
                                                    viewBox="0 0 93 20"
                                                    focusable="false"
                                                    aria-hidden="true"
                                                    style="
                                                    pointer-events: none;
                                                    display: inherit;
                                                    width: 100%;
                                                    height: 100%;
                                                "
                                            >
                                                <g>
                                                    <path
                                                            d="M14.4848 20C14.4848 20 23.5695 20 25.8229 19.4C27.0917 19.06 28.0459 18.08 28.3808 16.87C29 14.65 29 9.98 29 9.98C29 9.98 29 5.34 28.3808 3.14C28.0459 1.9 27.0917 0.94 25.8229 0.61C23.5695 0 14.4848 0 14.4848 0C14.4848 0 5.42037 0 3.17711 0.61C1.9286 0.94 0.954148 1.9 0.59888 3.14C0 5.34 0 9.98 0 9.98C0 9.98 0 14.65 0.59888 16.87C0.954148 18.08 1.9286 19.06 3.17711 19.4C5.42037 20 14.4848 20 14.4848 20Z"
                                                            fill="#FF0033"
                                                    ></path>
                                                    <path
                                                            d="M19 10L11.5 5.75V14.25L19 10Z"
                                                            fill="white"
                                                    ></path>
                                                </g>
                                                <g id="youtube-paths_yt17">
                                                    <path
                                                            d="M37.1384 18.8999V13.4399L40.6084 2.09994H38.0184L36.6984 7.24994C36.3984 8.42994 36.1284 9.65994 35.9284 10.7999H35.7684C35.6584 9.79994 35.3384 8.48994 35.0184 7.22994L33.7384 2.09994H31.1484L34.5684 13.4399V18.8999H37.1384Z"
                                                    ></path>
                                                    <path
                                                            d="M44.1003 6.29994C41.0703 6.29994 40.0303 8.04994 40.0303 11.8199V13.6099C40.0303 16.9899 40.6803 19.1099 44.0403 19.1099C47.3503 19.1099 48.0603 17.0899 48.0603 13.6099V11.8199C48.0603 8.44994 47.3803 6.29994 44.1003 6.29994ZM45.3903 14.7199C45.3903 16.3599 45.1003 17.3899 44.0503 17.3899C43.0203 17.3899 42.7303 16.3499 42.7303 14.7199V10.6799C42.7303 9.27994 42.9303 8.02994 44.0503 8.02994C45.2303 8.02994 45.3903 9.34994 45.3903 10.6799V14.7199Z"
                                                    ></path>
                                                    <path
                                                            d="M52.2713 19.0899C53.7313 19.0899 54.6413 18.4799 55.3913 17.3799H55.5013L55.6113 18.8999H57.6012V6.53994H54.9613V16.4699C54.6812 16.9599 54.0312 17.3199 53.4212 17.3199C52.6512 17.3199 52.4113 16.7099 52.4113 15.6899V6.53994H49.7812V15.8099C49.7812 17.8199 50.3613 19.0899 52.2713 19.0899Z"
                                                    ></path>
                                                    <path
                                                            d="M62.8261 18.8999V4.14994H65.8661V2.09994H57.1761V4.14994H60.2161V18.8999H62.8261Z"
                                                    ></path>
                                                    <path
                                                            d="M67.8728 19.0899C69.3328 19.0899 70.2428 18.4799 70.9928 17.3799H71.1028L71.2128 18.8999H73.2028V6.53994H70.5628V16.4699C70.2828 16.9599 69.6328 17.3199 69.0228 17.3199C68.2528 17.3199 68.0128 16.7099 68.0128 15.6899V6.53994H65.3828V15.8099C65.3828 17.8199 65.9628 19.0899 67.8728 19.0899Z"
                                                    ></path>
                                                    <path
                                                            d="M80.6744 6.26994C79.3944 6.26994 78.4744 6.82994 77.8644 7.73994H77.7344C77.8144 6.53994 77.8744 5.51994 77.8744 4.70994V1.43994H75.3244L75.3144 12.1799L75.3244 18.8999H77.5444L77.7344 17.6999H77.8044C78.3944 18.5099 79.3044 19.0199 80.5144 19.0199C82.5244 19.0199 83.3844 17.2899 83.3844 13.6099V11.6999C83.3844 8.25994 82.9944 6.26994 80.6744 6.26994ZM80.7644 13.6099C80.7644 15.9099 80.4244 17.2799 79.3544 17.2799C78.8544 17.2799 78.1644 17.0399 77.8544 16.5899V9.23994C78.1244 8.53994 78.7244 8.02994 79.3944 8.02994C80.4744 8.02994 80.7644 9.33994 80.7644 11.7299V13.6099Z"
                                                    ></path>
                                                    <path
                                                            d="M92.6517 11.4999C92.6517 8.51994 92.3517 6.30994 88.9217 6.30994C85.6917 6.30994 84.9717 8.45994 84.9717 11.6199V13.7899C84.9717 16.8699 85.6317 19.1099 88.8417 19.1099C91.3817 19.1099 92.6917 17.8399 92.5417 15.3799L90.2917 15.2599C90.2617 16.7799 89.9117 17.3999 88.9017 17.3999C87.6317 17.3999 87.5717 16.1899 87.5717 14.3899V13.5499H92.6517V11.4999ZM88.8617 7.96994C90.0817 7.96994 90.1717 9.11994 90.1717 11.0699V12.0799H87.5717V11.0699C87.5717 9.13994 87.6517 7.96994 88.8617 7.96994Z"
                                                    ></path>
                                                </g>
                                            </svg></div
                                    ></span>
                        </a>
                    </div>
                    <iframe
                            class="rounded-4 video-detail z-0"
                            id="video-iframe"
                            width="560"
                            height="315"
                            title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            referrerpolicy="strict-origin-when-cross-origin"
                            allowfullscreen
                    ></iframe>
                    <div
                            class="text-danger mt-3 fs-7"
                            id="message-error"
                    >
                        <i class="bi bi-exclamation-circle me-1"></i>
                        Đường dẫn không hợp lệ, vui lòng thử lại!
                    </div>
                    <div
                            class="row m-0 mt-2 gap-2"
                            id="container-control"
                    >
                        <input
                                type="text"
                                id="input-url-video"
                                placeholder="VD: https://www.youtube.com/..., https://youtu.be/..."
                                class="form-control rounded-3 fs-7 py-2 col"
                        />

                        <input type="hidden" id="urlVideo" name="urlVideo">
                        <input type="hidden" id="urlImage" name="urlImage">

                        <button
                                type="button"
                                id="btn-check-video"
                                class="btn bg-white text-dark fs-7 fw-medium rounded-3 col-auto px-4"
                        >
                            Kiểm tra
                        </button>
                        <button
                                type="button"
                                id="btn-reset-video"
                                class="btn border-0 col-auto p-1 pb-0 rounded-3 fs-8 shadow-sm"
                        >
                                    <span class="material-symbols-outlined">
                                        close
                                    </span>
                        </button>
                    </div>

                    <div class="fs-8 mt-2 text-white-50 fw-light">
                        <span class="text-danger">*</span> Truy cập
                        video trong Youtube, chọn "Chia sẻ" và sau đó
                        sao chép đường dẫn hiện lên trong popup.
                        <br/>
                        <span class="text-danger">*</span> Hoặc bạn có
                        thể nhấp vào nhúng và sao chép đường dẫn sau
                        "src=" để dán vào ô trên.
                        <br/>
                        <span class="text-danger">*</span> Lưu ý: Chỉ hỗ
                        trợ video từ Youtube và có thể một số video
                        không thể hiển thị.
                    </div>
                </div>
                <div class="h-100 mt-3 py-3" id="step-2">
                    <div class="row m-0 gap-3">
                        <div
                                class="col-md col-12 fs-7 fw-medium p-0 mb-md-0 mb-"
                        >
                            <div class="mb-1">Ảnh bìa</div>
                            <div class="position-relative">
                                <img
                                        id="img-video"
                                        class="video rounded-3 video-detail"
                                        alt="bg"
                                />
                            </div>
                        </div>
                        <div class="col fs-7 fw-medium p-0">
                            <div class="mb-1">Tiêu đề</div>
                            <input
                                    id="title"
                                    name="title"
                                    type="text"
                                    maxlength="155"
                                    placeholder="Tiêu đề của video"
                                    class="form-control rounded-3 fs-7 py-2 border-dark-subtle"
                            />
                            <div class="fs-9 text-end fw-light">
                                <span id="count-word-title"></span>/155
                            </div>
                            <div class="mb-1 mt-2">Mô tả</div>
                            <textarea
                                    id="description"
                                    name="decription"
                                    cols="30"
                                    rows="5"
                                    maxlength="255"
                                    placeholder="Mô tả cho video của bạn tại đây"
                                    class="form-control rounded-3 fs-7 py-2 border-dark-subtle"
                            ></textarea>
                            <div class="fs-9 text-end fw-light">
                                        <span id="count-word-description"></span
                                        >/255
                            </div>
                        </div>
                    </div>
                    <button
                            type="submit"
                            id="btn-upload-video"
                            class="btn mt-3 d-flex bg-purple-custom col-auto py-1 px-2 gap-1 fw-medium rounded-3 fs-7 shadow-sm align-items-center"
                    >
                                <span class="material-symbols-outlined">
                                    check
                                </span>
                        Đăng video
                    </button>
                </div>
                <div
                        class="h-100 py-5 d-flex flex-column px-4 justify-content-center align-items-center bg-secondary bg-opacity-10 rounded-4"
                        id="step-3"
                >
                            <span
                                    class="material-symbols-outlined pt-5"
                                    style="font-size: 5rem"
                            >
                                rocket_launch
                            </span>
                    <div class="mt-3 px-5">
                        <i
                                class="bi bi-check-circle-fill text-success me-1"
                        ></i>
                        Đăng video thành công
                    </div>
                    <div
                            class="text-white-50 fw-light fs-7 pb-5 d-sm-flex text-center"
                    >
                        Video của bạn đã được đăng thành công, vui lòng
                        chờ trong giây lát...
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
    const iconCheck1 = document.getElementById("icon-check-1");
    const iconCheck2 = document.getElementById("icon-check-2");
    const containerStep12 = document.getElementById("container-step-1-2");
    const linkStep2 = document.getElementById("link-step-2");
    const frameUpload = document.getElementById("frame-upload");
    const videoIframe = document.getElementById("video-iframe");
    const messageError = document.getElementById("message-error");
    const inputUrlVideo = document.getElementById("input-url-video");
    const btnCheckVideo = document.getElementById("btn-check-video");
    const btnResetVideo = document.getElementById("btn-reset-video");
    const imgVideo = document.getElementById("img-video");
    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const countWordTitle = document.getElementById("count-word-title");
    const countWordDescription = document.getElementById(
        "count-word-description"
    );
    const btnUploadVideo = document.getElementById("btn-upload-video");
    const step1 = document.getElementById("step-1");
    const step2 = document.getElementById("step-2");
    const step3 = document.getElementById("step-3");
    const containerControl = document.getElementById("container-control");
    const containerAllStep = document.getElementById("container-all-step");
    const urlVideo = document.getElementById("urlVideo");
    const urlImage = document.getElementById("urlImage")


    containerStep12.removeChild(step2);
    containerStep12.removeChild(step3);
    step1.removeChild(videoIframe);
    step1.removeChild(messageError);
    containerControl.removeChild(btnResetVideo);
    linkStep2.style.pointerEvents = "none";
    countWordTitle.textContent = title.value.length;
    countWordDescription.textContent = description.value.length;
    step2.removeChild(btnUploadVideo);

    const extractYouTubeVideoId = (url) => {
        const regex =
            /(?:youtu\.be\/|youtube\.com\/(?:embed\/|watch\?v=|v\/|shorts\/|.*[?&]v=))([\w-]{11})/;
        const match = url.match(regex);
        return match ? match[1] : null;
    };

    btnCheckVideo.addEventListener("click", () => {
        const idVideo = extractYouTubeVideoId(inputUrlVideo.value);

        fetch(
            "https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=" + idVideo + "&format=json"
        ).then((response) => {
            if (response.status === 400) {
                step1.insertBefore(messageError, containerControl);
                inputUrlVideo.classList.add("border-danger");
                iconCheck1.classList.add("opacity-0");
                linkStep2.style.pointerEvents = "none";
                if (containerStep12.contains(step2)) {
                    containerStep12.removeChild(step2);
                }
                containerControl.removeChild(btnResetVideo);
                videoIframe.src = "";
                imgVideo.src = "";
                step1.removeChild(videoIframe);
                step1.insertBefore(frameUpload, step1.childNodes[3]);
                urlVideo.value = null;
                urlImage.value = null;
            } else if (response.ok) {
                videoIframe.src = "https://www.youtube.com/embed/" + idVideo;
                imgVideo.src = "https://img.youtube.com/vi/" + idVideo + "/maxresdefault.jpg";
                inputUrlVideo.classList.remove("border-danger");
                containerStep12.appendChild(step2);
                linkStep2.style.pointerEvents = "auto";
                step1.removeChild(frameUpload);
                step1.insertBefore(videoIframe, step1.childNodes[3]);
                containerControl.appendChild(btnResetVideo);
                iconCheck1.classList.remove("opacity-0");
                if (step1.contains(messageError)) {
                    step1.removeChild(messageError);
                }
                urlVideo.value = "https://www.youtube.com/embed/" + idVideo;
                urlImage.value = "https://img.youtube.com/vi/" + idVideo + "/maxresdefault.jpg";
            }
        });
    });

    btnResetVideo.addEventListener("click", () => {
        inputUrlVideo.value = "";
        videoIframe.src = "";
        imgVideo.src = "";
        step1.removeChild(videoIframe);
        step1.insertBefore(frameUpload, step1.childNodes[3]);
        if (containerStep12.contains(step2)) {
            containerStep12.removeChild(step2);
        }
        step1.insertBefore(frameUpload, step1.childNodes[3]);
        containerControl.removeChild(btnResetVideo);
        iconCheck1.classList.add("opacity-0");
        linkStep2.style.pointerEvents = "none";
    });

    title.addEventListener("input", () => {
        countWordTitle.textContent = title.value.length;
        checkContentEmpty();
    });

    description.addEventListener("input", () => {
        countWordDescription.textContent = description.value.length;
        checkContentEmpty();
    });

    const checkContentEmpty = () => {
        if (title.value.length > 0 && description.value.length > 0) {
            step2.appendChild(btnUploadVideo);
        } else {
            step2.removeChild(btnUploadVideo);
        }
    };

    btnUploadVideo.addEventListener("submit", () => {
        containerAllStep.removeChild(containerStep12);
        containerAllStep.appendChild(step3);
        iconCheck2.classList.remove("opacity-0");
        linkStep2.style.pointerEvents = "none";
    });
</script>
</html>
