class Tools {
  generateRandomDigits(len) {
    const scopeF = '123456789';
    const scopeC = '0123456789';
    var result = '';
    for (var i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[parseInt(Math.random() * scopeF.length, 10)];
      } else {
        result = result + scopeC[parseInt(Math.random() * scopeC.length, 10)];
      }
    }
    return result;
  }

  isiOS() {
    let u = navigator.userAgent;
    let iOs = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端\
    return iOs;
  }

  isAndroid() {
    let u = navigator.userAgent;
    let android = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
    return android
  }
}