function check() {
  const travels = document.querySelectorAll(".travel");
  travels.forEach(function(travel) {
    travel.addEventListener("click", () => {
      const travelId = travel.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/results/${travelId}`, true);
      XHR.responseType = "json";
      XHR.send();
     });
  });
}
window.addEventListener("load", check);