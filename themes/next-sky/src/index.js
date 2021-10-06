require('./affix');
require('./pjax');
require('./evanyou');
require('./since');
require('./scrollspy');
require('./post-details')();

window.PrePath = location.pathname;

$(document).ready(function () {
  var sidebarInner = $('.sidebar-inner');

  Affix.initSideBar();
  resizeListener();

  if (location.pathname === '/') {
    $('#content-wrap').addClass('home-content-wrap');
  } else {
    $('#content-wrap').removeClass('home-content-wrap');
  }

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
    Affix.initSideBar();
  }
});
