# アプリ名
### 男気ジャンケン記録アプリ
<img src=https://user-images.githubusercontent.com/76254421/117452089-531bc100-af7e-11eb-90ec-075673d7311d.png width="320px">

# 本番環境
- デプロイ先<br>
35.74.57.196<br>
- テストアカウント<br>
・メールアドレス：test2@gmail.com<br>
・パスワード：test2test<br>

# はじめに（制作背景）
友人との旅行で”男気ジャンケン”をしたことはありますか？<br>
1番男気がある人をジャンケンで決めるゲームです。<br>
ジャンケンで勝った人（＝男気がある人）はジャンケンに負けた人（男気がない人）に食べ物やお土産を奢るという、気心の知れた友人同士だから出来るゲームでもあります。笑<br>
私はこのゲームを旅行時に友人達とよく行います。ジャンケンの結果を都度集計して、旅行の最後に男気ジャンケンで奢りあった金額を発表するという試みを5年ほど行っているのですが、都度集計するのが面倒くさいという思いがありました。<br>
そこで作成したのが当アプリです。集計の簡易化や旅行の思い出の共有など、”男気ジャンケンをより楽しくすること”が目的です。<br>
昨今のコロナ禍で男気ジャンケンを行うシチュエーションは減っていますが、コロナ収束後に多くの男気ジャンケンの場で使用頂けることを願っております！

# 概要
このアプリでは以下10機能を盛り込んでいます！<br>
1.ユーザー管理機能<br>
&emsp;ユーザーアカウント管理（新規作成、編集、ログイン、ログアウト）機能です。<br>
&emsp;サインイン時や後述の機能利用時にユーザーアカウント情報を使用します。<br>
2.グループ作成機能<br>
&emsp;男気ジャンケンが出来る仲の良い友人グループが複数存在する場合ってありますよね？<br>
&emsp;（高校時代の部活仲間や、大学時代のサークル仲間、職場仲間など）<br>
&emsp;当機能により、複数の友人グループをアプリへ登録できます。（1グループに登録出来る人数は4人まで）<br>
3.旅行計画作成機能<br>
&emsp;男気ジャンケンを行う旅行を計画し、アプリに登録する機能です。<br>
&emsp;旅行への参加者として前述で作成したグループを設定します。<br>
4.男気ジャンケン結果を記録する旅行の事前設定機能<br>
&emsp;男気ジャンケンを記録する旅行を事前に設定する機能です。<br>
&emsp;男気ジャンケン記録の都度、記録する旅行を選択するのが面倒だと考え作成しました。<br>
5.男気ジャンケン結果記録機能<br>
&emsp;男気ジャンケンの結果をアプリに記録する機能です。<br>
&emsp;奢ったもの、奢られたものの写真を添付することも出来ます。<br>
&emsp;因みにどの手で勝った（グー、チョキなど）かを登録する機能はありません。<br>
6.男気ジャンケンSpot検索機能<br>
&emsp;私の独断と偏見で選定した、今後の旅行で行きたい54Spotを紹介する機能です。<br>
&emsp;可能な限りクレジットカード利用可能な商業施設を選定していますので、現金がない場合も、男気ジャンケンが出来ます。笑<br>
&emsp;旅行先検討時に当情報を参考にしてみて下さい。<br>
7.男気ジャンケン結果表示機能<br>
&emsp;旅行及び、グループ単位の男気ジャンケン結果を表示する機能です。<br>
&emsp;例えば沖縄と北海道旅行に、大学のサークル仲間で行った場合、<br>
&emsp;旅行毎の男気ジャンケンの結果と、2つの旅行の男気ジャンケン結果合計が表示されます。<br>
&emsp;この機能により、男気ジャンケン結果集計の自動化が実現しました！<br>
8.男気ジャンケン結果詳細表示機能<br>
&emsp;旅行毎の男気ジャンケンの詳細表示を行う機能です。<br>
&emsp;”5.男気ジャンケン結果記録機能”で登録した内容が表形式で表示されます。<br>
9.男気ジャンケン結果編集・削除機能<br>
&emsp;”5.男気ジャンケン結果記録機能”で登録した内容の編集及び、削除が出来る機能です。<br>
&emsp;”8.男気ジャンケン結果詳細表示機能”で表示される詳細ページ内で利用できる機能になります。<br>
10.コメント投稿機能<br>
&emsp;旅行毎の感想などをコメントし、アプリに登録できる機能です。<br>
&emsp;”8.男気ジャンケン結果詳細表示機能”で表示される詳細ページ内で利用できる機能になります。<br>
<br>
#### ページイメージ及び、各機能が位置している箇所<br>
- トップページ（機能1〜8）<br>
<img src=https://user-images.githubusercontent.com/76254421/117535018-d0067380-b02e-11eb-8d6e-553fa15b22fb.jpg width="320px"><br>
- ユーザーアカウント作成ページ（機能1）<br>
<img src=https://user-images.githubusercontent.com/76254421/117535349-596a7580-b030-11eb-84c1-1767c27212c5.jpg width="320px"><br>
- 旅行結果詳細ページ（機能9）<br>
<img src=https://user-images.githubusercontent.com/76254421/117535946-5cb33080-b033-11eb-9e03-5f8772323c3d.jpg width="320px"><br>
- 旅行結果詳細ページ（機能10）<br>
<img src=https://user-images.githubusercontent.com/76254421/117535986-a865da00-b033-11eb-99f4-79afa1e6ac8f.jpg width="320px"><br>

# 工夫したポイント
- グループ名や旅行名はユーザーが紐付いているデータのみ表示されます。（機能3、4、7）<br>
![demo](https://gyazo.com/3c58886d78f75525e74c1feed4a2182b/raw)<br>
- ジャンケン結果は非同期処理で表示されます。（機能7）<br>
![demo](https://gyazo.com/92bea0194a7d7d5681ea8f59c279f112/raw)<br>
- 紹介する54Spotは全て関連WebサイトのURLを紐付けています。（機能6）<br>
![demo](https://gyazo.com/325aff80ec4494844340693148c9f10c/raw)<br>

# 使用技術(verは後ほど調査)<br>
* Ruby 2.6.5<br>
* Ruby on Rails 6.0.3.6<br>
* MySQL 5.6.50<br>
* JavaScript<br>
* HTML<br>
* CSS<br>
* AWS(S3)<br>
* AWS(EC2)<br>
* Caspisrano3<br>
* GitHubDesktop<br>
* VScode<br>

# 機能一覧<br>
* ユーザー登録、ログイン(devise)<br>
* ジャンケン結果登録機能(ActiveStrage)<br>
* ジャンケン結果表示機能(Ajax)<br>
* 検索機能(ransack)<br>

# テスト<br>
* RSpec<br>
  * 単体テスト(ユーザー登録、ログイン)<br>
<img src=https://user-images.githubusercontent.com/76254421/117555721-af750280-b09c-11eb-95ca-5b6fabc22a1e.jpg width="320px"><br>
  * 結合テスト(ユーザー登録〜男気ジャンケン結果登録〜男気ジャンケン結果表示〜男気ジャンケン結果削除)<br>
<img src=https://user-images.githubusercontent.com/76254421/117555753-dcc1b080-b09c-11eb-9e60-6cc9b458ca31.jpg width="320px"><br>

# テーブル設計
## usersテーブル
| Column            | Type      | Options                    |
| --------------    | ------    | ----------------------     |
| nickname          | string    | null: false ,  Unique:true |
| email             | string    | null: false ,  Unique:true |
| encrypted_password| string    | null: false                |
### Association
- has_many :groups
- has_many :comments
- has_many :group_users
- has_many :travel_selects

## groupsテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| name            | string   | null: false ,  Unique:true |
### Association
- has_many :users
- has_many :travels
- has_many :group_users

## group_usersテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| group           | reference| null: false                |
| user            | reference| null: false                |
### Association
- belongs_to :user
- belongs_to :group

## travels テーブル
| Column              | Type     | Options                    |
| --------------      | ------   | ------------------------   |
| name                | string   | null: false ,  Unique:true |
| start_day           | date     | null: false                |
| end_day             | date     | null: false                |
| group               | reference| null: false                |
### Association
- belongs_to :group
- has_many :travel_selects
- has_many :comments

## travel_selectsテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| travel          | reference| null: false                |
| user            | reference| null: false                |
### Association
- belongs_to :travel
- belongs_to :user
- has_many :results


## results テーブル
| Column           | Type     | Options    |
| -------          | ------   | ---------  |
| nickname         | string   | null: false|
| money            | integer  | null: false|
| item_category_id | integer  |            |
| note             | string   |            |
| travel_select    | reference| null: false|
### Association
- belongs_to :travel_select


## commentsテーブル
| Column          | Type     | Options      |
| --------------  | ------   | ----------   |
| text            | text     |              |
| user            | reference| null: false  |
| travel          | reference| null: false  |
### Association
- belongs_to :user
- belongs_to :travel

## categoriesテーブル
| Column          | Type     | Options      |
| --------------  | ------   | ----------   |
| name            | string   | null: false  |
### Association
- has_many :spots

## spotsテーブル
| Column          | Type     | Options      |
| --------------  | ------   | ----------   |
| name            | string   | null: false  |
| url             | string   | null: false  |
| genre           | string   | null: false  |
| category        | reference| null: false  |
### Association
- belongs_to :category

# 課題や今後実装したい機能<br>
* レスポンシブWebデザイン<br>
* ジャンケン結果表示時、非同期処理で押下した旅行名、グループ名の背景色変更機能<br>
* グループ作成時に参加するユーザーを検索出来る様にしたい。<br>
（ユーザーが増えた場合、プルダウン選択のみでは利便性が悪いため）<br>
* グループに参加できる人数を5人以上にも対応したい。<br>
* ユーザー登録ページ以外でもエラーメッセージ表示をしたい。<br>
  (ユーザーと紐づく情報をDBから取得しプルダウンに表示させる為、現在のコードでrenderメソッドを用いてエラーviewを表示させると、プルダウンにユーザーと紐づく情報が表示されなくなってしまう）<br>
* "6.男気ジャンケンSpot検索機能"は検索するだけでなく、ユーザーが登録出来るようにすることで、<br>
  ユーザー同士がおすすめの男気ジャンケンSpotを紹介できる様にしたい。<br>
