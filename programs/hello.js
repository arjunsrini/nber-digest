var page = require('webpage').create();
// console.log('The default user agent is ' + page.settings.userAgent);
// page.settings.userAgent = 'SpecialAgent';
// page.onConsoleMessage = function(msg) {
//   console.log('Digest cards: ' + msg);
// };
page.open('https://www.nber.org/taxonomy/term/556?page=1&perPage=50', function(status) {
  if (status !== 'success') {
    console.log('Unable to access network');
  } else {
  	//console.log(page.window.nberListingConfigs);
  	//console.log(page.content);
  }
  phantom.exit();
});