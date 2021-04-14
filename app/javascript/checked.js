function check() {
  const travels = document.querySelectorAll(".travel");
  travels.forEach(function(travel) {
    travel.addEventListener("click", () => { });
  });
}
window.addEventListener("load", check);