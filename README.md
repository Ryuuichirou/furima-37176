## users テーブル
| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nick_name          | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| first_name         | string | null: false                |
| last_name          | string | null: false                |
| first_name_kana    | string | null: false                |
| last_name_kana     | string | null: false                |
| birthday           | date   | null: false                |

- has_many :purchase_histories
- has_many :items

## addresses テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address            | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| postal_cord        | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| purchase_history   | references | null: false, foreign_key: true |

- belongs_to :Purchase_history

## purchase_histories テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- has_many :users
- has_one :purchase_history
