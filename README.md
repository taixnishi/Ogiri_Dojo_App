# Ruby on rails で作成した大喜利アプリ
アプリURL:https://ogiridojo.herokuapp.com/
これはプログラミングスクールGeekSalonで3ヶ月学習した集大成で作成されたアプリです。
初めてのアプリ作成のため、いろいろコードが稚拙ですがご了承ください。
# 使い方
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。 その後、次のコマンドで必要になる RubyGems をインストールします。

``
$ bundle install --without production
``

その後、データベースへのマイグレーションを実行します。

``
$ rails db:migrate
``

最後に、テストを実行してうまく動いているかどうか確認してください。

``
$ rails test
``

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

``
$ rails server
``
