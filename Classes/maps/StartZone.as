package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class StartZone extends MapLoader {
		private var visited:Boolean = false;
		private var zName:String = "sz";
		public var startPoint:Array = [2,4];

		public function StartZone() {
			super("StartZone");
			if (SharedObjectManager.getData(zName)==null) {SharedObjectManager.setData(zName,true);}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			if (!visited) {
				(this.parent.parent as MovieClip).addDialogue(Signposts.intro());
			}
			visited = SharedObjectManager.getData(zName);
		}
		
		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
		}
		
		override protected function onKeypress(ke:KeyboardEvent):void {
			if (MovieClip(parent).locked) return;
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(6,3)) {
					(this.parent.parent as MovieClip).addDialogue(Signposts.intro());return;
				}
				if (isFacing(13,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone1A, 1, 4);
				}
			}
		}
	}
}