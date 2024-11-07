document.addEventListener('turbo:load', setupSidebar);
document.addEventListener('turbo:render', setupSidebar);
document.addEventListener('turbo:frame-load', setupSidebar);

function setupSidebar() {
  const toggleSidebar = document.getElementById('toggle-sidebar');
  const closeSidebar = document.getElementById('close-sidebar');
  const sidebar = document.getElementById('sidebar');
  const sidebarLinks = document.querySelectorAll('.sidebar-link');

  if (toggleSidebar && closeSidebar && sidebar) {
    // 既存のイベントリスナーを削除する
    toggleSidebar.replaceWith(toggleSidebar.cloneNode(true));
    closeSidebar.replaceWith(closeSidebar.cloneNode(true));
    sidebarLinks.forEach((link) => {
      link.replaceWith(link.cloneNode(true));
    });

    // 更新した要素を再取得
    const newToggleSidebar = document.getElementById('toggle-sidebar');
    const newCloseSidebar = document.getElementById('close-sidebar');
    const newSidebarLinks = document.querySelectorAll('.sidebar-link');

    // 新しい要素にイベントリスナーを追加
    newToggleSidebar.addEventListener('click', function() {
      sidebar.classList.toggle('-translate-x-full');
      sidebar.classList.toggle('translate-x-0');
    });

    newCloseSidebar.addEventListener('click', function() {
      sidebar.classList.add('-translate-x-full');
      sidebar.classList.remove('translate-x-0');
    });

    newSidebarLinks.forEach(function(link) {
      link.addEventListener('click', function() {
        sidebar.classList.add('-translate-x-full');
        sidebar.classList.remove('translate-x-0');
      });
    });
  }
}