window.onload = function() {
  checkCookie();
};

function setCookie(cookieName, cookieValue) {
  document.cookie = cookieName + "=" + cookieValue;
}

function getCookie(cookieName) {
  var name = cookieName + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var cookiesArray = decodedCookie.split(';');
  for (var i = 0; i < cookiesArray.length; i++) {
    var cookie = cookiesArray[i];
    while (cookie.charAt(0) == ' ') {
      cookie = cookie.substring(1);
    }
    if (cookie.indexOf(name) == 0) {
      return cookie.substring(name.length, cookie.length);
    }
  }
  return "";
}

function checkCookie() {
  var user = getCookie("govwifi-cookie-policy");
  if (user != "") {
    document.getElementById("cookie-banner").style.display = "none";
  } else {
    setCookie("govwifi-cookie-policy", '1');
  }
}
