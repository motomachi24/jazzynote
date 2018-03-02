# jazzynote
This is a script for jazzy.

## Usage:
```
jazzynote [options]
```

- 引数はありません。実行フォルダ下のソースを対象とします。
- 出力先は実行時のフォルダ下に document 固定。
- モジュール名は -m オプションで指定できますが、省略すると実行フォルダ名となります。

## Options:

|                   |                     |
| :---------------- | :------------------ |
| -h                | print this.         |
| -a AUTHOR         | set author name.    |
| -u AUTHOR_URL     | set author url.     |
| -v MODULE_VERSION | set module version. |
| -m MODULE_NAME    | set module name.    |


when omitted, set execution folder name to module name.

## memo
モジュール名の入力を省略するために作りました。自分のプロフィールはデフォルト値を変えておけば変更することが少ないので、通常はオプションなしで使うことが多いと思われます。