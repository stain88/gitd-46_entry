package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone4D extends MapLoader {
		private var visited:Boolean = false;
		private var chest3:Chest;
		private var enemy1:Enemy, enemy2:Enemy;
		private var greenKey:GreenKey;

		public function Zone4D() {
			super("Zone4D");
			if (SharedObjectManager.getData("z4dv")==null) {SharedObjectManager.setData("z4dv", false);}
			else {visited = SharedObjectManager.getData("z4dv");}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			if (SharedObjectManager.getData("chest3")==null) {
				chest3 = new Chest();
				chest3.x = 1*32; chest3.y = 7*32;
				SharedObjectManager.setData("chest3",chest3.opened);
			} else {
				chest3 = new Chest();
				chest3.x = 1*32; chest3.y = 7*32;
				chest3.opened = SharedObjectManager.getData("chest3");
				if (SharedObjectManager.getData("chest3")) {addChild(chest3);}
			}
			if (SharedObjectManager.getData("z4de1")==null) {
				enemy1 = new Enemy(1, 6, 1000, 0.5);
				enemy1.rotation = -90;
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				SharedObjectManager.setData("z4de1",[enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			} else {
				if (!SharedObjectManager.getData("z4de1")[4]) {
					enemy1 = new Enemy(SharedObjectManager.getData("z4de1")[0], SharedObjectManager.getData("z4de1")[1], SharedObjectManager.getData("z4de1")[2], SharedObjectManager.getData("z4de1")[3]);
					enemy1.addEventListener("dead", killEnemy1, false, 0, true);
					MovieClip(parent).enemyList.push(enemy1);
					MovieClip(parent).addChild(enemy1);
				}
			}
			if (SharedObjectManager.getData("z4de2")==null) {
				enemy2 = new Enemy(2, 7, 1000, 0.5);
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				SharedObjectManager.setData("z4de2",[enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			} else {
				if (!SharedObjectManager.getData("z4de2")[4]) {
					enemy2 = new Enemy(SharedObjectManager.getData("z4de2")[0], SharedObjectManager.getData("z4de2")[1], SharedObjectManager.getData("z4de2")[2], SharedObjectManager.getData("z4de2")[3]);
					enemy2.addEventListener("dead", killEnemy2, false, 0, true);
					MovieClip(parent).enemyList.push(enemy2);
					MovieClip(parent).addChild(enemy2);
				}
			}
		}
		
		override protected function readd(e:Event):void {
			super.readd(e);
			if (!SharedObjectManager.getData("z4de1")[4]) {
				enemy1 = new Enemy(SharedObjectManager.getData("z4de1")[0], SharedObjectManager.getData("z4de1")[1], SharedObjectManager.getData("z4de1")[2], SharedObjectManager.getData("z4de1")[3]);
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			}
			if (!SharedObjectManager.getData("z4de2")[4]) {
				enemy2 = new Enemy(SharedObjectManager.getData("z4de2")[0], SharedObjectManager.getData("z4de2")[1], SharedObjectManager.getData("z4de2")[2], SharedObjectManager.getData("z4de2")[3]);
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			}
		}

		private function killEnemy1(e:Event):void {
			SharedObjectManager.setData("z4de1", [0, 0, 0, 0, true]);
			enemy1=null;
		}

		private function killEnemy2(e:Event):void {
			SharedObjectManager.setData("z4de2", [0, 0, 0, 0, true]);
			enemy2=null;
		}

		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
			if (enemy1!=null) {SharedObjectManager.setData("z4de1", [enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);}
			if (enemy2!=null) {SharedObjectManager.setData("z4de2", [enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);}
		}

		override protected function onKeypress(ke:KeyboardEvent):void {
			super.onKeypress(ke);
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(7,0)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone4C, 7, 7);return;
				}
				if (isFacing(1,7)) {
					if (!chest3.opened) {SoundManager.play("pickup");}
					chest3.opened = true;
					SharedObjectManager.setData("chest3", true);
					addChild(chest3);
					MovieClip(parent).player.addItem("greenKey",true);
					(this.parent.parent as MovieClip).addKey("green");
				}
			}
		}
	}
}