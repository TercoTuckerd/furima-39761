# テーブル設計

## users テーブル

| Column             | Type    | Options             |
| ------------------ | ------- | ------------------- |
| nickname           | string  | null: false         |
| email              | string  | null: false         |
| encrypted_password | string  | null: false         |
| name               | string  | null: false         |
| birth_year         | integer | null: false         |
| birth_month        | integer | null: false         |
| birth_day          | integer | null: false         |

### Association

- has_many :comments
- has_many :merchs
- has_one  :purchase

## merchs テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product_name | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| charge       | integer    | null: false                    |
| area         | integer    | null: false                    |
| wait         | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| merch   | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :merch

##  purchasesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | integer    | null: false                    |
| card_expiry | datetim    | null: false                    |
| card_cvc    | integer    | null: false                    |
| post_code   | string     | null: false                    |
| prefectures | integer    | null: false                    |
| cities      | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user