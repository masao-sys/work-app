# WORK APP
職場内の報告アプリを作成しました
- 職場内の大切な連絡事項を社員へシェア
- 社員が連絡事項を確認したかが分かる
- 部署ごとの掲示板にてタスク管理

下記のページにて公開中です<br>
https://work-pf.herokuapp.com/

※本アプリは社内用に作りましたのでログインしないと使用できません<br>
　下記 ID Password を利用してログインしてください

| ユーザー | ID | PassWord |
|:-----:|:------------:|:------------:|
| 管理者 | admin@example.com | password |
| 経営陣 | management1@example.com | password |
| 経営陣 | management2@example.com | password |
| 営業部 | sales1@example.com | password |
| 営業部 | sales2@example.com | password |
| 製造部 | production1@example.com | password |
| 製造部 | production2@example.com | password |
| 開発部 | development1@example.com | password |
| 開発部 | development2@example.com | password |

## アプリ画面

### ホーム画面

![FireShot Capture 003 - Workapp - work-pf herokuapp com](https://user-images.githubusercontent.com/66783799/114704941-218a4e00-9d62-11eb-9c6d-750d5ad37749.png)

### 部署一覧
![FireShot Capture 006 - Workapp - work-pf herokuapp com](https://user-images.githubusercontent.com/66783799/114704956-24853e80-9d62-11eb-9ffd-145de274d2a8.png)

### 掲示板
![FireShot Capture 009 - Workapp - work-pf herokuapp com](https://user-images.githubusercontent.com/66783799/114704970-2818c580-9d62-11eb-8544-a2ee564a1a6e.png)


## 機能一覧

|  | 機能 |
|:-----:|:------------:|
| 1 | ログイン機能 |
| 2 | 管理画面機能 |
| 3 | 連絡事項投稿 |
| 4 | ブックマーク登録（Ajax） |
| 5 | 既読機能(Ajax) |
| 6 | 部署区分投稿 |
| 7 | コメント機能（Ajax）|
| 8 | プルフィール変更 |
| 9 | 社員一覧 |

### 補足
ユーザーの属性によって投稿できる区分が変わります。
- ユーザーが管理者(admin)の場合は全体連絡の投稿ができ、管理画面にも移動できます。
- 部署投稿機能は所属ユーザーのみ投稿できます。

## 使用技術
フロントエンド  
 ・HTML(Haml)・CSS（SCSS）・JavaScript（jQuery）  　
  
サーバーサイド  
　・Ruby 2.6.5・Ruby on Rails 6.0.3.4  
  
インフラ・開発環境  
　・PostgreSQL 13.・heroku・RSpec
 
 ## 使用Gem  
active_model_serializers/annotate/aws-sdk-s3/better_errors/  
binding_of_caller/devise/faker//byebug/dotenv-rails/  
factory_bot_rails/pry-byebug/rails-erd/  
rails_admin/rspec-rails/rubocop-rails/erb2haml/capybara  

