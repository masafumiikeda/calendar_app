## usersテーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|name              |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |

### Association
- has_many :events

## eventsテーブル

|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|title             |string    |                             |
|content           |text      |                             |
|start_time        |integer   |                             |
|user              |references|null: false, foreign_key:true|

### Association
- belongs_to :user