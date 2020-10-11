## users テーブル

| Column      | Type   | Options     |
| ------------| ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| name        | string | null: false |
| birthday    | date   | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options     |
| -----------  | -----------| ----------- |
| item_name    | string     | null: false |
| text         | text       | null: false |
| user_id      | references | null: false |
| category     | string     | null: false |
| item_status  | string     | null: false |
| area         | string     | null: false |
| shipping_days| string     | null: false |
| price        | integer    | null: false |

### Association

- belongs_to :user
- has_one : purchase

## purchases テーブル

| Column     | Type       | Options     |
| -----------| ---------- | ----------- |
| user_id    | references | null: false |
| item_id    | references | null: false |
| buyer_id   | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one : buyer

## buyers テーブル

| Column           | Type       | Options     |
| ---------------- | ------     | ----------- |
| credit_number    | integer    | null: false |
| shipping_address | string     | null: false |
| item_id          | references | null: false |

### Association

- belongs_to :purchase
