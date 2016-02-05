package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone1C extends MapLoader {
		private var visited:Boolean = false;
		private var zName:String="z1c";

		public function Zone1C() {
			super("Zone1C");
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
			super.onKeypress(ke);
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(6,3)) {
					(this.parent.parent as MovieClip).addDialogue(Signposts.intro3());return;
				}
				if (isFacing(0,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone1B, 12,4);return;
				}
				if (isFacing(13,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone1D, 1,4);
				}
			}
		}
	}
}