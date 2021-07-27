require('./pjax')

$(document).ready(function () {

  var sidebarInner = $('.sidebar-inner');
  var backlife = $('#backlife')[0];

  initAffix();
  resizeListener();

  function initAffix () {
    var headerOffset = getHeaderOffset();

    sidebarInner.affix({
      offset: {
        top: headerOffset
      }
    });

    $('#sidebar').css({ 'margin-left': 'initial' });
  }

  function resizeListener () {
    var mql = window.matchMedia('(min-width: 991px)');
    mql.addListener(function(e){
      if(e.matches){
        recalculateAffixPosition();
      }
    });
  }

  function getHeaderOffset () {
    return $('#header').innerHeight() - CONFIG.sidebar.offset;
  }

  function getFooterOffset () {
    var footerInner = $('.footer-inner'),
        footerMargin = footerInner.outerHeight(true) - footerInner.outerHeight(),
        footerOffset = footerInner.outerHeight(true) + footerMargin;
    return footerOffset;
  }

  function recalculateAffixPosition () {
    $(window).off('.affix');
    sidebarInner.removeData('bs.affix').removeClass('affix affix-top affix-bottom');
    initAffix();
  }

  function getBacklife () {
    return $('#backlife')[0]
  }
});
