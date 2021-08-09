require('./affix');
require('./pjax');
require('./evanyou'); // 加载evanyou

window.PrePath = location.pathname;

$(document).ready(function () {
  var sidebarInner = $('.sidebar-inner');

  Affix.initSideBar();
  resizeListener();

  function resizeListener () {
    var mql = window.matchMedia('(min-width: 991px)');
    mql.addListener(function(e){
      if(e.matches){
        recalculateAffixPosition();
      }
    });
  }

  function recalculateAffixPosition () {
    $(window).off('.affix');
    sidebarInner.removeData('bs.affix').removeClass('affix affix-top affix-bottom');
    initAffix();
  }
});
