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

