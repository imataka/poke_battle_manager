# ポケモンの（とりあえずシングル）レートで高レートマンを目指そう

このアプリは「ポケットモンスター サン／ムーン」のレーティングバトルの対戦情報を記録・整理するために作っているアプリです．

## Requirement
- Ruby (2.3.1)
    + Bundler
        * `$ gem install bundler`
- mysql
    + `poke` という名前のユーザを掘って適当に権限を与えてください．
    ```
    $ mysql
    > create user 'poke'@'localhost';
    > grant all on *.* to 'poke'@'localhost';
    ```

## Installation
1. Ruby 2.3.1をインストールします．
2. 以下のコマンドを実行します．

```
$ git clone https://github.com/RY-2718/poke_battle_manager
$ bundle install --path vendor/bundle
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

## Usage
以下のコマンドによりrailsを実行します．
```
$ rails s
```

## その他
8割くらい勉強のために作っているアプリです．何かあったら教えて下さい．
