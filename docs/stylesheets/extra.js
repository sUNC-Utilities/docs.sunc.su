function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

document.addEventListener("mouseout", function (e) {
    const link = e.target.closest(".md-nav__link");
    const elements = document.querySelectorAll(".md-ellipsis");
    elements.forEach(element => {
        const tContent = element.textContent.trim();

        if (tContent === "Filtergc") {
            element.textContent = "filtergc";
        }
        // else if (tContent === "Api") {
        //     element.textContent = "Metadata API";
        // }
    })
    if (link && !link.contains(e.relatedTarget)) {
        link.blur();
    }
});
