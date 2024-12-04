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
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/views/style.css"
        />
        <title>Document</title>
    </head>
    <style>
        .form-control:focus {
            box-shadow: none !important;
        }
        .cursor-text {
            cursor: text !important;
        }
    </style>
    <body>
        <c:set value="${video}" var="video"></c:set>
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
        <div class="container pt-3 setup-frame pb-5">
            <a
                href="${pageContext.request.contextPath}/admin/manage-video"
                class="icon-link text-decoration-none fs-7 icon-link-hover pointer text-light border-height-1 px-2 py-1 border-secondary border-opacity-50 bg-secondary bg-opacity-10 rounded-3"
                style="--bs-icon-link-transform: translate3d(-0.25rem, 0, 0)"
            >
                <i
                    class="bi bi-chevron-left position-relative"
                    style="bottom: 3px"
                >
                    <use xlink:href="#arrow-left"></use>
                </i>
                Danh sách video
            </a>
            <div class="col-12 mt-4">
                <div class="fs-3 d-flex align-items-center gap-2">
                    Chi tiết video
                    <i id="icon-lock" class="bi fs-4 pointer bi-lock"></i>
                </div>
                <div class="fs-8 text-white-50">
                    Nhấp vào biểu tượng ổ khoá để mở khoá để chỉnh sửa và khoá
                    lại khi hoàn thành.
                </div>
            </div>
            <div class="row m-0 p-0 mt-3">
                <div class="col-lg-4 col-12">
                    <iframe
                        class="video-detail rounded-3"
                        id="iframe-video"
                        width="560"
                        height="315"
                        src="${video.urlVideo}"
                        title="YouTube video player"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin"
                        allowfullscreen
                    ></iframe>
                </div>
                <div class="col-lg-8 col-12 p-0">
                    <!-- Textarea title -->
                    <textarea
                        class="form-control cursor-none border-transparent fs-5 fw-semibold"
                        id="title"
                        rows="1"
                        readonly
                        style="overflow: hidden; resize: none"
                        placeholder="Nhập văn bản..."
                    >
${video.title}</textarea
                    >

                    <!-- Textarea description -->
                    <textarea
                        id="description"
                        class="form-control mt-2 cursor-none border-transparent fs-6 fw-light"
                        readonly
                        rows="1"
                        style="overflow: hidden; resize: none"
                        placeholder="Nhập văn bản..."
                    >
${video.decription}</textarea
                    >

                    <div class="mt-2 text-white-50 fw-light px-2">
                        <span class="fs-7">Thời gian đăng video: </span
                        ><span class="text-white fs-6"
                            >${video.postedDate}</span
                        >
                    </div>
                    <div class="mt-2 row m-0 p-0 gap-2 px-2">
                        <button
                            id="btn-status"
                            class="col-auto btn btn-sm rounded-3 bg-secondary bg-opacity-10 border-0 d-flex align-items-center gap-2"
                        >
                            <div class="dot" id="dot"></div>
                            <div id="message-active" class="fs-8"></div>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row mt-4 m-0 p-0">
                <a
                    href="${pageContext.request.contextPath}/admin/report/videos/video?videoId=${video.id}"
                    class="icon-link w-fit mb-2 text-decoration-none fs-7 icon-link-hover pointer text-light"
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
                        <div class="fs-2">
                            <fmt:formatNumber
                                value="${fn:length(video.recents)}"
                                groupingUsed="true"
                            />
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt thích</div>
                        <div class="fs-2">
                            <fmt:formatNumber
                                value="${fn:length(video.likes)}"
                                groupingUsed="true"
                            />
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt bình luận</div>
                        <div class="fs-2">
                            <fmt:formatNumber
                                value="${fn:length(video.comments)}"
                                groupingUsed="true"
                            />
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="fs-8 text-white-50">Lượt chia sẻ</div>
                        <div class="fs-2">
                            <fmt:formatNumber
                                value="${fn:length(video.shares)}"
                                groupingUsed="true"
                            />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4 m-0 p-0">
                <a
                    href="/reportOfVideo.html"
                    class="icon-link w-fit mb-2 text-decoration-none fs-7 icon-link-hover pointer text-light"
                    style="--bs-icon-link-transform: translate3d(0.25rem, 0, 0)"
                >
                    Người đăng
                    <i
                        class="bi bi-chevron-right position-relative"
                        style="bottom: 3px"
                    >
                        <use xlink:href="#arrow-left"></use>
                    </i>
                </a>
                <div class="d-flex align-items-center gap-2">
                    <img
                        src="${video.poster.avartar}"
                        alt=""
                        class="avt-ad-vd"
                    />
                    <div class="">
                        <div class="fw-semibold fs-6">
                            ${video.poster.fullname}
                        </div>
                        <div class="fs-8 fw-light">
                            <span>${fn:length(video.poster.follows)}</span>
                            người theo dõi
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4 m-0 p-0">
                <div class="mb-2">Nguồn video</div>
                <div
                    class="row gap-2 p-0 m-0 col-12"
                    id="video-link"
                    style="height: 35.59px !important"
                >
                    <div class="input-group row p-0 m-0 col">
                        <i
                            class="bi input-group-text bi-link-45deg fs-5 col-auto"
                        ></i>
                        <input
                            id="input-url-video"
                            value="${video.urlVideo}"
                            class="col btn rounded-3 rounded-start-0 border-secondary border-opacity-25 text-start py-1 bg-secondary bg-opacity-10 fs-6 gap-2"
                        />
                    </div>
                    <button
                        id="btn-check"
                        class="form-control w-fit bg-white fs-6 text-black rounded-3 h-fit"
                    >
                        Kiểm tra
                    </button>
                    <button
                        id="btn-reset-video"
                        type="button"
                        class="form-control w-fit"
                    >
                        <i class="bi bi-arrow-clockwise"></i>
                    </button>
                </div>
                <div id="message" class="fs-8 mt-1 text-danger">
                    <i class="bi bi-exclamation-circle me-1"></i>
                    <span class="">Link không hợp lệ</span>
                </div>
                <div class="p-0 mt-3">
                    <button
                        id="btn-delete"
                        class="btn-outline-danger fs-7 btn py-1 rounded-3"
                        data-bs-toggle="modal"
                        data-bs-target="#dM${video.id}"
                    >
                        <i class="bi bi-trash3 me-2"></i>Xoá video
                    </button>
                    <div
                        class="modal fade"
                        id="dM${video.id}"
                        data-bs-backdrop="static"
                        data-bs-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabel"
                        aria-hidden="true"
                    >
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content rounded-4">
                                <div
                                    class="modal-header p-3 border-bottom border-secondary border-opacity-25"
                                >
                                    <div
                                        class="mb-1 fw-bold"
                                        style="font-size: 1rem"
                                    >
                                        Xoá video
                                    </div>
                                </div>
                                <div
                                    class="modal-body border-bottom border-secondary border-opacity-25 fs-7"
                                >
                                    <div class="">
                                        Vui lòng nhấp vào
                                        <span class="text-danger"
                                            >xác nhận</span
                                        >
                                        khi chắc chắn muốn xoá video "<span
                                            class="fw-semibold"
                                            >${video.title}</span
                                        >".
                                    </div>
                                    <div>Thao tác này không thể hoàn tác.</div>
                                </div>
                                <div class="modal-footer py-2 border-0 px-2">
                                    <button
                                        type="button"
                                        class="btn border-secondary bg-body-secondary fs-8 rounded-3"
                                        data-bs-dismiss="modal"
                                    >
                                        Huỷ bỏ
                                    </button>
                                    <button
                                        type="button"
                                        data-bs-dismiss="modal"
                                        class="btn btn-danger fs-8 rounded-3 py-1 dV"
                                    >
                                        Xác nhận
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
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
                    <i class="bi bi-check-circle-fill text-success me-1"></i>
                    <strong class="me-auto">Moovee</strong>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="toast"
                        aria-label="Close"
                    ></button>
                </div>
                <div class="toast-body">Đã cập nhật video vào hệ thống</div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/views/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <script>
        const title = document.getElementById("title");
        const description = document.getElementById("description");
        const iconLock = document.getElementById("icon-lock");
        const dot = document.getElementById("dot");
        const messageActive = document.getElementById("message-active");
        const btnStatus = document.getElementById("btn-status");
        const btnCheck = document.getElementById("btn-check");
        const inputUrlVideo = document.getElementById("input-url-video");
        const autoResize = (textarea) => {
            textarea.style.height = "auto";
            textarea.style.height = textarea.scrollHeight+"px";
        };
        const videoLink = document.getElementById("video-link");
        const message = document.getElementById("message");
        const iframeVideo = document.getElementById("iframe-video");
        const btnResetVideo = document.getElementById("btn-reset-video");
        const currentUrl = iframeVideo.src;
        const btnDelete = document.getElementById("btn-delete");
        const liveToastUpdate = new bootstrap.Toast(
            document.getElementById("liveToastUpdate")
        );

        messageActive.textContent = "${(video.active?"Đang hoạt động":"Bị ẩn")}";
        dot.classList.add("${video.active?"bg-success":"bg-danger"}")
        btnStatus.style.pointerEvents = "none";
        inputUrlVideo.setAttribute("type", "button");
        videoLink.removeChild(btnCheck);
        videoLink.parentElement.removeChild(message);
        videoLink.removeChild(btnResetVideo);

        title.addEventListener("input", () => {
            autoResize(title);
        });

        description.addEventListener("input", () => {
            autoResize(description);
        });

        autoResize(title);
        autoResize(description);

        const extractYouTubeVideoId = (url) => {
            const regex =
                /(?:youtu\.be\/|youtube\.com\/(?:embed\/|watch\?v=|v\/|shorts\/|.*[?&]v=))([\w-]{11})/;
            const match = url.match(regex);
            return match ? match[1] : null;
        };

        const checkUrlVideoYoutube = () => {
            const idVideo = extractYouTubeVideoId(inputUrlVideo.value);

            fetch(
                "https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v="+idVideo+"&format=json"
            ).then((response) => {
                if (response.status === 400) {
                    let inputUrl = videoLink.children[0].children[1];
                    inputUrl.classList.add("border-danger");
                    inputUrl.classList.remove("border-opacity-25");
                    videoLink.parentElement.insertBefore(message, btnDelete.parentElement)
                } else if (response.ok) {
                    iframeVideo.src = `https://www.youtube.com/embed/${idVideo}`;
                    let inputUrl = videoLink.children[0].children[1];
                    inputUrl.classList.remove("border-danger");
                    inputUrl.classList.add("border-opacity-25");
                    videoLink.parentElement.removeChild(message);
                }
            });
        };

        const updateVideo = () => {
            const data = {
                id: "${video.id}",
                title: title.value,
                description: description.value,
                urlVideo: inputUrlVideo.value,
                active: messageActive.textContent === "Đang hoạt động",
            };

            fetch("${pageContext.request.contextPath}/admin/manage-video", {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            }).then((response) => {
                if (response.ok) {
                    liveToastUpdate.show();
                }
            });
        };

        const observer = new MutationObserver(() => {
            const buttons = document.querySelectorAll("button[class*='dV']");
            console.log(buttons);
            buttons.forEach((button) => {
                if (!button.hasAttribute("data-event-added")) {
                    button.addEventListener("click", async function () {
                        console.log("button clicked");
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
                            location.href = "${pageContext.request.contextPath}/admin/manage-video";
                        }
                    });
                    button.setAttribute("data-event-added", "true"); // Đánh dấu nút đã được gắn sự kiện
                }
            });
        });

        // Lắng nghe thay đổi trong body hoặc container của modal
        observer.observe(document.body, { childList: true, subtree: true });

        btnResetVideo.addEventListener("click", () => {
            iframeVideo.src = currentUrl;
            videoLink.children[0].children[1].value = currentUrl;
            videoLink.removeChild(btnResetVideo);
            checkUrlVideoYoutube();
        });

        btnCheck.addEventListener("click", () => {
            checkUrlVideoYoutube();
        });

        btnStatus.addEventListener("click", () => {
            if (messageActive.textContent === "Đang hoạt động") {
                messageActive.textContent = "Đã ẩn";
                dot.classList.remove("bg-success");
                dot.classList.add("bg-danger");
            } else {
                messageActive.textContent = "Đang hoạt động";
                dot.classList.remove("bg-danger");
                dot.classList.add("bg-success");
            }
        });

        iconLock.addEventListener("click", () => {
            if (iconLock.classList.contains("bi-lock")) {
                iconLock.classList.remove("bi-lock");
                iconLock.classList.add("bi-unlock");
                title.removeAttribute("readonly");
                title.classList.add("cursor-text");
                title.classList.remove("border-transparent");
                description.removeAttribute("readonly");
                description.classList.add("cursor-text");
                description.classList.remove("border-transparent");
                title.classList.add("cursor-text");
                description.classList.add("cursor-text");
                btnStatus.style.pointerEvents = "";
                inputUrlVideo.setAttribute("type", "text");
                inputUrlVideo.classList.add("cursor-text");
                videoLink.appendChild(btnCheck);
            } else if (
                iconLock.classList.contains("bi-unlock") &&
                !videoLink.parentElement.contains(message)
            ) {
                updateVideo();
                iconLock.classList.remove("bi-unlock");
                iconLock.classList.add("bi-lock");
                title.setAttribute("readonly", "");
                title.classList.remove("cursor-text");
                title.classList.add("border-transparent");
                description.setAttribute("readonly", "");
                description.classList.add("border-transparent");
                title.classList.remove("cursor-text");
                description.classList.remove("cursor-text");
                btnStatus.style.pointerEvents = "none";
                inputUrlVideo.setAttribute("type", "button");
                inputUrlVideo.classList.remove("cursor-text");
                videoLink.removeChild(btnCheck);
                if(videoLink.contains(btnResetVideo)){
                    videoLink.removeChild(btnResetVideo);
                }
            }
        });

        inputUrlVideo.addEventListener("input", () => {
            if (inputUrlVideo.value !== currentUrl) {
                videoLink.appendChild(btnResetVideo);
            } else {
                videoLink.removeChild(btnResetVideo);
            }
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
</html>
