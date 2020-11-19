document.addEventListener("DOMContentLoaded", () => {
  const filterInput = document.getElementById("search-table");

  filterInput.addEventListener("keyup", filterResults);

  function filterResults() {
    const value = filterInput.value.toLowerCase();
    const domain = stripEmailDomain(value);

    const rows = document.querySelectorAll(".result");

    for (var i = 0; i < rows.length; i++) {
      let text = rows[i]
        .querySelectorAll(".result-text")[0]
        .innerHTML.toLowerCase()
        .trim()
        .slice(1); // remove the leading '@'

      rows[i].style.display = domain.endsWith(text) ? "" : "none";
    }

    displayResultsMessage(rows);
  }

  function stripEmailDomain(value) {
    return value
      .split("@")
      .reverse()[0]
      .trim();
  }

  function displayResultsMessage(results) {
    const noResultsMessage = document.getElementById("no-results");
    noResultsMessage.style.display = "none";

    const noResults = Array.from(results).every(function(e) {
      return e.style.display == "none";
    });

    if (noResults) {
      noResultsMessage.style.display = "block";
    }
  }
});
