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
 ログイン画面<br />
 
 新規登録画面<br />
 
 トップページ<br />
 
 目標金額入力画面<br />
 
 金額入力画面<br />
 
 

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

