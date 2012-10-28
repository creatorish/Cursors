Cursors.as
======================
AS3でカーソル機能を拡張するライブラリ

デモ
------
http://dev.creatorish.com/demo/bangojs/

使い方
------

### 初期化 ###
ファイルをインポートし、初期化します。初期化にはStageを引数として渡します。

    import com.creatorish.ui.cursor.*;
    Cursors.init(stage);

### カーソルの設定 ###

様々なケースに対応するため、初期ではカーソルが何一つ入っていません。  
そのため、デフォルトの15種類のカーソルを使うためにプラグインを実行する必要があります。

    import net.lifebird.ui.cursor.plugins.*; 
    //Flexの場合
    FlexCursors.Set(); 
    //CSの場合
    CSCursors.Set();

※CSでの使うためには同梱されているflaファイルのライブラリからカーソルをコピーする必要があります。

1.同梱されているcursor.flaを開きます。
2.ウィンドウ＞ライブラリを開きます。
3.「cursor」のフォルダごと、使用したいflaファイルへコピーします。

pluginsディレクトリにあるasファイルを参考にカーソルの内容をカスタマイズすることで、  
オリジナルを含めたよく使うカーソルを簡単に設定できるようになります。

### カーソルを変更する ###

    //カーソルをハンドカーソルへ変更します
    Cursors.cursor(CursorType.HAND);

### カーソルの種類 ###

+    DEFAULT: デフォルトカーソル
+    POINTER: ポインター（指カーソル）
+    CROSS_HAIR: 十字カーソル
+    HELP: ヘルプカーソル
+    V_RESIZE: 縦リサイズカーソル
+    H_RESIZE: 横リサイズカーソル
+    MOVE: ムーブカーソル（十字矢印カーソル）
+    SL_RESIZE: 左斜めのリサイズカーソル
+    SR_RESIZE: 右斜めのリサイズカーソル
+    TEXT: テキストカーソル
+    WAIT: ウェイトカーソル（砂時計カーソル）
+    ZOOM_IN: ズームインカーソル
+    ZOOM_OUT: ズームアウトカーソル
+    HAND: ハンドカーソル
+    GRIP: 握る（つかむ）ハンドカーソル

### オリジナルのカーソルを追加する ###

    //オリジナルのカーソルを追加します。 
    Cursors.addCursor("myCursor",カーソルにするDisplayObject,CursorPosition.CENTER); 
    //カーソルを追加したオリジナルにします。
    Cursors.cursor("myCursor");

### カーソルポジション ###

カーソルの基準点はCursorPositionに定数として定義済みです。

+    TOP_LEFT: 左上
+    TOP: 上中央
+    TOP_RIGHT: 左上
+    CENTER_LEFT: 中央左
+    CENTER: 中央
+    CENTER_RIGHT: 中央右
+    BOTTOM_LEFT: 左下
+    BOTTOM: 下中央
+    BOTTOM_RIGHT: 右下

### 簡単イベント関数 ###

マウスオーバー・アウト時のカーソルを一括設定

    //targetObjectマウスオーバー時にポインター、マウスアウト時にデフォルトのカーソルに変更します。 
    Cursors.addHoverCursor(targetObject, CursorType.POINTER,CursorType.DEFAULT);

マウスオーバー・アウト・ダウン時のカーソルを一括設定

    //targetObjectマウスオーバー・マウスアップ時にハンドカーソルに 
    //マウスダウン時にグリップカーソル、マウスアウト時にデフォルトカーソルに変更します。 
    Cursors.addButtonCursor(targetObject, CursorType.HAND, CursorType.GRIP, CursorType.DEFAULT);

ドラッグ用のカーソルを一括設定。ドラッグアウトしたときもカーソルをキープ。

    //targetObjectマウスオーバー・マウスアップ時にハンドカーソルに
    //マウスダウン時にグリップカーソル、マウスアウト時にデフォルトカーソルに変更します。
    Cursors.addButtonCursor(targetObject, CursorType.HAND, CursorType.GRIP, CursorType.DEFAULT);

すべてのカーソル設定を無視して、設定したカーソルへ変更

    //カーソルを絶対的にウェイトカーソルに変更します。 
    //clickableをfalseにするとクリックイベントを無効化します。 
    Cursors.absolute(CursorType.WAIT,false);

ライセンス
--------
[MIT]: http://www.opensource.org/licenses/mit-license.php
Copyright &copy; 2012 creatorish.com
Distributed under the [MIT License][mit].

作者
--------
creatorish yuu  
Weblog: <http://creatorish.com>  
Facebook: <http://facebook.com/creatorish>  
Twitter: <http://twitter.jp/creatorish>