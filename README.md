# 株式会社ゆめみ iOS エンジニアコードチェック課題

## 概要

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に iOS エンジニアを希望する方に出す課題のベースプロジェクトです。本課題が与えられた方は、下記の概要を詳しく読んだ上で課題を取り組んでください。

## アプリ仕様

本アプリは GitHub のリポジトリーを検索するアプリです。

![動作イメージ](README_Images/app.gif)

### 環境

- IDE：基本最新の安定版（本概要更新時点では Xcode 13.0）
- Swift：基本最新の安定版（本概要更新時点では Swift 5.5）
- 開発ターゲット：基本最新の安定版（本概要更新時点では iOS 15.0）
- サードパーティーライブラリーの利用：オープンソースのものに限り制限しない

### 動作

1. 何かしらのキーワードを入力
2. GitHub API（`search/repositories`）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
3. 特定の結果を選択したら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示

## 課題取り組み方法

Issues を確認した上、本プロジェクトを [**Duplicate** してください](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)（Fork しないようにしてください。必要ならプライベートリポジトリーにしても大丈夫です）。今後のコミットは全てご自身のリポジトリーで行ってください。

コードチェックの課題 Issue は全て [`課題`](https://github.com/yumemi/ios-engineer-codecheck/milestone/1) Milestone がついており、難易度に応じて Label が [`初級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A初級+milestone%3A課題)、[`中級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A中級+milestone%3A課題+) と [`ボーナス`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3Aボーナス+milestone%3A課題+) に分けられています。課題の必須／選択は下記の表とします：

|   | 初級 | 中級 | ボーナス
|--:|:--:|:--:|:--:|
| 新卒／未経験者 | 必須 | 選択 | 選択 |
| 中途／経験者 | 必須 | 必須 | 選択 |


課題 Issueをご自身のリポジトリーにコピーするGitHub Actionsをご用意しております。  
[こちらのWorkflow](./.github/workflows/copy-issues.yml)を[手動でトリガーする](https://docs.github.com/ja/actions/managing-workflow-runs/manually-running-a-workflow)ことでコピーできますのでご活用下さい。

課題が完成したら、リポジトリーのアドレスを教えてください。

## 参考記事

提出された課題の評価ポイントに関しては、[こちらの記事](https://qiita.com/lovee/items/d76c68341ec3e7beb611)に詳しく書かれてありますので、ぜひご覧ください。  
  
  
## 追加した機能  
  
- お気に入り機能(実装途中)  
- リポジトリをSafariかアプリで開く  
  
  
## UI変更点  
  
- 画面タイトルの変更  
- セル、詳細画面を下記画像のように変更  
  
  
## スクリーンショット  
  
<img src="https://user-images.githubusercontent.com/65600700/147543988-2e67b701-4cd8-438a-8bb9-3fd84f5c6dae.PNG" width="250px">  <img src="https://user-images.githubusercontent.com/65600700/147544171-8a6d2cc0-366d-44dc-8970-891fa0f391d2.PNG" width="250px"> <img src="https://user-images.githubusercontent.com/65600700/147544221-67ed9ae3-ddde-452f-bdc5-041b1f23c47b.PNG" width="250px">  
  
## 利用ライブラリ(SPMとPodとHomebrew)  
### - Swift Package Manager  

- [Alamofire](https://github.com/Alamofire/Alamofire)  
    簡潔かつシンプルにAPI通信を実装できるため  
  
  
- [Nuke](https://github.com/kean/Nuke)  
    URLから画像をダウンロードするため  
  
  
- [RealmSwift](https://github.com/realm/realm-swift)  
    お気に入り機能を実装するため  
  
### - Cocoa Pods  
  
- [Mockingjay](https://github.com/kylef/Mockingjay)  
    HTTP/HTTPS通信をスタブに置き換えてくれるSwiftのテスティングライブラリ  
  
### - Homebrew  
  
- [SwiftLint](https://github.com/realm/SwiftLint)  
    ソースコードの品質管理のため  
  
## 今後の課題  
  
- お気に入り機能  
- テスト  
    テストについては現在勉強中
    
- issueのプログラム構造をリファクタリング    
    SOLID原則などについては現在勉強中  
  
- issueのアーキテクチャの適用  
  MVC,MVP,MVVMなどのアーキテクチャについては現在勉強中  
  
## 特に見ていただきたいところ  
  
今回、gitのコミット粒度やgithubのブランチ戦略なども勉強し、意識して開発しました。  

    
    
## 参考  
  
- [GitHub API ドキュメント](https://docs.github.com/ja/rest/reference/search#search-repositories)  
- [GitHubのネイティブアプリ](https://apps.apple.com/jp/app/github/id1477376905)  
  

## 今回のコードチェック課題を終えて  
  
基礎の部分の重要性を改めて実感しました。保守性や設計などについてはこれからの課題として重点的に勉強していこうと思います。  
