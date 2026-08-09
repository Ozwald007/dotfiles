# dotfiles

## 概要

このリポジトリは、各種設定ファイル（dotfiles）を Git で管理し、異なる環境でも同一の開発環境を再現することを目的としています。

履歴管理やポータビリティの向上、および環境構築の効率化のため、dotfiles を Git で管理します。

シンボリックリンクを利用することで、ホームディレクトリ上のファイル配置を維持したまま、設定ファイル本体を本リポジトリで一元管理できます。

シンボリックリンクの作成はスクリプトによって自動化されており、容易に環境を再現できます。

## シンボリックリンクの管理

dotfiles の展開には、多くの環境で利用可能なシェルスクリプトを使用します。

また、冪等性を意識して実装し、展開先を定義した `linklist.txt` を用意することで、各 dotfile の配置先を管理します。

## ディレクトリ構成

```text
repository-root
├── .git
├── .vimrc -> ~/dotfiles/.vimrc
├── .zshrc -> ~/dotfiles/.zshrc
├── dotfiles
│   ├── .vimrc
│   ├── .zshrc
│   └── linklist.txt
└── scripts
    └── link.sh
```

## 利用方法

```sh
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
./scripts/link.sh
```

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

- SSH鍵 (`~/.ssh`)
- クラウド認証情報 (`~/.aws` など)
- パスワードやトークンを含むファイル

また、履歴ファイルやキャッシュファイルは管理対象外とします。
