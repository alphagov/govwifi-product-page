function submitCookiePreferences(e) {
  e.preventDefault();

  const data = new FormData(this);

  for (let category of data.keys()) {
    GovWifi.cookies.setCategoryAllowed(category, data.get(category) === "on");
  }

  document.getElementById("cookie-preferences-amended").style.display = "block";

  window.scrollTo(0, 0);
}

function setCategoryInput(category) {
  const isAllowed = GovWifi.cookies.isCategoryAllowed(category);
  const selector = isAllowed ? "on" : "off";

  const input = document.getElementById(`cookies-${category}-${selector}`);

  input.checked = true;
}

function setupCookiePreferencesPage() {
  const form = document.getElementById("cookie-settings");

  if (!form) return;

  setCategoryInput("tracking");

  form.addEventListener("submit", submitCookiePreferences);
}

document.addEventListener("DOMContentLoaded", function() {
  GOVUKFrontend.initAll();

  GovWifi.cookies.checkCookiePolicy("cookie-banner");

  setupCookiePreferencesPage();
});
