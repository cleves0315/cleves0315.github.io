$(document).pjax('a:not(.fancybox):not([target="_blank"])',"#main",{scrollTo:$(".main").position().top-60,fragment:"#main",timeout:5e3}),$(document).ready((function(){var a=$(".sidebar-inner");function i(){var i=$("#header").innerHeight()-CONFIG.sidebar.offset;a.affix({offset:{top:i}}),$("#sidebar").css({"margin-left":"initial"})}$("#backlife")[0],i(),window.matchMedia("(min-width: 991px)").addListener((function(t){t.matches&&($(window).off(".affix"),a.removeData("bs.affix").removeClass("affix affix-top affix-bottom"),i())}))}));
//# sourceMappingURL=pisces.js.map