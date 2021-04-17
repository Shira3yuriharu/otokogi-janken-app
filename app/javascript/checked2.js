function check2() {
  // 表示されているすべての旅行名称を取得している
  const groups = document.querySelectorAll(".group");

  groups.forEach(function(group) {
    group.addEventListener("click", () => {
      // どの旅行名称をクリックしたのか、カスタムデータを利用して取得している
      const groupId = group.getAttribute("data-id");
      // Ajaxに必要なオブジェクトを生成している
      const XHR = new XMLHttpRequest();
      // openでリクエストを初期化する
      XHR.open("GET", `/results/group/${groupId}`, true);
      // レスポンスのタイプを指定する
      XHR.responseType = "json";
      // sendでリクエストを送信する
      XHR.send();
     });
  });
}
window.addEventListener("load", check2);