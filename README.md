# README

# テーブル設計

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

* has_many :items
* belongs_to: card
* belongs_to: shipping

## shippings table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## cards table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

# items table

| Column       |  Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| items_name   | string     | null: false                    |
| explanation  | string     | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| situation_id | integer    | null: false                    |
| cost_id      | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## images table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | references | null: false                    |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
