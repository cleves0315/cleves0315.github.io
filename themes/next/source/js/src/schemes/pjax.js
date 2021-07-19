require('jquery-pjax');
console.log('===pjax===')
$(document).pjax('a:not(.fancybox):not([target="_blank"])', '#main', {
  scrollTo: $('.main').position().top - 60,
  fragment: '#main',
  timeout: 5000,
});
