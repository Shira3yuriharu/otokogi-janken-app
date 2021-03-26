# テーブル設計

## usersテーブル
| Column            | Type      | Options                    |
| --------------    | ------    | ----------------------     |
| nickname          | string    | null: false ,  Unique:true |
| email             | string    | null: false ,  Unique:true |
| encrypted_password| string    | null: false                |
### Association
- has_many :groups
- has_many :comments
- has_many :user_groups

## groupsテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| name            | string   | null: false ,  Unique:true |
### Association
- has_many :users
- has_many :travels
- has_many :user_groups

## user_groupsテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| user            | reference| null: false                |
| group           | reference| null: false                |
### Association
- belongs_to :user
- belongs_to :group
- belongs_to :result

## travels テーブル
| Column              | Type     | Options                    |
| --------------      | ------   | ------------------------   |
| name                | string   | null: false ,  Unique:true |
| start_day           | date     | null: false                |
| end_day             | date     | null: false                |
| group               | reference| null: false                |
### Association
- belongs_to :group
- belongs_to :result
- belongs_to :comment

## results テーブル
| Column           | Type     | Options    |
| -------          | ------   | ---------  |
| money            | integer  | null: false|
| item_category_id | integer  |            |
| note             | string   |            |
| travel           | reference| null: false|
| user_group       | reference| null: false|
### Association
- belongs_to :travel
- belongs_to :user_group