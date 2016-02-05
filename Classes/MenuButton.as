package {
	import flash.display.*;
	import flash.text.*;
	
	public class MenuButton extends Sprite {
		private var textFormat:TextFormat = new TextFormat("Lucida Calligraphy", 18, 0x551a8b);
		private var menuButton:Sprite;
		private var textField:TextField;

		public function MenuButton(btnName:String) {
			defineField(btnName);
			defineButton();
			addChild(menuButton);
		}
		
		private function defineField(btnName:String):void {
			textField = new TextField();
			textField.defaultTextFormat = textFormat;
			textField.autoSize = "left";
			textField.text = btnName;
			textField.selectable = false;
		}
		
		private function defineButton():void {
			menuButton = new Sprite();
			menuButton.graphics.beginFill(0xFFFFFF);
			menuButton.graphics.drawRect(0, 0, textField.width, textField.height);
			menuButton.graphics.endFill();
			menuButton.addChild(textField);
		}

	}
	
}
