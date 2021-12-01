## users テーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nick_name          | string | null: false  |
| email              | string | unique: true |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_name_kana    | string | null: false  |
| last_name_kana     | string | null: false  |
| encrypted_password | string | null: false  |
| birthday           | date   | null: false  |

- has_many :Purchase history
- belongs_to :address

## address テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| telephone_number   | decimal    | null: false                    |
| prefectures        | text       | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| postal_cord        | string     | null: false                    |
| building_name      | string     |                                |

- has_many :item
- has_many :user

## Purchase history テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user

## item テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| condition          | text       | null: false                    |
| shipment_source    | text       | null: false                    |
| explanation        | text       | null: false                    |
| delivery_fee       | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| item_name          | string     | null: false                    |
| category           | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

- has_many :Purchase history
- belongs_to :address
- has_many_active_hash :category
- has_many_active_hash :condition 
- has_many_active_hash :delivery_fee
- has_many_active_hash :shipment_source
- has_many_active_hash :delivery_day_id