// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('turbo:load', function() {
  const toggleSidebar = document.getElementById('toggleSidebar');
  const closeSidebar = document.getElementById('closeSidebar');
  const sidebar = document.getElementById('sidebar');
  const sidebarLinks = document.querySelectorAll('.sidebar-link');

  toggleSidebar.addEventListener('click', function() {
    sidebar.classList.toggle('-translate-x-full');
    sidebar.classList.toggle('translate-x-0');
  });

  closeSidebar.addEventListener('click', function() {
    sidebar.classList.add('-translate-x-full');
    sidebar.classList.remove('translate-x-0');
  });

  sidebarLinks.forEach(function(link) {
    link.addEventListener('click', function() {
      sidebar.classList.add('-translate-x-full');
      sidebar.classList.remove('translate-x-0');
    });
  });
});
