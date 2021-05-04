# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :comments
- has_many :items
- has_many :buyers

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| price         | integer    | null: false                    |
| charges       | integer    | null: false                    |
| area          | string     | null: false                    |
| delivery_date | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_one    :buyers
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| credit_num     | integer    | null: false                    |
| e_date         | integer    | null: false                    |
| security_code  | integer    | null: false                    |
| postal_code    | integer    | null: false                    |
| address1       | string     | null: false                    |
| address2       | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user