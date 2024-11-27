# 概要
- rubyスクリプトで作成した、英単語当てゲームです。
- rubyコマンドでgame.rbを実行すると、ゲームがスタートされます。

# 仕様
- ユーザーが入力できる文字はアルファベットの1文字で、大文字・小文字は同一とみなします。もし他の文字が入力されたら、再度入力を促します。
- 失敗可能数は５回です。
- ゲームが終了したら、正解の単語を表示してアプリケーションを終了します。
- また、残り失敗可能数が０になってもゲームは終了します。

# 動作方法
## 前提となる動作環境
- MacOS推奨
- Rubyがインストールされていること
## 手動
```sh
cd word_guess_game
ruby game.rb
```

## テスト
```sh
iwauchi ~/word_guess_game % ruby game_test.rb
Ignoring debug-1.7.1 because its extensions are not built. Try: gem pristine debug --version 1.7.1
Ignoring rbs-2.8.2 because its extensions are not built. Try: gem pristine rbs --version 2.8.2
Run options: --seed 52328

# Running:

.......

Finished in 0.000483s, 14492.7535 runs/s, 35196.6871 assertions/s.

7 runs, 17 assertions, 0 failures, 0 errors, 0 skips
```

# うまく実装できなかった点
- 文字数を増やして高難易度を選択できる機能を追加しようと思ったが、設計が考え付かなかった。

# 調べたポイント
- game.rbにおいて`array.include?`よりも処理が早いため`set.include?`を採用した経緯があり、うっすらと覚えていたので改めて調べた。
- rubyの出入力(gets)のやり方が分からなかったため、調べた。
- 普段、業務ではRspecを使っており、minitestはほとんど使っていないので概要から調べ直した。