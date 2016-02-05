package  {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	public class MainMenu extends MovieClip {
		
		public function MainMenu() {
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		
		private function addedHandler(e:Event):void {
			SharedObjectManager.setData("init",1);
			startBtn.addEventListener(MouseEvent.CLICK, onClickStart, false, 0, true);
			optionsBtn.addEventListener(MouseEvent.CLICK, onClickOptions, false, 0, true);
			clearBtn.addEventListener(MouseEvent.CLICK, onClickClear, false, 0, true);
		}
		
		private function removedHandler(e:Event):void {
			startBtn.removeEventListener(MouseEvent.CLICK, onClickStart);
			optionsBtn.removeEventListener(MouseEvent.CLICK, onClickOptions);
			clearBtn.removeEventListener(MouseEvent.CLICK, onClickClear);
		}
		
		private function onClickStart(me:MouseEvent):void {
			MovieClip(parent).gotoGame();
		}
		
		private function onClickOptions(me:MouseEvent):void {
			MovieClip(parent).gotoOptions();
		}
		
		private function onClickClear(me:MouseEvent):void {
			SharedObjectManager.destroy();
			runConfig();
		}
		
		private function runConfig():void {
			SharedObjectManager.setData("moveUpKey", Keyboard.W);
			SharedObjectManager.setData("moveDownKey", Keyboard.S);
			SharedObjectManager.setData("moveLeftKey", Keyboard.A);
			SharedObjectManager.setData("moveRightKey", Keyboard.D);
			SharedObjectManager.setData("minimapKey", Keyboard.M);
			SharedObjectManager.setData("fireKey", Keyboard.J);
			SharedObjectManager.setData("actionKey", Keyboard.U);
			SharedObjectManager.setData("cancelKey", Keyboard.K);
		}
	}
	
}
