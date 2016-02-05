package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone1D extends MapLoader {
		private var visited:Boolean = false;
		private var zName:String = "z1d";

		public function Zone1D() {
			super("Zone1D");
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
				if (isFacing(0,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone1C, 12, 4);return;
				}
				if (isFacing(7,0)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone2A, 7, 7);return;
				}
				if (isFacing(6,7)) {
					(this.parent.parent as MovieClip).addDialogue(Signposts.intro4());
				}
				if (isFacing(7,8)&&MovieClip(parent).player.getItem("blueKey")) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone4A, 7, 1);
				}
			}
		}
	}
}