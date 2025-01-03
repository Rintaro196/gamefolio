# GAMEFOLIO（ゲームフォリオ）
## ■ サービス概要
ゲームフォリオはゲームとポートフォリオを掛け合わせたアプリです。これまで遊んだゲームや日々のゲームに関する活動を記録していくことで、ユーザー自身のプロフィールが充実していきます。また、登録した記録をほかのユーザーに共有できるソーシャル機能もあります。
## ■ 作りたいと思った理由
昔からゲームが好きで、何かアプリを作成するならゲーム関連のものにしたいと考えていました。

エンジニアを目指す者たちが集まるコミュニティに参加し、ゲームが好きな人たちとも交流が増えました。しかし、お互い同じゲームをプレイしたことがあるのに、それが話題にならず会話が終わってしまうことがありました。「自分とは好みが違うゲーマーなのかな」と、その時は距離を縮めることができませんでした。

そのような経験から、自分がどんなゲームをしてきたのかわかるものがあればゲーム好きの中でも趣味が似ている仲間を見つけやすくなるのではと思いました。自分を表現する「ポートフォリオ」と「ゲーム」が結びつき、このサービスの制作を始めました。
## ■ ユーザー層について
- 日ごろからゲームを遊ぶ人:<br>このゲームをどれだけプレイしてきたか。ゲーマーにとっては一種のステータスだと思っています。某大手ゲーム会社が一年間最も遊んだゲームが分かるサービスを毎年提供していることから、そのステータスを確認するサービスはゲーマーにとって需要があると思っています。それに自分がどれだけゲーム遊んだのか、他人と比較するのは楽しいものです。
- ゲームが好きな人:<br>この層のユーザーは、自分が好きなゲームの話が通じる人が欲しいという欲求を少なからず持っていると思います。自分とマッチするゲーム仲間を見つける手助けをこのサービスが行います。
## ■ ユーザーの獲得について
まずはコミュニティを活用し、ほかのSNS機能で拡散してもらいます。拡散時にハッシュタグ機能を活用することで想定ユーザー層にサービスの存在を知ってもらうのが狙いです。<br>また煩雑な操作を排除することにより、継続的に使ってもらえる設計を目指します。
## ■ サービスコンセプト
**「自分がどんなゲーマーなのか見ればわかるサービス」**
これをコンセプトにしています。

ゲーム記録を管理するサービスは多いですが、それのほとんどは個人用であり他人に共有するためのサービスは少ないように見えます。そこで既存のゲーム記録サービスの良いところを取り入れ、そこにソーシャル機能を充実させることにより、サービスを通じて同じようなゲームをプレイする仲間を見つけやすくなればと考えています。

またこのサービスのUIにゲームのような要素を取り入れることにより、ゲーマーに馴染みやすく継続して利用していただけるようなデザインを目指していこうと考えています。
## ■ サービスの差別化ポイント・推しポイント
既存のゲーム記録サービスとしては、レビューやコメントをつけて管理するサービスが存在します。それらに対し、ゲームフォリオは自身のゲーム記録を持って自身を表現し、繋がりを広げることに重点を置くことで差別化を行います。

以下推しポイントです。
- 登録した記録はSNSのように共有できる
- ゲームの記録をグラフなどで見える化
- ユーザーにレベルの概念を持たせて、レベルを上げる感覚で記録を行える
## ■ 実装を予定している機能
### MVPリリース
- ユーザー登録(devise）
- ログイン機能
- プレイしたことのあるゲームを登録（ゲームライブラリ）
  <br>IGDB APIを使用する
- ユーザープロフィール詳細
- ゲームの活動記録（ゲームログ）
<br>タイトル、本文、遊んだ時間、課金額、スクショ画像、タグをつけて投稿できる。
  - CRUD機能
  - 画像投稿
- 他ユーザーのゲーム活動記録一覧
- ゲーマーレベル システム
- アプリ内通貨（使用できるのはまだ）
### 本リリース時の機能
- Goodleログイン機能
- いいね機能
- コメント投稿機能
- 記録の検索機能
- ユーザー検索機能
- 通知機能
- 称号の追加
### そのほか実装したい機能
- Discordログイン機能
- ユーザーフォロー機能
- DM機能
- フレンド募集しているゲームの登録
- アバター生成機能
- おすすめゲームの表示
- コレクター要素
- 記録形式の種類を追加
  - 記事、つぶやき、レビュー
- ブックマーク機能
- 投稿物へのリアクション機能（スタンプ）
- ランキング機能

## ■ 機能の実装方針予定
- ゲームライブラリ機能:
<br>IGDB APIを利用しゲーム情報を取得。ゲームを検索し、個人ライブラリに登録することができます。このライブラリは公開＆非公開の設定ができます。登録時には「未クリア」「クリア済」「プレイ中」の三つのステータスのいずれかを設定することができます。
- ユーザープロフィール詳細：
<br>こちらがポートフォリオ部分になります。ユーザーのプロフィールはゲームキャラのステータス画面風を予定しています。例えば登録したゲームのジャンルの数をステータス風のレーダーチャートで表現するや、遊んだトータル時間が戦闘力のように表示されるなどを考えています。また、ステータス以外にも今まで登録した記録のタイムラインや、ゲームライブラリを見ることができます。
- レベルについて：
<br>最大レベルはLv.9999を想定しています。ゲームライブラリに新規登録または、活動の記録するとレベルが１上がります。無意味な投稿を避けるために、活動の記録で上げられるレベルは１日で１回までとします。ゲームを遊べば遊ぶほどレベルが上がるようにしたいです。
- アプリ内通貨：
<br>単位はジェム。レベルが上がったり、実績を達成したりすると獲得できます。アバターの変更、称号の購入、コレクター要素にて消費します。ユーザーにリアルなお金は要求しません。
- アバターについて：
<br>画像生成APIを用いて実装します。どのAPIを用いるかはまだ考えていません。ジェムを消費して作成することができます。ただし１日で作成できる上限は設定します。あらかじめプロンプトはこちらで用意し、ユーザーには各要素（種族、職業、性別、年齢、髪色、肌色、目の色、ジャンルなど）を選択式で設定してもらい作成します。
- 称号について：
<br>ユーザーが登録したゲーム情報から称号をAIに生成させます。獲得した称号は設定によってユーザープロフィールに表示させることができます。
- コレクター要素：
<br>ジェムが余った人向けのやりこみ要素です。ガチャ形式でジェムを消費しアイテムを獲得できます。コレクター図鑑が埋まる以外特になにもありません。
- 各APIを用いたゲーム情報取得：
<br>ユーザー自身のアカウントIDを登録すれば、１日毎に遊んだ記録を自動で取得し表示されることを想定しています。この記録をそのまま登録できるようにはしたいです。
## ■ 画面遷移図
[Figma](https://www.figma.com/design/c6yptGLsBiAPzElvSWo7IT/%E3%82%B2%E3%83%BC%E3%83%A0%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0-1&t=5zp40octv6rGFT0H-1)
## ■ E-R図
[URL](https://drive.google.com/file/d/1EV_svL9I-K4_CLjvoEyoXjjnHQoK_HPy/view?usp=sharing)<br>
[![Image from Gyazo](https://i.gyazo.com/acccbd2ca578cb29af71643e86634f09.png)](https://gyazo.com/acccbd2ca578cb29af71643e86634f09)
## サービスのURL
[GAMEFOLIO](https://gamefolio-m.com/)
