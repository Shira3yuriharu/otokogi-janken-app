function check() {
  // 表示されているすべての旅行名称を取得している
  const travels = document.querySelectorAll(".travel");
  travels.forEach(function(travel) {
    if (travel.getAttribute("data-load") != null) {
      return null;
    }
    travel.setAttribute("data-load", "true");
    // 旅行名称をクリックした場合に実行する処理を定義している
    travel.addEventListener("click", () => {
      // どの旅行名称をクリックしたのか、カスタムデータを利用して取得している
      const travelId = travel.getAttribute("data-id");
      // Ajaxに必要なオブジェクトを生成している
      const XHR = new XMLHttpRequest();
      // openでリクエストを初期化する
      XHR.open("GET", `/results/${travelId}`, true);
      // レスポンスのタイプを指定する
      XHR.responseType = "json";
      // sendでリクエストを送信する
      XHR.send();
      // レスポンスを受け取った時の処理を記述する
      XHR.onload = () => {
        // レスポンスの HTTP ステータスを解析し、該当するエラーメッセージをアラートで表示するようにしている
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          // 処理を終了している
          return null;
        }
        // レスポンスされたデータを変数travel_select_pieに代入している
        const travel_select_pie = XHR.response.post;
        console.log (travel_select_pie)
      }
     });
  });
}
setInterval(check, 1000);