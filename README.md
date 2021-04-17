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
- has_many :group_users
- has_many :travel_selects

## groupsテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| name            | string   | null: false ,  Unique:true |
### Association
- has_many :users
- has_many :travels
- has_many :group_users

## group_usersテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| group           | reference| null: false                |
| user            | reference| null: false                |
### Association
- belongs_to :user
- belongs_to :group

## travels テーブル
| Column              | Type     | Options                    |
| --------------      | ------   | ------------------------   |
| name                | string   | null: false ,  Unique:true |
| start_day           | date     | null: false                |
| end_day             | date     | null: false                |
| group               | reference| null: false                |
### Association
- belongs_to :group
- has_many :travel_selects
- has_many :comments

## travel_selectsテーブル
| Column          | Type     | Options                    |
| --------------  | ------   | ------------------------   |
| travel          | reference| null: false                |
| user            | reference| null: false                |
### Association
- belongs_to :travel
- belongs_to :user
- has_many :results


## results テーブル
| Column           | Type     | Options    |
| -------          | ------   | ---------  |
| nickname         | string   | null: false|
| money            | integer  | null: false|
| item_category_id | integer  |            |
| note             | string   |            |
| travel_select    | reference| null: false|
### Association
- belongs_to :travel_select


## commentsテーブル
| Column          | Type     | Options      |
| --------------  | ------   | ----------   |
| comment         | string   |              |
| user            | reference| null: false  |
| travel          | reference| null: false  |
### Association
- belongs_to :user
- belongs_to :travel