package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone2I extends MapLoader {
		private var visited:Boolean = false;
		private var chest1:Chest;
		private var enemy1:Enemy, enemy2:Enemy, enemy3:Enemy;

		public function Zone2I() {
			super("Zone2I");
			if (SharedObjectManager.getData("z2iv")==null) {SharedObjectManager.setData("z2iv", false);}
			else {visited = SharedObjectManager.getData("z2iv");}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			if (SharedObjectManager.getData("chest1")==null) {
				chest1 = new Chest();
				chest1.x = 1*32;chest1.y = 4*32;
				SharedObjectManager.setData("chest1", chest1.opened);
			} else {
				chest1 = new Chest();
				chest1.x = 1*32;chest1.y = 4*32;
				chest1.opened = SharedObjectManager.getData("chest1");
				if (SharedObjectManager.getData("chest1")) {addChild(chest1);}
			}
			if (SharedObjectManager.getData("z2ie1")==null) {
				enemy1 = new Enemy(1, 3, 1200, 0.5);
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				SharedObjectManager.setData("z2ie1",[enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			} else {
				if (!SharedObjectManager.getData("z2ie1")[4]) {
					enemy1 = new Enemy(SharedObjectManager.getData("z2ie1")[0], SharedObjectManager.getData("z2ie1")[1], SharedObjectManager.getData("z2ie1")[2], SharedObjectManager.getData("z2ie1")[3]);
					enemy1.addEventListener("dead", killEnemy1, false, 0, true);
					MovieClip(parent).enemyList.push(enemy1);
					MovieClip(parent).addChild(enemy1);
				}
			}
			if (SharedObjectManager.getData("z2ie2")==null) {
				enemy2 = new Enemy(2, 4, 1200, 0.5);
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				SharedObjectManager.setData("z2ie2",[enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			} else {
				if (!SharedObjectManager.getData("z2ie2")[4]) {
					enemy2 = new Enemy(SharedObjectManager.getData("z2ie2")[0], SharedObjectManager.getData("z2ie2")[1], SharedObjectManager.getData("z2ie2")[2], SharedObjectManager.getData("z2ie2")[3]);
					enemy2.addEventListener("dead", killEnemy2, false, 0, true);
					MovieClip(parent).enemyList.push(enemy2);
					MovieClip(parent).addChild(enemy2);
				}
			}
			if (SharedObjectManager.getData("z2ie3")==null) {
				enemy3 = new Enemy(1, 5, 1200, 0.5);
				enemy3.addEventListener("dead", killEnemy3, false, 0, true);
				SharedObjectManager.setData("z2ie3",[enemy3.currentX(), enemy3.currentY(), enemy3.tickLength(), enemy3.atkChance(), enemy3.defeated]);
				MovieClip(parent).enemyList.push(enemy3);
				MovieClip(parent).addChild(enemy3);
			} else {
				if (!SharedObjectManager.getData("z2ie3")[4]) {
					enemy3 = new Enemy(SharedObjectManager.getData("z2ie3")[0], SharedObjectManager.getData("z2ie3")[1], SharedObjectManager.getData("z2ie3")[2], SharedObjectManager.getData("z2ie3")[3]);
					enemy3.addEventListener("dead", killEnemy3, false, 0, true);
					MovieClip(parent).enemyList.push(enemy3);
					MovieClip(parent).addChild(enemy3);
				}
			}
		}
		
		override protected function readd(e:Event):void {
			super.readd(e);
			if (!SharedObjectManager.getData("z2ie1")[4]) {
				enemy1 = new Enemy(SharedObjectManager.getData("z2ie1")[0], SharedObjectManager.getData("z2ie1")[1], SharedObjectManager.getData("z2ie1")[2], SharedObjectManager.getData("z2ie1")[3]);
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			}
			if (!SharedObjectManager.getData("z2ie2")[4]) {
				enemy2 = new Enemy(SharedObjectManager.getData("z2ie2")[0], SharedObjectManager.getData("z2ie2")[1], SharedObjectManager.getData("z2ie2")[2], SharedObjectManager.getData("z2ie2")[3]);
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			}
			if (!SharedObjectManager.getData("z2ie3")[4]) {
				enemy3 = new Enemy(SharedObjectManager.getData("z2ie3")[0], SharedObjectManager.getData("z2ie3")[1], SharedObjectManager.getData("z2ie3")[2], SharedObjectManager.getData("z2ie3")[3]);
				enemy3.addEventListener("dead", killEnemy3, false, 0, true);
				MovieClip(parent).enemyList.push(enemy3);
				MovieClip(parent).addChild(enemy3);
			}
		}
		
		private function killEnemy1(e:Event):void {
			SharedObjectManager.setData("z2ie1", [0, 0, 0, 0, true]);
			enemy1=null;
		}

		private function killEnemy2(e:Event):void {
			SharedObjectManager.setData("z2ie2", [0, 0, 0, 0, true]);
			enemy2=null;
		}

		private function killEnemy3(e:Event):void {
			SharedObjectManager.setData("z2ie3", [0, 0, 0, 0, true]);
			enemy3=null;
		}

		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
			if (enemy1!=null) {SharedObjectManager.setData("z2ie1", [enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);}
			if (enemy2!=null) {SharedObjectManager.setData("z2ie2", [enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);}
			if (enemy3!=null) {SharedObjectManager.setData("z2ie3", [enemy3.currentX(), enemy3.currentY(), enemy3.tickLength(), enemy3.atkChance(), enemy3.defeated]);}
		}

		override protected function onKeypress(ke:KeyboardEvent):void {
			super.onKeypress(ke);
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(13,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone2H, 1, 4);return;
				}
				if (isFacing(7,8)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone2F, 7, 1);return;
				}
				if (isFacing(1,4)) {
					if (!chest1.opened) {SoundManager.play("pickup");}
					chest1.opened = true;
					SharedObjectManager.setData("chest1", true);
					addChild(chest1);
					MovieClip(parent).player.addItem("redKey",true);
					(this.parent.parent as MovieClip).addKey("red");
				}
			}
		}
	}
}