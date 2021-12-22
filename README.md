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
* belongs_to: shipping address

## shipping address table

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| family_name        | string  | null: false                    |
| first_name         | string  | null: false                    |
| family_name_kana   | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| post_code          | string  | null: false                    |
| prefecture         | string  | null: false                    |
| city               | string  | null: false                    |
| address            | string  | null: false                    |
| building_name      | string  |                                |
| phone_number       | string  | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## card table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| cache_number  | integer    | null: false, foreign_key: true |
| customer_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

# items table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| items_name  | string     | null: false                    |
| explanation | string     | null: false                    |
| price       | string     | null: false                    |
| category    | string     | null: false                    |
| situation   | string     | null: false                    |
| cost        | integer    | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user