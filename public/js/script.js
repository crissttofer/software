function toggleDropdown() {
    document.getElementById("dropdown").classList.toggle("show");
}

// Cierra el menú si el usuario hace clic fuera de él
window.onclick = function(event) {
    if (!event.target.matches('.user-section, .user-section *')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}