package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone3C extends MapLoader {
		private var visited:Boolean = false;

		public function Zone3C() {
			super("Zone3C");
			if (SharedObjectManager.getData("z3cv")==null) {SharedObjectManager.setData("z3cv", false);}
			else {visited = SharedObjectManager.getData("z3cv");}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
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
				if (isFacing(7,8)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone3B, 7, 1);return;
				}
				if (isFacing(6,3)) {
					(this.parent.parent as MovieClip).addDialogue(Signposts.zone3c());return;
				}
			}
		}
	}
}