# 🎮GAMEFOLIO（ゲームフォリオ）
※現在はサービス終了しています。

<img src="app/assets/images/ogp_image.png" width="500">

## ■ サービス概要
ゲームフォリオはゲームとポートフォリオを掛け合わせたアプリです。これまで遊んだゲームや日々のゲームに関する活動を記録していくことで、ユーザー自身のプロフィールが充実していきます。また、登録した記録をほかのユーザーに共有できるソーシャル機能もあります。
## ■ 作りたいと思った理由
昔からゲームが好きで、何かアプリを作成するならゲーム関連のものにしたいと考えていました。

エンジニアを目指す者たちが集まるコミュニティに参加し、ゲームが好きな人たちとも交流が増えました。しかし、お互い同じゲームをプレイしたことがあるのに、それが話題にならず会話が終わってしまうことがありました。「自分とは好みが違うゲーマーなのかな」と、その時は距離を縮めることができませんでした。

そのような経験から、自分がどんなゲームをしてきたのかわかるものがあればゲーム好きの中でも趣味が似ている仲間を見つけやすくなるのではと思いました。自分を表現する「ポートフォリオ」と「ゲーム」が結びつき、このサービスの制作を始めました。

## ■ 機能紹介
| ログイン/新規登録 |
| :--: |
| [![Image from Gyazo](https://i.gyazo.com/bd20d08b79c2686e2497eabc4c48ba1b.png)](https://gyazo.com/bd20d08b79c2686e2497eabc4c48ba1b) |
|<p align="left">『ユーザーネーム』『ユーザーID』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行えます。アプリのゲームのような世界感に合わせて、「パスワード」を「復活の呪文」に、「新規登録」を「はじめから」というように表記を変えています。<br>またGoogleアカウントを用いてログインする機能もあります。</P>|

| ゲーム検索/登録 |
| :--: |
| [![Image from Gyazo](https://i.gyazo.com/14ed92fa52b83470a1534c613d4b05bb.gif)](https://gyazo.com/14ed92fa52b83470a1534c613d4b05bb) |
|<p align="left">ゲームのタイトルを検索して保存することで、ユーザーは遊んだことのあるゲームをゲームライブラリに登録することができます。他のユーザーのゲームライブラリも閲覧することができます。<br>また、登録したゲーム各々にプレイ状況をメモすることが可能です。</P>|
| [![Image from Gyazo](https://i.gyazo.com/e8848f8598772590aba672d4e3eda594.png)](https://gyazo.com/e8848f8598772590aba672d4e3eda594) |
|<p align="left">登録されたゲームの数に応じて、プロフィール欄のグラフが変化し、ユーザーがどんなジャンルをよく遊んでいるかが一目でわかります。</p>|

| ゲームの記録を投稿 |
| :--: |
| [![Image from Gyazo](https://i.gyazo.com/abb5e9b0e03a6576d87837f7aa6cac4a.gif)](https://gyazo.com/abb5e9b0e03a6576d87837f7aa6cac4a) |
|<p align="left">ゲームライブラリに登録したゲームに関する記録（以下、ゲームログ）を投稿することができます。ゲームログには『タイトル』『本文』『プレイ時間』『課金額』『画像』を記録します。投稿されたゲームログにはいいねやコメントを付けることや、Xにシェアする機能もあります。</p>|

| 称号の獲得 |
| :--: |
|[![Image from Gyazo](https://i.gyazo.com/e8502c6e1e546815f944dac3cba4aa84.gif)](https://gyazo.com/e8502c6e1e546815f944dac3cba4aa84)|
|<p align="left">ゲームライブラリに登録されたゲームをもとに称号を獲得できます。称号獲得にはアプリ内で入手できるジェムを使用します。称号はAIが考えています。</p>|

## ■ 使用技術
| カテゴリ | 技術内容 |
| --- | --- |
| サーバサイド | Ruby on Rails 7.2.2 / Ruby 3.2.3 |
| フロントエンド | Ruby on Rails / JavaScript |
| CSSフレームワーク | Tailwindcss + daisyUI |
| Web API | IGDB API / Gemini API |
| データベースサーバー | Render.com(PostgreSQL) |
| ファイルサーバー | AWS S3 |
| アプリケーションサーバー | Render.com |
| バージョン管理ツール | GitHub・Git Flow |

## ■ 画面遷移図
[Figma](https://www.figma.com/design/c6yptGLsBiAPzElvSWo7IT/%E3%82%B2%E3%83%BC%E3%83%A0%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0-1&t=5zp40octv6rGFT0H-1)
## ■ E-R図
[URL](https://drive.google.com/file/d/1EV_svL9I-K4_CLjvoEyoXjjnHQoK_HPy/view?usp=sharing)<br>
[![Image from Gyazo](https://i.gyazo.com/5a91c8fd77cd07f75fff69713dea1b17.png)](https://gyazo.com/5a91c8fd77cd07f75fff69713dea1b17)
