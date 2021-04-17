function check() {
  // 表示されているすべての旅行名称を取得している
  const travels = document.querySelectorAll(".travel");

  const element1 = document.getElementsByClassName( "select-trip-chart-1" )[0] ;
  const ele1 = element1.appendChild(document.createElement('p'))
  const element2 = document.getElementsByClassName( "select-trip-chart-2" )[0] ;
  const ele2 = element2.appendChild(document.createElement('p'))
  const element3 = document.getElementsByClassName( "select-trip-chart-3" )[0] ;
  const ele3 = element3.appendChild(document.createElement('p'))
  const element4 = document.getElementsByClassName( "select-trip-chart-4" )[0] ;
  const ele4 = element4.appendChild(document.createElement('p'))

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
        // 全てを取り出すにはFor each文を記述する。mapなど
        // ele2.appendChild(document.createTextNode(travel_select_pie[0]["id"]));

        // travel_select_pie.foreach(function(item){
        //     console.log(item["id"]);
        //   });




        i = travel_select_pie.length
        var nickname=[];
        for (let step = 0; step < i; step++) {
          // ele2.appendChild(document.createTextNode(travel_select_pie[step]["nickname"]));
          // console.log (travel_select_pie[step]["nickname"])
          nickname[step]=(travel_select_pie[step]["nickname"])
        //   if (user1 == null) {
        //   user1 = (travel_select_pie[step]["nickname"])
        //  }
        }

        // 合計金額表示処理
        let a = 0;
        const uniqueArray = [...new Set(nickname)];
        i2 = uniqueArray.length
        for (let step = 0; step < i2; step++) {
          let a = 0;
          i3 = travel_select_pie.length
            for(let step2 = 0; step2<i3; step2++){
              if (uniqueArray[step] === travel_select_pie[step2]["nickname"]){
                a = travel_select_pie[step2]["money"] + a
              }
            }
            console.log (a)
            if (step === 0){
             ele1.appendChild(document.createTextNode((a)));
            }
            if (step === 1){
              ele2.appendChild(document.createTextNode((a)));
             }
             if (step === 2){
              ele3.appendChild(document.createTextNode((a)));
             }
             if (step === 3){
              ele4.appendChild(document.createTextNode((a)));
             }
        }
        console.log (uniqueArray)
        console.log (travel_select_pie[0]["nickname"])
        console.log (travel_select_pie)
        console.log (i3)
        
        console.log (element1)
        // console.log (element[0])
        console.log (ele2)

      }
     });
  });
}
setInterval(check, 1000);