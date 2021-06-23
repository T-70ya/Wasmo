 ## アプリ名
 Wasmo
 
 ## 概要
 ユーザーを登録して目標金額を定めて、金額と日付を入力すると、<br />
 カレンダーに表示され目標金額と使用金額の差額が表示される。
 
 ## 本番環境 
 
 https://wasmo.herokuapp.com/
 <p>
 ログイン情報（テスト用)
 </p>
 ・ Eメールアドレス :taro@taro.jp <br />
 ・ パスワード :111111
 
 ## 制作背景（意図）
 自分が普段少しだけしてしまう無駄遣いが果たしてどのくらいになってしまうのかを考え、<br />
 その上で自分と同年代の人が似たようなことを思っているのではないかと思い、<br />
 目標額を定められて月にどれだけの金額を使用しているのか把握できるようなアプリを制作しました。
 
 ## DEMO
 <strong>ログイン画面</strobg><br />
 <img width="1440" alt="login" src="https://user-images.githubusercontent.com/83529176/123090545-3ae6ff00-d463-11eb-8a59-e90b99f6e48f.png"><br />
 
 
 <strong>新規登録画面</strong><br />
 <img width="1440" alt="signup" src="https://user-images.githubusercontent.com/83529176/123090550-3d495900-d463-11eb-9a61-ce306d69fd00.png"><br />
 
 <strong>トップページ</strong><br />
 <img width="1440" alt="toppage" src="https://user-images.githubusercontent.com/83529176/123090559-40444980-d463-11eb-9b05-14debb586b45.png"><br />
 
 <strong>目標金額入力画面</strong><br />
 <img width="1440" alt="target" src="https://user-images.githubusercontent.com/83529176/123090566-42a6a380-d463-11eb-9e3f-8c8250284f59.png"><br />
 
 <strong>金額入力画面</strong><br />
 <img width="1440" alt="moneyform" src="https://user-images.githubusercontent.com/83529176/123090562-41757680-d463-11eb-9022-ee9337b03f15.png"><br />
 
 ## 工夫したポイント
 
 ・ トップページにはわかりやすく金額のみ表示させた。<br />
 ・ トップページにわかりやすく目標金額と使用金額と差額を表示させた。<br />
 ・ 検索機能を入れて過去の内容を遡れるようにした<br />
 
 ## 使用技術
 Ruby on Rails/ HTML CSS / Javascript / Mysql / Git Hub / Heroku
 
 ## 課題や実装したい内容
せっかくユーザー機能があるのでフレンド機能やフォロー機能などを設けてユーザーと他のユーザーの中身を見比べれるようにしたい

## Contents

|Colum  |Type     |Option       |
|-------|---------|-------------|
|title  |string   |null: false  |
|money  |integer  |null: false  |

## Association

・belongs_to :user
・has_one :plan

## Users

|Colum               |Type     |Option       |
|--------------------|---------|-------------|
|username            |string   |null: false  |
|email               |string   |null: false  |
|encrypted_password  |string   |null: false  |

## Association

・has_many :contents
・has_many :plans

## Plans

|Colum    |Type     |Option       |
|---------|---------|-------------|
|target   |integer  |null: false  |

## Association

・belongs_to :user
・has_one :content

