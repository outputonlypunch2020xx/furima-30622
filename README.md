## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| birthday         | date   | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options     |
| ------------ | -----------| ----------- |
| name         | string     | null: false |
| text         | text       | null: false |
| user         | references | null: false | foreign_key: true |
| category     | integer    | null: false |
| item_status  | integer    | null: false |
| area         | integer    | null: false |
| shipping_days| integer    | null: false |
| shipping_fee | integer    | null: false |
| price        | integer    | null: false |

### Association

- belongs_to :user
- has_one : purchase

## purchases テーブル

| Column     | Type       | Options     |
| -----------| ---------- | ----------- |
| user       | references | null: false | foreign_key: true |
| item       | references | null: false | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : buyer

## buyers テーブル

| Column           | Type       | Options     |
| ---------------- | ------     | ----------- |
| Postal code      | integer    | null: false |
| State            | integer    | null: false |
| city             | string     | null: false |
| Address Line 1   | string     | null: false |
| Address Line 2   | string     | null: false |
| Phone Number     | integer    | null: false |
| item             | references | null: false | foreign_key: true |

### Association

- belongs_to :purchase
