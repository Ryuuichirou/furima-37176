## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | date   | null: false |

## buy テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | decimal    | null: false                    |
| telephone_number   | decimal    | null: false                    |
| date_of_expiry     | date       | null: false                    |
| prefectures        | text       | null: false                    |
| municipalities     | text       | null: false                    |
| building_name      | text       | null: false                    |
| security_cord      | integer    | null: false                    |
| postal_cord        | integer    | null: false                    |
| address            | integer    | null: false                    |
| listing            | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## listing テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| explanation        | text       | null: false                    |
| condition          | text       | null: false                    |
| shipment_source    | text       | null: false                    |
| item_name          | string     | null: false                    |
| category           | string     | null: false                    |
| delivery_fee       | integer    | null: false                    |
| price              | integer    | null: false                    |
| days               | date       | null: false                    |
| user               | references | null: false, foreign_key: true |
