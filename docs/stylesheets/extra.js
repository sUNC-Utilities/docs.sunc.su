document.addEventListener('mouseout', function(e) {
    const link = e.target.closest('.md-nav__link');
    if (link && !link.contains(e.relatedTarget)) {
      link.blur();
    }
});

const elements = document.querySelectorAll('.md-ellipsis');
elements.forEach(element => {
  	if (element.textContent.trim() === "Filtergc") {
		element.textContent = "filtergc"
  	}
})