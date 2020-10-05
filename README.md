# テーブル設計

## users テーブル

| column                | type      | options     |
|---------------------- |---------  |------------ |
| nickname              | string    | null:false  |
| email                 | string    | null:false  |
| password              | string    | null:false  |
| password_confirmation | string    | null:false  |
| family_name           | string    | null:false  |
| first_name            | string    | null:false  |
| family_name_kana      | string    | null:false  |
| first_name_kana       | string    | null:false  |
| birthday              | datetime      | null:false  |

### Association
  
-has_many:items
-has_many:orders

## items テーブル

| column              | type      | options                         |
|-------------------- |---------  |-------------------------------  |
| name                | string    | null:false                      |
| info                | text      | null:false                      |
| category_id         | integer   | null:false                      |
| status_id           | integer   | null:false                      |
| shopping_status_id  | integer   | null:false                      |
| prifecture_id       | integer   | null:false                      |
| scheduled_id        | integer   | null:false                      |
| price               | integer   | null:false                      |
| user_id             | integer   | null:false, foreign_key: true   |

### Association

-belongs_to:user
-has_one:order

## orders テーブル

| column    | type      | options                         |
|---------- |---------  |-------------------------------  |
| user_id   | integer   | null:false, foreign_key: true   |
| item_id   | integer   | null:false, foreign_key: true   |

### Association

-belongs_to:user
-belongs_to:item dependent: :destroy
-has_one:address dependent: :destroy

## address テーブル

| column        | type      | options                         |
|-------------  |---------  |-------------------------------  |
| postnumber    | string    | null:false                      |
| status        | integer   | null:false                      |
| city          | string    | null:false                      |
| housenumber   | integer   | null:false                      |
| housename     | string    |                                 |
| phonenumber   | string    | null:false                      |
| order_id      | integer   | null:false, foreign_key: true   |

### Association

-belongs_to:order dependent: :destroy
