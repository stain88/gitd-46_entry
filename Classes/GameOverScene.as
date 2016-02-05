package {
	import flash.display.*;
	import flash.events.*;
	
	public class GameOverScene extends MovieClip {
		
		public function GameOverScene() {
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		
		private function addedHandler(e:Event):void {
			restart.addEventListener(MouseEvent.CLICK, onClickRestart, false, 0, true);
		}
		
		private function removedHandler(e:Event):void {
			restart.removeEventListener(MouseEvent.CLICK, onClickRestart);
		}
		
		private function onClickRestart(me:MouseEvent):void {
			MovieClip(parent).gotoMain();
		}
	}
	
}
