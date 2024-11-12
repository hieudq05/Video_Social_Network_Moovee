const frameVd = document.getElementById("frameVd");
const iframe = document.getElementById("vdIframe");
const urlVideo = document.getElementById("urlVideo");
const checkVd = document.getElementById("checkVd");
const resetVd = document.getElementById("resetVd");
const step2 = document.getElementById("step2");
const listStep2 = document.getElementById("list-item-2");
const step3 = document.getElementById("step3");
const listStep3 = document.getElementById("list-item-3");
const bgVd = document.getElementById("bgVd");
const title = document.getElementById("title");
const description = document.getElementById("description");
const wordsTitle = document.getElementById("wordsTitle");
const wordsDescription = document.getElementById("wordsDescription");
const linkStep1 = document.getElementById("linkStep1");
const linkStep2 = document.getElementById("linkStep2");
const linkStep3 = document.getElementById("linkStep3");
const content = document.getElementById("content");

function extractYouTubeVideoId(url) {
    const regex = /(?:youtube\.com\/embed\/|youtu\.be\/)([^?&\/\s]+)/;
    const match = url.match(regex);
    return match ? match[1] : null;
}

checkVd.addEventListener("click", () => {
    const idVideo = extractYouTubeVideoId(urlVideo.value);
    fetch(
        `https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=${idVideo}&format=json`
    ).then((response) => {
        if (!response.ok) {
            iframe.classList.add("d-none");
            frameVd.classList.remove("d-none");
            step2.classList.add("d-none");
        } else {
            iframe.src = `https://www.youtube.com/embed/${idVideo}`;
            iframe.classList.remove("d-none");
            frameVd.classList.add("d-none");
            resetVd.classList.remove("d-none");
            if (listStep2.classList.contains("d-none")) {
                step2.classList.remove("d-none");
            }
            bgVd.src = `https://img.youtube.com/vi/${idVideo}/maxresdefault.jpg`;
        }
    });
});

resetVd.addEventListener("click", () => {
    iframe.classList.add("d-none");
    frameVd.classList.remove("d-none");
    resetVd.classList.add("d-none");
    urlVideo.value = "";
    step2.classList.add("d-none");
    listStep2.classList.add("d-none");
    listStep3.classList.add("d-none");
    linkStep2.classList.add("disabled");
    linkStep3.classList.add("disabled");
    linkStep1.childNodes[1].classList.add("opacity-0");
    linkStep2.childNodes[1].classList.add("opacity-0");
    linkStep3.childNodes[1].classList.add("opacity-0");
});

step2.addEventListener("click", () => {
    location.href = "#list-item-2";
    listStep2.classList.remove("d-none");
    step2.classList.add("d-none");
    linkStep2.classList.remove("disabled");
    linkStep1.childNodes[1].classList.remove("opacity-0");
});

/* window.addEventListener("beforeunload", function (event) {
    const message =
        "Bạn chưa lưu dữ liệu. Bạn có chắc chắn muốn rời trang này?";
    event.returnValue = message;
    return message;
});
 */

title.addEventListener("input", () => {
    wordsTitle.textContent = title.value.length;
    if (title.value.length > 0 && description.value.length > 0) {
        step3.classList.remove("d-none");
    } else {
        step3.classList.add("d-none");
    }
});

description.addEventListener("input", () => {
    wordsDescription.textContent = description.value.length;
    if (title.value.length > 0 && description.value.length > 0) {
        step3.classList.remove("d-none");
    } else {
        step3.classList.add("d-none");
    }
});

step3.addEventListener("click", () => {
    location.href = "#list-item-3";
    listStep3.classList.remove("d-none");
    step3.classList.add("d-none");
    linkStep3.classList.remove("disabled");
    linkStep2.childNodes[1].classList.remove("opacity-0");
    content.classList.add("no-events");
});
