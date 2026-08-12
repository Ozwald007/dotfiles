# dotfiles

## 概要

このリポジトリは、各種設定ファイル（dotfiles）を Git で管理し、異なる環境でも同一の開発環境を再現することを目的としています。

履歴管理やポータビリティの向上、および環境構築の効率化のため、dotfiles を Git で管理します。

シンボリックリンクを利用することで、ホームディレクトリ上のファイル配置を維持したまま、設定ファイル本体を本リポジトリで一元管理できます。

シンボリックリンクの作成はスクリプトによって自動化されており、容易に環境を再現できます。

## シンボリックリンクの管理

dotfiles の展開には、シェルスクリプトを使用します。

冪等性を意識して実装し、展開先を定義した `linklist.txt` を用意することで、各 dotfile の配置先を管理します。

## ディレクトリ構成

```text
repository-root
├── .git
├── dotfiles
│   ├── .vimrc
│   ├── .zshrc
│   └── linklist.txt
└── scripts
    ├── install.sh
    └── link.sh
```

## セットアップ

新しい環境では以下の手順でセットアップを行います。

```sh
./scripts/install.sh
./scripts/link.sh
```

### install.sh

`install.sh` は開発環境の初期セットアップを行います。

実行内容:

1. Homebrew のインストール
2. Homebrew の環境設定
3. zsh のインストール（macOS 標準の zsh を使用するためコメントアウト）
4. Vim のインストール（macOS 標準の Vim を使用するためコメントアウト）
5. ログインシェルを zsh に変更
6. dein.vim のインストール

既に導入済みのソフトウェアについては、再インストールを行いません。

### link.sh

`link.sh` は `linklist.txt` を参照し、dotfiles のシンボリックリンクを作成します。

実行後、`linklist.txt` に定義された内容に従ってシンボリックリンクが作成されます。

## linklist.txt

`linklist.txt` には、シンボリックリンクの作成元と作成先を定義します。

```text
.vimrc ${HOME}/.vimrc
.zshrc ${HOME}/.zshrc
```

左側に管理対象ファイル、右側にリンク作成先を記述します。

## 注意事項

以下のような機密情報は管理対象に含めません。

- SSH 鍵（`~/.ssh`）
- クラウド認証情報（`~/.aws` など）
- パスワードやトークンを含むファイル

また、履歴ファイルやキャッシュファイルは管理対象外とします。

## 動作環境

動作確認環境:

- macOS（Apple Silicon）
- Homebrew

`install.sh` は Apple Silicon Mac の Homebrew を利用してパッケージをインストールします。

Homebrew は `/opt/homebrew` にインストールされることを前提としています。
