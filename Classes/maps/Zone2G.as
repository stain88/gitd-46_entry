package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone2G extends MapLoader {
		private var visited:Boolean = false;
		public var enemy1:Enemy;
		private var eName:String="z2ge1";

		public function Zone2G() {
			super("Zone2G");
			if (SharedObjectManager.getData("z2gv")==null) {SharedObjectManager.setData("z2gv", false);}
			else {visited = SharedObjectManager.getData("z2gv");}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			if (SharedObjectManager.getData(eName)==null) {
				enemy1 = new Enemy(4, 3, 1500, 0.4);
				enemy1.rotation = 180;
				enemy1.addEventListener("dead", killEnemy, false, 0, true);
				SharedObjectManager.setData(eName,[enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			} else {
				if (!SharedObjectManager.getData(eName)[4]) {
					enemy1 = new Enemy(SharedObjectManager.getData(eName)[0], SharedObjectManager.getData(eName)[1], SharedObjectManager.getData(eName)[2], SharedObjectManager.getData(eName)[3]);
					enemy1.addEventListener("dead", killEnemy, false, 0, true);
					MovieClip(parent).enemyList.push(enemy1);
					MovieClip(parent).addChild(enemy1);
				}
			}
		}
		
		override protected function readd(e:Event):void {
			super.readd(e);
			if (!SharedObjectManager.getData(eName)[4]) {
				enemy1 = new Enemy(SharedObjectManager.getData(eName)[0], SharedObjectManager.getData(eName)[1], SharedObjectManager.getData(eName)[2], SharedObjectManager.getData(eName)[3]);
				enemy1.addEventListener("dead", killEnemy, false, 0, true);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			}
		}
		
		private function killEnemy(e:Event):void {
			SharedObjectManager.setData(eName, [0, 0, 0, 0, true]);
			enemy1=null;
		}

		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
			if (enemy1!=null) {SharedObjectManager.setData(eName, [enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);}
		}

		override protected function onKeypress(ke:KeyboardEvent):void {
			super.onKeypress(ke);
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(7,8)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone2D, 7, 1);return;
				}
				if (isFacing(0,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone2H, 12, 4);
				}
			}
		}
	}
}