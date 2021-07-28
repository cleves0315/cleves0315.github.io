window.Affix = {
  initSideBar: function () {
    var sidebarInner = $('.sidebar-inner');
    var headerOffset = $('#header').innerHeight() - CONFIG.sidebar.offset;

    sidebarInner.affix({
      offset: {
        top: headerOffset
      }
    });

    $('#sidebar').css({ 'margin-left': 'initial' });
  }
}
