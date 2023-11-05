# テーブル設計

## users テーブル

| Column             | Type     | Options             |
| ------------------ | -------- | ------------------- |
| nickname           | string   | null: false         |
| email              | string   | null: false, unique |
| encrypted_password | string   | null: false         |
| first_name         | string   | null: false         |
| family_name        | string   | null: false         |
| first_name_kana    | string   | null: false         |
| family_name_kana   | string   | null: false         |
| birthday           | date     | null: false         |

### Association

- has_many :comments
- has_many :items

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| explanation  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| wait_id      | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

##  buyersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_code   | string     | null: false                    |
| area_id     | integer    | null: false                    |
| cities      | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone       | string     | null: false                    |

### Association

- belongs_to :order

##  ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- has_one :buyer