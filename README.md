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
- has_many :orders
- has_many :messages
- has_many :sns_credentials
- has_one  :card

## items テーブル

| Column           | Type       | Options     |
| ---------------- | -----------| ----------- |
| name             | string     | null: false |
| text             | text       | null: false |
| user             | references | null: false | foreign_key: true |
| category_id      | integer    | null: false |
| item_status_id   | integer    | null: false |
| area_id          | integer    | null: false |
| delivery_time_id | integer    | null: false |
| shipping_fee_id  | integer    | null: false |
| price            | integer    | null: false |

### Association

- belongs_to :user
- has_one    : order
- has_many   :messages
- has_one    :click_order

## order テーブル

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
| postal_code      | string     | null: false |
| state_id         | integer    | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| bldg             | string     |             |
| phone_number     | string     | null: false |
| order            | references | null: false | foreign_key: true |

### Association

- belongs_to :order


## messages テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | string     | null: false |
| user       | references | null: false | foreign_key: true |
| item       | references | null: false | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## sns_credentials テーブル

| Column     | Type       | Options     |
| ---------- | ---------- |
| provider   | string     |
| uid        | string     |
| user       | references | null: false | foreign_key: true |

### Association

- belongs_to :user

## cards テーブル

| Column         | Type       | Options     |
| -------------- | ---------- |
| card_token     | string     | null: false |
| customer_token | string     | null: false |
| user           | references | null: false | foreign_key: true |

### Association

- belongs_to :user

## click_orders テーブル

| Column         | Type       | Options     |
| -------------- | ---------- |
| item           | references | null: false | foreign_key: true |

### Association

- belongs_to :item