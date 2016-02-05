package {
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class DialogueBox extends MovieClip {
		private var _text:String;
		private var _tf:TextField;
		private var _tformat:TextFormat = new TextFormat("Lucida Calligraphy", 14, 0x551a8b);
		private var dBox:Sprite;

		public function DialogueBox(text:String) {
			_text = text;
			addField(_text);
			drawBox();
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		
		private function addedHandler(e:Event):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
		}
		
		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
		}
		
		private function addField(text:String):void {
			_tf = new TextField();
			_tf.defaultTextFormat = _tformat;
			_tf.width = 250;
			_tf.autoSize = 'left';
			_tf.multiline = true;
			_tf.wordWrap = true;
			_tf.selectable = false;
			_tf.text = text;
		}
		
		private function drawBox():void {
			dBox = new Sprite();
			dBox.graphics.beginFill(0xFF8000);
			dBox.graphics.drawRoundRect(0,0,_tf.width,_tf.height, 20);
			dBox.graphics.endFill();
			dBox.addChild(_tf);
			addChild(dBox);
		}
		private function onKeypress(ke:KeyboardEvent):void {
			MovieClip(parent).removeDialogue();
		}
	}
}