package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone3J extends MapLoader {
		private var visited:Boolean = false;
		private var chest2:Chest;
		private var enemy1:Enemy, enemy2:Enemy, enemy3:Enemy;

		public function Zone3J() {
			super("Zone3J");
			if (SharedObjectManager.getData("z3jv")==null) {SharedObjectManager.setData("z3jv", false);}
			else {visited = SharedObjectManager.getData("z3jv");}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			if (SharedObjectManager.getData("chest2")==null) {
				chest2 = new Chest();
				chest2.x = 12*32;chest2.y = 4*32;
				SharedObjectManager.setData("chest2",chest2.opened);
			} else {
				chest2 = new Chest();
				chest2.x = 12*32;chest2.y = 4*32;
				chest2.opened = SharedObjectManager.getData("chest2");
				if (SharedObjectManager.getData("chest2")) {addChild(chest2);}
			}
			if (SharedObjectManager.getData("z3je1")==null) {
				enemy1 = new Enemy(12, 3, 1200, 0.5);
				enemy1.rotation = 180;
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				SharedObjectManager.setData("z3je1",[enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			} else {
				if (!SharedObjectManager.getData("z3je1")[4]) {
					enemy1 = new Enemy(SharedObjectManager.getData("z3je1")[0], SharedObjectManager.getData("z3je1")[1], SharedObjectManager.getData("z3je1")[2], SharedObjectManager.getData("z3je1")[3]);
					enemy1.addEventListener("dead", killEnemy1, false, 0, true);
					MovieClip(parent).enemyList.push(enemy1);
					MovieClip(parent).addChild(enemy1);
				}
			}
			if (SharedObjectManager.getData("z3je2")==null) {
				enemy2 = new Enemy(11, 4, 1200, 0.5);
				enemy2.rotation=180;
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				SharedObjectManager.setData("z3je2",[enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			} else {
				if (!SharedObjectManager.getData("z3je2")[4]) {
					enemy2 = new Enemy(SharedObjectManager.getData("z3je2")[0], SharedObjectManager.getData("z3je2")[1], SharedObjectManager.getData("z3je2")[2], SharedObjectManager.getData("z3je2")[3]);
					enemy2.addEventListener("dead", killEnemy2, false, 0, true);
					MovieClip(parent).enemyList.push(enemy2);
					MovieClip(parent).addChild(enemy2);
				}
			}
			if (SharedObjectManager.getData("z3je3")==null) {
				enemy3 = new Enemy(12, 5, 1200, 0.5);
				enemy3.rotation=180;
				enemy3.addEventListener("dead", killEnemy3, false, 0, true);
				SharedObjectManager.setData("z3je3",[enemy3.currentX(), enemy3.currentY(), enemy3.tickLength(), enemy3.atkChance(), enemy3.defeated]);
				MovieClip(parent).enemyList.push(enemy3);
				MovieClip(parent).addChild(enemy3);
			} else {
				if (!SharedObjectManager.getData("z3je3")[4]) {
					enemy3 = new Enemy(SharedObjectManager.getData("z3je3")[0], SharedObjectManager.getData("z3je3")[1], SharedObjectManager.getData("z3je3")[2], SharedObjectManager.getData("z3je3")[3]);
					enemy3.addEventListener("dead", killEnemy3, false, 0, true);
					MovieClip(parent).enemyList.push(enemy3);
					MovieClip(parent).addChild(enemy3);
				}
			}
		}
		
		override protected function readd(e:Event):void {
			super.readd(e);
			if (!SharedObjectManager.getData("z3je1")[4]) {
				enemy1 = new Enemy(SharedObjectManager.getData("z3je1")[0], SharedObjectManager.getData("z3je1")[1], SharedObjectManager.getData("z3je1")[2], SharedObjectManager.getData("z3je1")[3]);
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			}
			if (!SharedObjectManager.getData("z3je2")[4]) {
				enemy2 = new Enemy(SharedObjectManager.getData("z3je2")[0], SharedObjectManager.getData("z3je2")[1], SharedObjectManager.getData("z3je2")[2], SharedObjectManager.getData("z3je2")[3]);
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			}
			if (!SharedObjectManager.getData("z3je3")[4]) {
				enemy3 = new Enemy(SharedObjectManager.getData("z3je3")[0], SharedObjectManager.getData("z3je3")[1], SharedObjectManager.getData("z3je3")[2], SharedObjectManager.getData("z3je3")[3]);
				enemy3.addEventListener("dead", killEnemy3, false, 0, true);
				MovieClip(parent).enemyList.push(enemy3);
				MovieClip(parent).addChild(enemy3);
			}
		}

		private function killEnemy1(e:Event):void {
			SharedObjectManager.setData("z3je1", [0, 0, 0, 0, true]);
			enemy1=null;
		}

		private function killEnemy2(e:Event):void {
			SharedObjectManager.setData("z3je2", [0, 0, 0, 0, true]);
			enemy2=null;
		}

		private function killEnemy3(e:Event):void {
			SharedObjectManager.setData("z3je3", [0, 0, 0, 0, true]);
			enemy3=null;
		}

		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
			if (enemy1!=null) {SharedObjectManager.setData("z3je1", [enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);}
			if (enemy2!=null) {SharedObjectManager.setData("z3je2", [enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);}
			if (enemy3!=null) {SharedObjectManager.setData("z3je3", [enemy3.currentX(), enemy3.currentY(), enemy3.tickLength(), enemy3.atkChance(), enemy3.defeated]);}
		}

		override protected function onKeypress(ke:KeyboardEvent):void {
			super.onKeypress(ke);
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(0,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone3I, 12, 4);return;
				}
				if (isFacing(12,4)) {
					if (!chest2.opened) {SoundManager.play("pickup");}
					chest2.opened = true;
					SharedObjectManager.setData("chest2", true);
					addChild(chest2);
					MovieClip(parent).player.addItem("blueKey",true);					
					(this.parent.parent as MovieClip).addKey("blue");
				}
			}
		}
	}
}