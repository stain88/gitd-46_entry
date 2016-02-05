package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	public class Options extends MovieClip {
		private var currentModifier:String;
		private var invalidText:InvalidText;
		
		public function Options() {
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		
		private function addedHandler(e:Event):void {
			loadOptions();
			backBtn.addEventListener(MouseEvent.CLICK, onClickBack, false, 0, true);
			addListeners();
		}
		
		private function removedHandler(e:Event):void {
			backBtn.removeEventListener(MouseEvent.CLICK, onClickBack);
		}
		
		private function onClickBack(me:MouseEvent):void {
			MovieClip(parent).gotoMain();
		}
		
		private function loadOptions():void {
			moveUp.moveUpKey.text = getKey("moveUpKey");
			moveDown.moveDownKey.text = getKey("moveDownKey");
			moveLeft.moveLeftKey.text = getKey("moveLeftKey");
			moveRight.moveRightKey.text = getKey("moveRightKey");
			action.actionKey.text = getKey("actionKey");
			cancel.cancelKey.text = getKey("cancelKey");
			fire.fireKey.text = getKey("fireKey");
			minimap.minimapKey.text = getKey("minimapKey");
		}
		
		private function getKey(id:String):String {
			var result = SharedObjectManager.getData(id);
			switch (result) {
				case 37:
					return "Left";
				case 38:
					return "Up";
				case 39:
					return "Right";
				case 40:
					return "Down";
				default:
					return String.fromCharCode(result);
			}
		}
		
		private function addListeners():void {
			moveUp.moveUpKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			moveDown.moveDownKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			moveLeft.moveLeftKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			moveRight.moveRightKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			action.actionKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			cancel.cancelKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			fire.fireKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
			minimap.minimapKey.addEventListener(MouseEvent.CLICK, changeKey, false, 0, true);
		}
		
		private function removeListeners():void {
			moveUp.moveUpKey.removeEventListener(MouseEvent.CLICK, changeKey);
			moveDown.moveDownKey.removeEventListener(MouseEvent.CLICK, changeKey);
			moveLeft.moveLeftKey.removeEventListener(MouseEvent.CLICK, changeKey);
			moveRight.moveRightKey.removeEventListener(MouseEvent.CLICK, changeKey);
			action.actionKey.removeEventListener(MouseEvent.CLICK, changeKey);
			cancel.cancelKey.removeEventListener(MouseEvent.CLICK, changeKey);
			fire.fireKey.removeEventListener(MouseEvent.CLICK, changeKey);
			minimap.minimapKey.removeEventListener(MouseEvent.CLICK, changeKey);
		}
		
		private function changeKey(me:MouseEvent):void {
			currentModifier = me.target.name;
			me.target.text = "";
			removeListeners();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyChange, false, 0, true);
		}
		
		private function onKeyChange(ke:KeyboardEvent):void {
			if (checkPossible(ke.keyCode)) {
				SharedObjectManager.setData(currentModifier, ke.keyCode);
			} else {
				invalidChoice();
				SharedObjectManager.setData(currentModifier, SharedObjectManager.getData(currentModifier));
			}
			loadOptions();
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyChange);
			addListeners();
		}
		
		private function checkPossible(it:int):Boolean {
			if ([0,9,13,16,17,27,32,48,49,50,51,52,53,54,55,56,57,112,113,114,115,116,117,118,119,120,121,122,123,186,187,188,189,190,191,219,220,221,222].indexOf(it)!= -1) return false;
			for (var i in SharedObjectManager.so.data) {
				if (SharedObjectManager.getData(i)==it) {
					if (i==currentModifier) {continue;}
					return false;
				}
			}
			return true;
		}
		
		private function invalidChoice():void {
			invalidText = new InvalidText();
			addChild(invalidText);
		}
	}
}