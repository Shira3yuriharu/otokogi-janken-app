function check() {
  // 表示されているすべての旅行名称を取得している
  const travels = document.querySelectorAll(".travel");

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
          // 前回の集計結果をリセット
          ele1_1.innerHTML='';
          ele1_2.innerHTML='';
          ele1_3.innerHTML='';
          ele2_1.innerHTML='';
          ele2_2.innerHTML='';
          ele2_3.innerHTML='';
          ele3_1.innerHTML='';
          ele3_2.innerHTML='';
          ele3_3.innerHTML='';
          ele4_1.innerHTML='';
          ele4_2.innerHTML='';
          ele4_3.innerHTML='';

        let name = null;
        let money = 0;
        let times = 0;
        const uniqueArray = [...new Set(nickname)];
        i2 = uniqueArray.length
        for (let step = 0; step < i2; step++) {
          let name = null;
          let money = 0;
          let times = 0;
          i3 = travel_select_pie.length
            for(let step2 = 0; step2<i3; step2++){
              if (uniqueArray[step] === travel_select_pie[step2]["nickname"]){
                name = travel_select_pie[step2]["nickname"]
                money = travel_select_pie[step2]["money"] + money
                times = times + 1
              }
            }
            // console.log (a)
            if (step === 0){
             ele1_1.appendChild(document.createTextNode((name)));
             ele1_2.appendChild(document.createTextNode((money)));
             ele1_3.appendChild(document.createTextNode((times)));
            }
            if (step === 1){
              ele2_1.appendChild(document.createTextNode((name)));
              ele2_2.appendChild(document.createTextNode((money)));
              ele2_3.appendChild(document.createTextNode((times)));
             }
             if (step === 2){
              ele3_1.appendChild(document.createTextNode((name)));
              ele3_2.appendChild(document.createTextNode((money)));
              ele3_3.appendChild(document.createTextNode((times)));
             }
             if (step === 3){
              ele4_1.appendChild(document.createTextNode((name)));
              ele4_2.appendChild(document.createTextNode((money)));
              ele4_3.appendChild(document.createTextNode((times)));
             }
        }



        // console.log (uniqueArray)
        // console.log (travel_select_pie[0]["nickname"])
        // console.log (travel_select_pie)
        // console.log (i3)
        
        // console.log (element[0])
        // console.log (ele2)

      }
     });
  });
}
setInterval(check, 1000);