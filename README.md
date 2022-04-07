# Relacation

## URL
https://secret-atoll-75279.herokuapp.com/

## このアプリケーションを作成した理由
1. 目まぐるしく変動し、慌しい社会に癒しを。みんなの癒し情報を共有し、より良く充実した人生をみんなで作り出す社会にしたいと思ったから

2. 自分の好きなアプリケーションの模擬サイトを作ることによるスキルの向上

3. 今ままで学んできた事のアウトプット 　（devise機能、投稿機能実装、active_storageの導入及び写真投稿機能）

4. 経験にない実装への挑戦(google map api機能の実装、いいね・フォロー機能の実装)

## 苦労した点
- google map apiキー非表示
- いいねとフォロー機能の実装
多対多の関係、中間テーブルの作成などの理解に苦労した。
-Herokuデプロイの際様々なエラーが起き対処に苦労した
（herokuのbundlerとローカルでのbundlerのバージョンの相違、Bootstrapの反映、GoogleのAPIキーをherokuに登録し忘れた為にJSの挙動がおかしいと勘違いし、無駄な試行錯誤をしてしまったなど）。対処の際参考にしたサイトを下記に記す。

https://qiita.com/m6mmsf/items/fb8a8672df98bdb59c9c

https://qiita.com/MandoNarin/items/aa91ffae373a8cfc85d2

https://qiita.com/DogK0625/items/12178fdc3dd607088ff0

https://qiita.com/Jackson123/items/d7d9d333370c0f952b29

## DB設計
#### usersテーブル
| Column       | Type         |              |
| :---         | :---         | :---         |
| email        | string       |              |
| name         | string       |              |
| image        | string       |              |

#### photosテーブル
| Column       | Type         |              |
| :---         | :---         | :---         |
| user_id      | integer      |  null: false, foreign_key: true            |
| caption      | text         |              |
| latitude     | float        |              |
| longitude    | float        |              |

#### relationshipsテーブル
| Column       | Type         |              |
| :---         | :---         | :---         |
| following_id | integer      |  null: false |
| follower_id  | integer      |  null: false |

#### likesテーブル
| Column       | Type         |              |
| :---         | :---         | :---         |
| user_id      | integer      |              |
| photo_id     | integer      |              |

![follow_list](https://user-images.githubusercontent.com/95272366/162178129-9fe840fc-ca76-41f8-94e6-513d0de31046.gif)
![like](https://user-images.githubusercontent.com/95272366/162178147-1a11167f-6f7b-4b2b-ba6c-12314fbe0eeb.gif)
![neme_search](https://user-images.githubusercontent.com/95272366/162178167-2c4e0570-cf02-4f2d-9964-ffde03cf7b69.gif)
![post](https://user-images.githubusercontent.com/95272366/162178171-208dabe6-1727-4328-acd3-46af0bd899ff.gif)
![search_map](https://user-images.githubusercontent.com/95272366/162178189-a7210c84-9aa3-40ed-99be-3c7db3e0175f.gif)
![sign_in](https://user-images.githubusercontent.com/95272366/162178196-7f74a7ea-d3ec-432b-b177-c428e64e8324.gif)
![timeline](https://user-images.githubusercontent.com/95272366/162178208-d16eea75-745e-4bca-b1c1-fe4d9aa877e8.gif)

## 課題
・APIキーなどセキュリティーの意識
当初APIキーのコードをそのままpushしてしまい、通知にてネット上でアップしたことへのリスクを知り、早急に削除APIキーの再作成を行なった。セキュリティーへの意識はweb制作に携わっていく上で必要な知識であるので、今回の実装で小さく失敗して良かったと思っている。今後は参考サイトを鵜呑みにせず理解した上で実装する習慣を身につけたい。
・gitにおけるcommit,branch作成の精度と意識
グループ開発の実践経験が不足しているためcommitの精度やブランチの仕方など未熟に感じています。将来的なグループ開発を進めていく際にはbranch、commitの作成を課題とし、意識を置いて実装していきたい。
・デザイン性
プログラミング未経験の知人に見せたところ、ビジュアル面で懸念を感じていた。デザインに関する知識を身に付け数を積み重ねることで、良くしていきたい。

### あとがき
模擬SNSサイトを作ることで得た知識や技術を色々なサイト制作で臨機応変出来ると思い、みんなの癒し情報を共有するSNS模擬サイトを制作した。見た目も、機能もまだまだ技術力の向上が必要だと感じるが、プログラミング学習を始めた４ヶ月前と比べて知識や技術面の成長を感じている。 webアプリケーションはチームや個人で作り上げた成果物を多くの人へ利用される素晴らしいものだと思う。私が生きてきた中でこれまでに多くの素晴らしいアプリケーションに出会い便利で役に立ってきました。将来は私が感動を覚えたように、自身の技術力を向上し、何か自分で人を喜ばせる、人のためになる物を作り上げ誰かにとってかけがえのないものとなるアプリケーションを作成したいです。
