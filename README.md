# PlayPiano

# プロジェクトの設定

当プロジェクトでは git lfs を利用しています

プロジェクトをクローンした際には以下のコマンドの実行をお願いします

## brew の導入

[こちらのサイト](https://brew.sh/ja/)に従ってbrewをダウンロードしてください

既に brew が入っている場合こちらの操作は不要になります

### brew が導入されているかの確認方法
```shell
$ brew -v
```
こちらのコマンドを実行して下のようにバージョンが表示されれば導入は完了しています
```
Homebrew 4.3.13
```


## git-lfs のインストール
```shell
$ brew install git-lfs
```

## git lfs の有効化
```shell
$ git lfs install
```

## git lfs で管理するファイルの取得
```shell
$ git lfs pull
```
