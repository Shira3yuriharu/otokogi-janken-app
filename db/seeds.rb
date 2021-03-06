categories = %w[沖縄 大阪 北海道 京都 奄美大島 淡路島].map{|name| Category.create(name: name) }

Spot.create(name:'星のや竹富島ダイニング' ,url:'https://tabelog.com/okinawa/A4705/A470502/47015876/' ,genre:'飲食店' ,category: categories[0])
Spot.create(name:'アイリッシュパブ ハウディ' ,url:'https://tabelog.com/okinawa/A4703/A470304/47026240/' ,genre:'飲食店' ,category: categories[0])
Spot.create(name:'沖縄創作居酒屋 天の川食堂 てぃんがーら' ,url:'https://tabelog.com/okinawa/A4702/A470202/47015024/' ,genre:'飲食店' ,category: categories[0])
Spot.create(name:'青の洞窟ボート体験ダイビング＆絶叫ウォータートイ' ,url:'https://okinawa-hiside.com/course/course-3724/' ,genre:'アクティビティ' ,category: categories[0])
Spot.create(name:'ATV四駆バギー' ,url:'https://sotoasobi.net/activity/atv/10/47/84/346?utm_campaign=outfitter&utm_source=10/47/blog/okinawa-recommend-activity' ,genre:'アクティビティ' ,category: categories[0])
Spot.create(name:'パラセーリング' ,url:'https://sotoasobi.net/activity/parasailing/10/47/111/466?utm_campaign=outfitter&utm_source=10/47/blog/okinawa-recommend-activity' ,genre:'アクティビティ' ,category: categories[0])
Spot.create(name:'オクマ プライベートビーチ ＆ リゾート' ,url:'https://www.ikyu.com/00000603/' ,genre:'宿泊施設' ,category: categories[0])
Spot.create(name:'石垣シーサイドホテル' ,url:'https://www.ikyu.com/caz/00030755/' ,genre:'宿泊施設' ,category: categories[0])
Spot.create(name:'名蔵ヴィレッジ' ,url:'https://www.ikyu.com/caz/00030755/' ,genre:'宿泊施設' ,category: categories[0])
Spot.create(name:'ぎん庵 心斎橋' ,url:'https://tabelog.com/osaka/A2701/A270201/27101223/' ,genre:'飲食店' ,category: categories[1])
Spot.create(name:'翁' ,url:'https://tabelog.com/osaka/A2701/A270201/27018866/' ,genre:'飲食店' ,category: categories[1])
Spot.create(name:'お好み 鉄板 居酒屋 DON' ,url:'https://tabelog.com/osaka/A2701/A270202/27058467/?lid=chikakunoomise' ,genre:'飲食店' ,category: categories[1])
Spot.create(name:'パナソニックミュージアム' ,url:'https://www.panasonic.com/jp/corporate/history/panasonic-museum.html' ,genre:'アクティビティ' ,category: categories[1])
Spot.create(name:'VS PARK' ,url:'https://bandainamco-am.co.jp/others/vspark/' ,genre:'アクティビティ' ,category: categories[1])
Spot.create(name:'ユニバーサルスタジオジャパン' ,url:'https://www.usj.co.jp/web/ja/jp' ,genre:'アクティビティ' ,category: categories[1])
Spot.create(name:'THE SINGULARI HOTEL ＆ SKYSPA at Universal Studios Japan' ,url:'https://www.jalan.net/yad332153/' ,genre:'宿泊施設' ,category: categories[1])
Spot.create(name:'大江戸温泉物語 箕面観光ホテル' ,url:'https://travel.biglobe.ne.jp/hotel/h013027/plan/?pn=10000&px=20000' ,genre:'宿泊施設' ,category: categories[1])
Spot.create(name:'スパワールド 世界の大温泉' ,url:'https://travel.biglobe.ne.jp/hotel/h012745/plan/?pn=10000&px=20000' ,genre:'宿泊施設' ,category: categories[1])
Spot.create(name:'海だより' ,url:'https://tabelog.com/hokkaido/A0101/A010201/1027865/' ,genre:'飲食店' ,category: categories[2])
Spot.create(name:'サッポロビール園 ジンギスカンホール' ,url:'https://tabelog.com/hokkaido/A0101/A010202/1000159/' ,genre:'飲食店' ,category: categories[2])
Spot.create(name:'カリーヤ！コング' ,url:'https://tabelog.com/hokkaido/A0101/A010104/1029696/' ,genre:'飲食店' ,category: categories[2])
Spot.create(name:'ガイド1日チャーター ネイチャーウォッチング' ,url:'https://gurutabi.gnavi.co.jp/p/p_7849/' ,genre:'アクティビティ' ,category: categories[2])
Spot.create(name:'サバイバルゲーム＆ジンギスカン BBQ食べ飲み放題' ,url:'https://gurutabi.gnavi.co.jp/p/p_10014/' ,genre:'アクティビティ' ,category: categories[2])
Spot.create(name:'プライベートサイクリングツアー（SAN)SAPPORO ACTIVE NAVIGATION' ,url:'https://www.jalan.net/kankou/spt_guide000000180996/activity/l00002B191/?showplan=spot_detail_calendar&screenId=OUW2201&influxKbn=0' ,genre:'アクティビティ' ,category: categories[2])
Spot.create(name:'ポラリス' ,url:'https://www.jalan.net/yad300923/' ,genre:'宿泊施設' ,category: categories[2])
Spot.create(name:'十勝まきばの家' ,url:'https://www.jalan.net/yad370681/' ,genre:'宿泊施設' ,category: categories[2])
Spot.create(name:'ぬくもりの宿 ふる川' ,url:'https://www.jalan.net/yad321633/' ,genre:'宿泊施設' ,category: categories[2])
Spot.create(name:'ぎおん徳屋' ,url:'https://tabelog.com/kyoto/A2601/A260301/26002075/' ,genre:'飲食店' ,category: categories[3])
Spot.create(name:'豆水楼' ,url:'https://tabelog.com/kyoto/A2601/A260202/26001548/' ,genre:'飲食店' ,category: categories[3])
Spot.create(name:'月の蔵人' ,url:'https://tabelog.com/kyoto/A2601/A260601/26002346/' ,genre:'飲食店' ,category: categories[3])
Spot.create(name:'舞妓さん お昼のお座敷体験' ,url:'https://www.veltra.com/jp/japan/kyoto/a/155894' ,genre:'アクティビティ' ,category: categories[3])
Spot.create(name:'和菓子手作り体験' ,url:'https://www.veltra.com/jp/japan/kyoto/a/115369' ,genre:'アクティビティ' ,category: categories[3])
Spot.create(name:'京都の世界遺産3ヶ所バスツアー' ,url:'https://www.veltra.com/jp/japan/kyoto/a/16714' ,genre:'アクティビティ' ,category: categories[3])
Spot.create(name:'ホテルインターゲート京都' ,url:'https://www.ikyu.com/biz/00081435/?ppc=4' ,genre:'宿泊施設' ,category: categories[3])
Spot.create(name:'晴鴨櫻' ,url:'https://www.ikyu.com/00001120/?ppc=4' ,genre:'宿泊施設' ,category: categories[3])
Spot.create(name:'ホテルウィングインターナショナル京都四条烏丸' ,url:'https://www.ikyu.com/biz/00081551/?ppc=4' ,genre:'宿泊施設' ,category: categories[3])
Spot.create(name:'AMAネシア' ,url:'https://tabelog.com/kagoshima/A4605/A460502/46001368/' ,genre:'飲食店' ,category: categories[4])
Spot.create(name:'居酒屋脇田丸' ,url:'https://tabelog.com/kagoshima/A4605/A460502/46007680/' ,genre:'飲食店' ,category: categories[4])
Spot.create(name:'鯨石庵' ,url:'https://tabelog.com/kagoshima/A4605/A460502/46001340/' ,genre:'飲食店' ,category: categories[4])
Spot.create(name:'セグウェイマングローブ散策ツアー' ,url:'https://activityjapan.com/publish/plan/25789' ,genre:'アクティビティ' ,category: categories[4])
Spot.create(name:'フルオープン4WDナイトサファリツアー' ,url:'https://activityjapan.com/publish/plan/29599' ,genre:'アクティビティ' ,category: categories[4])
Spot.create(name:'秘境ビーチでBBQ' ,url:'https://activityjapan.com/publish/plan/28006' ,genre:'アクティビティ' ,category: categories[4])
Spot.create(name:'ホテルカレッタ' ,url:'https://www.jtb.co.jp/kokunai_hotel/htl/8632017/plan/?hotellistsort=recommend&staynight=1&room=1&roomassign=m4&mapdisp=0&planinfokeywordon=1&tyfilteron=1&tycode=obeya&rawareaname=460606&area=460606&temproomassign=1' ,genre:'宿泊施設' ,category: categories[4])
Spot.create(name:'いも～れ奄美民泊村' ,url:'https://amami-minpaku-mura.com/#section0' ,genre:'宿泊施設' ,category: categories[4])
Spot.create(name:'奄美リゾート ばしゃ山村' ,url:'https://www.tripadvisor.jp/Hotel_Review-g1022937-d1060631-Reviews-Amami_Resort_Bashayamamura-Amami_Kagoshima_Prefecture_Kyushu.html' ,genre:'宿泊施設' ,category: categories[4])
Spot.create(name:'うずしおレストラン' ,url:'https://tabelog.com/hyogo/A2806/A280603/28002378/' ,genre:'飲食店' ,category: categories[5])
Spot.create(name:'シーアイガ海月' ,url:'https://tabelog.com/hyogo/A2806/A280602/28043195/' ,genre:'飲食店' ,category: categories[5])
Spot.create(name:'鯨石庵' ,url:'https://tabelog.com/hyogo/A2806/A280601/28049921/' ,genre:'飲食店' ,category: categories[5])
Spot.create(name:'ニンゲンノモリ' ,url:'https://nijigennomori.com/' ,genre:'アクティビティ' ,category: categories[5])
Spot.create(name:'淡路ワールドパーク' ,url:'https://www.onokoro.jp/' ,genre:'アクティビティ' ,category: categories[5])
Spot.create(name:'ジェットボート' ,url:'https://activityjapan.com/publish/plan/9546' ,genre:'アクティビティ' ,category: categories[5])
Spot.create(name:'グランシャリオ北斗七星135℃' ,url:'https://awaji-grandchariot.com/' ,genre:'宿泊施設' ,category: categories[5])
Spot.create(name:'淡路島マンモス' ,url:'https://awajimammoth.com/' ,genre:'宿泊施設' ,category: categories[5])
Spot.create(name:'淡路島ホテル・ロッジ GREEN COZY' ,url:'https://green-cozy.com/' ,genre:'宿泊施設' ,category: categories[5])