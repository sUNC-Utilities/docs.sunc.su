function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

document.addEventListener('mouseout', function (e) {
    const link = e.target.closest('.md-nav__link');
    const elements = document.querySelectorAll('.md-ellipsis');
    elements.forEach(element => {
        if (element.textContent.trim() === "Filtergc") {
            element.textContent = "filtergc"
        }
    })
    if (link && !link.contains(e.relatedTarget)) {
        link.blur();
    }
});
