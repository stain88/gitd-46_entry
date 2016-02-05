package {
	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	
	public class GameScreen extends MovieClip {
		private var mapScreen:MapScreen;
		private var isDialogue:Boolean = false;
		private var dialogue:DialogueBox;
		private var redKey:RedKey;
		private var blueKey:BlueKey;
		private var greenKey:GreenKey;
		private var crystal:Crystal;
		
		public function GameScreen() {
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
			addEventListener(Event.ENTER_FRAME, frameHandler);
		}
		
		private function addedHandler(e:Event):void {
			mapScreen = new MapScreen();
			mapScreen.x = 96;mapScreen.y = 96;
			addChild(mapScreen);
			stage.focus = mapScreen;
		}
		
		private function removedHandler(e:Event):void {
			
		}
		
		private function frameHandler(e:Event):void {
			if (mapScreen) {
				if (isDialogue) {
					mapScreen.locked=true;
				} else {
					mapScreen.locked=false;
				}
			}
		}
		
		public function addDialogue(text:String):void {
			isDialogue = true;
			dialogue = new DialogueBox(text);
			dialogue.x = 200;
			dialogue.y = 40;
			this.addChild(dialogue);
		}
		
		public function addKey(colour:String):void {
			switch(colour) {
				case "red":
					redKey = new RedKey();
					redKey.x = 20; redKey.y = 400;
					addChild(redKey);
					break;
				case "blue":
					blueKey = new BlueKey();
					blueKey.x = 70; blueKey.y = 400;
					addChild(blueKey);
					break;
				case "green":
					greenKey = new GreenKey();
					greenKey.x = 120; greenKey.y = 400;
					addChild(greenKey);
					break;
			}
		}
		
		public function addCrystal():void {
			crystal = new Crystal();
			crystal.x = 170; crystal.y = 400;
			addChild(crystal);
		}
		
		public function removeDialogue():void {
			removeChild(dialogue);
			isDialogue = false;
		}
		
		private function onKeypress(ke:KeyboardEvent):void {
			if (ke.keyCode==SharedObjectManager.getData("cancelKey")) {isDialogue=false;}
		}
	}
	
}
