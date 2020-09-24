# テーブル設計

## users テーブル

| column            | type      | options     |
|------------------ |---------  |------------ |
| nickname          | string    | null:false  |
| mailaddress       | string    | null:false  |
| password          | string    | null:false  |
| repassword        | string    | null:false  |
| family_name       | string    | null:false  |
| first_name        | string    | null:false  |
| family_name_kana  | string    | null:false  |
| first_name_kana   | string    | null:false  |
| birthday          | integer   | null:false  |

### Association

-has_many:items
-has_many:order

## items テーブル

| column              | type      | options                         |
|-------------------- |---------  |-------------------------------  |
| item-name           | string    | null:false                      |
| item-info           | text      | null:false                      |
| category_id         | integer   | null:false                      |
| status_id           | integer   | null:false                      |
| shopping_status_id  | integer   | null:false                      |
| prifecture_id       | integer   | null:false                      |
| scheduled_id        | integer   | null:false                      |
| item-price          | integer   | null:false                      |
| users_id            | integer   | null:false, foreign_key: true   |

### Association

-belongs_to:user
-has_one:order

## orders テーブル

| column    | type      | options                         |
|---------- |---------  |-------------------------------  |
| users_id  | integer   | null:false, foreign_key: true   |
| items_id  | integer   | null:false, foreign_key: true   |

### Association

-belongs_to:user
-belongs_to:item dependent: :destroy
-has_one:address dependent: :destroy

## address テーブル

| column        | type      | options                         |
|-------------  |---------  |-------------------------------  |
| post number   | integer   | null:false                      |
| state_id      | integer   | null:false                      |
| city          | string    | null:false                      |
| housenumber   | integer   | null:false                      |
| housename     | string    |                                 |
| phonenumber   | integer   | null:false                      |
| orders_id     | integer   | null:false, foreign_key: true   |

### Association

-belongs_to:order dependent: :destroy
