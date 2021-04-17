function check2() {
  // 表示されているすべての旅行名称を取得している
  const groups = document.querySelectorAll(".group");

  // ユーザー１の定義
  const element1_1 = document.getElementsByClassName( "nickname1" )[0] ;
  const ele1_1 = element1_1.appendChild(document.createElement('p'))
  const element1_2 = document.getElementsByClassName( "money1" )[0] ;
  const ele1_2 = element1_2.appendChild(document.createElement('p'))
  const element1_3 = document.getElementsByClassName( "times1" )[0] ;
  const ele1_3 = element1_3.appendChild(document.createElement('p'))
  // ユーザー2の定義
  const element2_1 = document.getElementsByClassName( "nickname2" )[0] ;
  const ele2_1 = element2_1.appendChild(document.createElement('p'))
  const element2_2 = document.getElementsByClassName( "money2" )[0] ;
  const ele2_2 = element2_2.appendChild(document.createElement('p'))
  const element2_3 = document.getElementsByClassName( "times2" )[0] ;
  const ele2_3 = element2_3.appendChild(document.createElement('p'))
  // ユーザー3の定義
  const element3_1 = document.getElementsByClassName( "nickname3" )[0] ;
  const ele3_1 = element3_1.appendChild(document.createElement('p'))
  const element3_2 = document.getElementsByClassName( "money3" )[0] ;
  const ele3_2 = element3_2.appendChild(document.createElement('p'))
  const element3_3 = document.getElementsByClassName( "times3" )[0] ;
  const ele3_3 = element3_3.appendChild(document.createElement('p'))
  // ユーザー4の定義
  const element4_1 = document.getElementsByClassName( "nickname4" )[0] ;
  const ele4_1 = element4_1.appendChild(document.createElement('p'))
  const element4_2 = document.getElementsByClassName( "money4" )[0] ;
  const ele4_2 = element4_2.appendChild(document.createElement('p'))
  const element4_3 = document.getElementsByClassName( "times4" )[0] ;
  const ele4_3 = element4_3.appendChild(document.createElement('p'))

  groups.forEach(function(group) {
    if (group.getAttribute("data-load") != null) {
      return null;
    }
    group.setAttribute("data-load", "true");
    // 旅行名称をクリックした場合に実行する処理を定義している
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
      // レスポンスを受け取った時の処理を記述する
      XHR.onload = () => {
        // レスポンスの HTTP ステータスを解析し、該当するエラーメッセージをアラートで表示するようにしている
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          // 処理を終了している
          return null;
        }
        // レスポンスされたデータを変数resultsに代入している
        const results = XHR.response.post;
        




        console.log (results) 
      }  
     });
  });
}
setInterval(check2, 1000);