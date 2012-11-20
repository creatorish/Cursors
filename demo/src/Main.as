package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.creatorish.ui.cursor.*;
	import com.creatorish.ui.cursor.plugins.FlexCursors; 
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author yuu
	 */
	public class Main extends Sprite 
	{
		private const SP_SIZE:int = 120;
		private const SP_MARGIN:int = 30;
		private var cursorType:Array = [
			"DEFAULT",
			"POINTER",
			"CROSS_HAIR",
			"HELP",
			"V_RESIZE",
			"H_RESIZE",
			"MOVE",
			"SL_RESIZE",
			"SR_RESIZE",
			"TEXT",
			"WAIT",
			"ZOOM_IN",
			"ZOOM_OUT",
			"HAND",
			"GRIP"
		];
		private var drag:Sprite;
		private var isDrag:Boolean = false;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			Cursors.init(stage);
			FlexCursors.Set();
			
			for (var i:int = 0; i < cursorType.length; i++) {
				var s:Sprite = createSpot(cursorType[i]);
				var j:int = i % 5;
				s.x = (j * SP_SIZE) + (j * SP_MARGIN) + (SP_MARGIN / 2);
				if (i > 5) {
					s.y = SP_SIZE + SP_MARGIN + (SP_MARGIN / 2);
				} else {
					s.y = SP_MARGIN / 2;
				}
				Cursors.addHoverCursor(s, CursorType[cursorType[i]],CursorType.DEFAULT);
				addChild(s);
			}
			drag = createSpot("Drag Me!!");
			drag.x = stage.stageWidth / 2 - SP_SIZE / 2;
			drag.y = (SP_SIZE * 2) + (SP_MARGIN * 2) + (SP_MARGIN / 2);
			Cursors.addButtonCursor(drag, CursorType.HAND, CursorType.GRIP, CursorType.DEFAULT);
			
			drag.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			drag.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			drag.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			drag.addEventListener(MouseEvent.MOUSE_OUT, mouseUpHandler);
			addChild(drag);
		}
		
		private function mouseDownHandler(e:MouseEvent):void {
			isDrag = true;
			drag.x = e.stageX - SP_SIZE / 2;
			drag.y = e.stageY - SP_SIZE / 2;
		}
		private function mouseMoveHandler(e:MouseEvent):void {
			if (isDrag) {
				drag.x = e.stageX - SP_SIZE / 2;
				drag.y = e.stageY - SP_SIZE / 2;
			}
		}
		private function mouseUpHandler(e:MouseEvent):void {
			isDrag = false;
		}
		
		private function createSpot(txt:String):Sprite {
			var s:Sprite = new Sprite();
			var tf:TextFormat = new TextFormat();
			tf.align = TextFormatAlign.CENTER;
			tf.color = 0x333333;
			var t:TextField = new TextField();
			t.text = txt;
			t.width = SP_SIZE;
			t.y = SP_SIZE / 2 - 12;
			t.selectable = false;
			t.defaultTextFormat = tf;
			t.setTextFormat(tf);
			t.mouseEnabled = false;
			s.graphics.beginFill(0xEEEEEE);
			s.graphics.lineStyle(1, 0xCCCCCC);
			s.graphics.drawRect(0, 0, SP_SIZE, SP_SIZE);
			s.graphics.endFill();
			s.addChild(t);
			return s;
		}
	}
	
}