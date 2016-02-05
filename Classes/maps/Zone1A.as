package maps {
	import flash.events.*;
	import flash.display.*;
	
	public class Zone1A extends MapLoader {
		private var visited:Boolean = false;
		private var zName:String = "z1a";

		public function Zone1A() {
			super("Zone1A");
			if (SharedObjectManager.getData(zName)==null) {SharedObjectManager.setData(zName, false);}
			else {visited = SharedObjectManager.getData(zName);}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			visited = true;
			SharedObjectManager.setData(zName, visited);
		}
		
		override protected function readd(e:Event):void {
			super.readd(e);
		}
		
		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
		}
		
		override protected function onKeypress(ke:KeyboardEvent):void {
			if (MovieClip(parent).locked) return;
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(6,3)) {
					(this.parent.parent as MovieClip).addDialogue(Signposts.intro2());return;
				}
				if (isFacing(0,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).startZone, 12, 4);return;
				}
				if (isFacing(13,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone1B, 1, 4);
				}
			}
		}
	}
}