document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.querySelector('.search__input');
    const searchDropdown = document.getElementById('search-dropdown');
    
    // Show search dropdown on input focus
    searchInput.addEventListener('focus', function() {
        searchDropdown.style.display = 'block';
    });

    // Close search dropdown when clicking outside
    window.addEventListener('click', function(event) {
        if (!searchInput.contains(event.target) && !searchDropdown.contains(event.target)) {
            searchDropdown.style.display = 'none';
        }
    });

    // Prevent closing dropdown when interacting with it
    searchDropdown.addEventListener('click', function(event) {
        event.stopPropagation();
    });

    // Submit the form when Enter is pressed
    const searchBar = document.getElementById('search-bar');
    searchInput.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            searchBar.submit();
        }
    });
});
