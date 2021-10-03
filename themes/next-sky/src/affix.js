window.Affix = {
  initSideBar: function () {
    var sidebarInner = $('.sidebar-inner');
    
    sidebarInner.affix({
      offset: {
        top: 0
      }
    });

    $('#sidebar').css({ 'margin-left': 'initial' });
  }
}
