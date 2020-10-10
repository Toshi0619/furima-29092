# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------  | ------  | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| firstname      | string  | null: false |
| lastname       | string  | null: false |
| firstname_kana | string  | null: false |
| lastname_kana  | string  | null: false |
| birthyear      | integer | null: false |
| birthmounth    | integer | null: false |
| birthday       | integer | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :shipping_address

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| image       | string  | null: false |
| name        | string  | null: false |
| description | string  | null: false |
| catagory    | string  | null: false |
| status      | string  | null: false |
| beard       | string  | null: false |
| area        | string  | null: false |
| days        | integer | null: false |
| price       | integer | null: false |

### Association

- belongs_to :user
- has_one :purchace
- has_one :shipping_address

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| credit_number   | integer    | null: false                    |
| limit_year      | inteder    | null: false                    |
| limit_month     | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| prefectures      | references | null: false                    |
| municipality     | references | null: false                    |
| address          | string     | null: false                    |
| building_name    | references |                                |
| phone_number     | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :purchase
