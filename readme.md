# HDI_WebServer_RateLimitingQuotas

Description (4D 21 R5)

Get started with web server quotas.

Find more information on the [blog post](https://blog.4d.com/a-4d-web-server-that-knows-when-to-say-no).

### Languages

The demo is available in **English** and **Japanese**. It follows the language of your OS; use the **English | 日本語** menu on the start window to switch. The browser test page follows the same language.

Strings live in `Resources/en.lproj` and `Resources/ja.lproj` (XLIFF). To add a language, copy the `en.lproj` folder to `<code>.lproj`, translate the `<target>` elements and set `target-language`.

## Installing and Using a 4D Project

### Pre-requisites

* Download the latest Release version of 4D from: https://us.4d.com/product-download or the latest Beta version from: https://discuss.4d.com
* Follow the activation steps for 4D from: https://developer.4d.com/docs/GettingStarted/installation

### Steps to Run the Project

* Clone or download the GitHub repository containing the 4D project to your local machine. Need help, check out [this blog](https://blog.4d.com/github-4d-depot/).
* Open the 4D project in your 4D software by navigating to "File > Open Project".  You can find more details [here](https://developer.4d.com/docs/GettingStarted/creating#opening-a-project).
* Play with this HDI.
* Navigate to the "Mode/Return to design mode" menu to view the code.

By following these steps, you will be able to successfully install and run a 4D project.

## 日本語

4D Web サーバーの**クォータ**機能を使って、流量制限（レート制限）を設定する方法を紹介する HDI（How do I）サンプルです。4D 21 R5 以降が必要です。

### 使い方

1. このリポジトリをクローンまたはダウンロードし、4D で「ファイル > プロジェクトを開く」から `Project/HDI_WebServer_RateLimitingQuotas.4DProject` を開きます。
2. スタート画面で **デモ** をクリックします。表示言語は OS の設定に従います。右下の **English | 日本語** メニューで切り替えることもできます。
3. 各タブの手順に沿って **適用** → **今すぐテスト** をクリックすると、既定のブラウザーでテストページが開きます。緑色で強調表示されたセクションを使ってクォータの効果を確認できます。
4. コードを見るには「モード > デザインモードに戻る」を選択します。

詳しくは [ブログ記事（英語）](https://blog.4d.com/a-4d-web-server-that-knows-when-to-say-no) をご覧ください。
