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
| birthday       | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| description | string  | null: false |
| catagory    | integer | null: false |
| status      | integer | null: false |
| beard       | integer | null: false |
| area        | integer | null: false |
| days        | integer | null: false |
| price       | integer | null: false |

### Association

- belongs_to :user
- has_one :purchace

## purchases テーブル 　※カード情報は保存

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_many :shipping_addresses

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| prefectures      | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
