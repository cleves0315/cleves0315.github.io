function showSinceTime() {
  setTimeout(() => {
    showSinceTime()
  }, 1000);

  const today = new Date();
  const birthDay = new Date(window.CONFIG.since)
  const sinceTime = today.getTime() - birthDay.getTime();

  const sinceD = Math.floor(sinceTime / 1000 / 60 / 60 / 24);
  const sinceTimeD = sinceD * 1000 * 60 * 60 * 24;
  const sinceH = Math.floor((sinceTime - sinceTimeD) / 1000 / 60 / 60);
  const sinceTimeH = sinceH * 1000 * 60 * 60;
  const sinceM = Math.floor((sinceTime - sinceTimeD - sinceTimeH) / 1000 / 60);
  const sinceTimeM = sinceM * 1000 * 60;
  const sinceS = Math.floor((sinceTime - sinceTimeD - sinceTimeH - sinceTimeM) / 1000);

  $('#since').text(`${sinceD}天${sinceH}小时${sinceM}分钟${sinceS}秒`)
}
showSinceTime();
