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
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| catagory_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| beard_id    | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| purchase    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル 　※カード情報は保存

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopaddress

## shopaddresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
