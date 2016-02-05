package maps {
	import flash.display.*;
	import flash.events.*;
	
	public class Zone5 extends MapLoader {
		private var visited:Boolean = false;
		private var chest4:Chest;
		private var enemy1:Enemy, enemy2:Enemy, enemy3:Enemy, enemy4:Enemy, enemy5:Enemy, enemy6:Enemy,
					enemy7:Enemy, enemy8:Enemy;

		public function Zone5() {
			super("Zone5");
			if (SharedObjectManager.getData("z5v")==null) {SharedObjectManager.setData("z5v", false);}
			else {visited = SharedObjectManager.getData("z5v");}
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		override protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			super.addedHandler(e);
			if (SharedObjectManager.getData("chest4")==null) {
				chest4 = new Chest(); chest4.x=11*32; chest4.y=4*32;
				SharedObjectManager.setData("chest4",chest4.opened);
			} else {
				chest4 = new Chest(); chest4.x=11*32; chest4.y=4*32;
				if (SharedObjectManager.getData("chest4")) {addChild(chest4);}
			}
			if (SharedObjectManager.getData("z5e1")==null) {
				enemy1 = new Enemy(10, 3, 800, 0.6); enemy1.rotation = 180;
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				SharedObjectManager.setData("z5e1",[enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);
				MovieClip(parent).enemyList.push(enemy1); MovieClip(parent).addChild(enemy1);
			} else {
				if (!SharedObjectManager.getData("z5e1")[4]) {
					enemy1 = new Enemy(SharedObjectManager.getData("z5e1")[0], SharedObjectManager.getData("z5e1")[1], SharedObjectManager.getData("z5e1")[2], SharedObjectManager.getData("z5e1")[3]);
					enemy1.addEventListener("dead", killEnemy1, false, 0, true);
					MovieClip(parent).enemyList.push(enemy1); MovieClip(parent).addChild(enemy1);
				}
			}
			if (SharedObjectManager.getData("z5e2")==null) {
				enemy2 = new Enemy(10, 4, 800, 0.6); enemy2.rotation = 180;
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				SharedObjectManager.setData("z5e2",[enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);
				MovieClip(parent).enemyList.push(enemy2); MovieClip(parent).addChild(enemy2);
			} else {
				if (!SharedObjectManager.getData("z5e2")[4]) {
					enemy2 = new Enemy(SharedObjectManager.getData("z5e2")[0], SharedObjectManager.getData("z5e2")[1], SharedObjectManager.getData("z5e2")[2], SharedObjectManager.getData("z5e2")[3]);
					enemy2.addEventListener("dead", killEnemy2, false, 0, true);
					MovieClip(parent).enemyList.push(enemy2); MovieClip(parent).addChild(enemy2);
				}
			}
			if (SharedObjectManager.getData("z5e3")==null) {
				enemy3 = new Enemy(10, 5, 800, 0.6); enemy3.rotation = 180;
				enemy3.addEventListener("dead", killEnemy3, false, 0, true);
				SharedObjectManager.setData("z5e3",[enemy3.currentX(), enemy3.currentY(), enemy3.tickLength(), enemy3.atkChance(), enemy3.defeated]);
				MovieClip(parent).enemyList.push(enemy3); MovieClip(parent).addChild(enemy3);
			} else {
				if (!SharedObjectManager.getData("z5e3")[4]) {
					enemy3 = new Enemy(SharedObjectManager.getData("z5e3")[0], SharedObjectManager.getData("z5e3")[1], SharedObjectManager.getData("z5e3")[2], SharedObjectManager.getData("z5e3")[3]);
					enemy3.addEventListener("dead", killEnemy3, false, 0, true);
					MovieClip(parent).enemyList.push(enemy3); MovieClip(parent).addChild(enemy3);
				}
			}
			if (SharedObjectManager.getData("z5e4")==null) {
				enemy4 = new Enemy(11, 3, 800, 0.6); enemy4.rotation = 180;
				enemy4.addEventListener("dead", killEnemy4, false, 0, true);
				SharedObjectManager.setData("z5e4",[enemy4.currentX(), enemy4.currentY(), enemy4.tickLength(), enemy4.atkChance(), enemy4.defeated]);
				MovieClip(parent).enemyList.push(enemy4); MovieClip(parent).addChild(enemy4);
			} else {
				if (!SharedObjectManager.getData("z5e4")[4]) {
					enemy4 = new Enemy(SharedObjectManager.getData("z5e4")[0], SharedObjectManager.getData("z5e4")[1], SharedObjectManager.getData("z5e4")[2], SharedObjectManager.getData("z5e4")[3]);
					enemy4.addEventListener("dead", killEnemy4, false, 0, true);
					MovieClip(parent).enemyList.push(enemy4); MovieClip(parent).addChild(enemy4);
				}
			}
			if (SharedObjectManager.getData("z5e5")==null) {
				enemy5 = new Enemy(11, 5, 800, 0.6); enemy5.rotation = 180;
				enemy5.addEventListener("dead", killEnemy5, false, 0, true);
				SharedObjectManager.setData("z5e5",[enemy5.currentX(), enemy5.currentY(), enemy5.tickLength(), enemy5.atkChance(), enemy5.defeated]);
				MovieClip(parent).enemyList.push(enemy5); MovieClip(parent).addChild(enemy5);
			} else {
				if (!SharedObjectManager.getData("z5e5")[4]) {
					enemy5 = new Enemy(SharedObjectManager.getData("z5e5")[0], SharedObjectManager.getData("z5e5")[1], SharedObjectManager.getData("z5e5")[2], SharedObjectManager.getData("z5e5")[3]);
					enemy5.addEventListener("dead", killEnemy5, false, 0, true);
					MovieClip(parent).enemyList.push(enemy5); MovieClip(parent).addChild(enemy5);
				}
			}
			if (SharedObjectManager.getData("z5e6")==null) {
				enemy6 = new Enemy(12, 3, 800, 0.6); enemy6.rotation = 180;
				enemy6.addEventListener("dead", killEnemy6, false, 0, true);
				SharedObjectManager.setData("z5e6",[enemy6.currentX(), enemy6.currentY(), enemy6.tickLength(), enemy6.atkChance(), enemy6.defeated]);
				MovieClip(parent).enemyList.push(enemy6); MovieClip(parent).addChild(enemy6);
			} else {
				if (!SharedObjectManager.getData("z5e6")[4]) {
					enemy6 = new Enemy(SharedObjectManager.getData("z5e6")[0], SharedObjectManager.getData("z5e6")[1], SharedObjectManager.getData("z5e6")[2], SharedObjectManager.getData("z5e6")[3]);
					enemy6.addEventListener("dead", killEnemy6, false, 0, true);
					MovieClip(parent).enemyList.push(enemy6); MovieClip(parent).addChild(enemy6);
				}
			}
			if (SharedObjectManager.getData("z5e7")==null) {
				enemy7 = new Enemy(12, 4, 800, 0.6); enemy7.rotation = 180;
				enemy7.addEventListener("dead", killEnemy7, false, 0, true);
				SharedObjectManager.setData("z5e7",[enemy7.currentX(), enemy7.currentY(), enemy7.tickLength(), enemy7.atkChance(), enemy7.defeated]);
				MovieClip(parent).enemyList.push(enemy7); MovieClip(parent).addChild(enemy7);
			} else {
				if (!SharedObjectManager.getData("z5e7")[4]) {
					enemy7 = new Enemy(SharedObjectManager.getData("z5e7")[0], SharedObjectManager.getData("z5e7")[1], SharedObjectManager.getData("z5e7")[2], SharedObjectManager.getData("z5e7")[3]);
					enemy7.addEventListener("dead", killEnemy7, false, 0, true);
					MovieClip(parent).enemyList.push(enemy7); MovieClip(parent).addChild(enemy7);
				}
			}
			if (SharedObjectManager.getData("z5e8")==null) {
				enemy8 = new Enemy(12, 5, 800, 0.6); enemy8.rotation = 180;
				enemy8.addEventListener("dead", killEnemy8, false, 0, true);
				SharedObjectManager.setData("z5e8",[enemy8.currentX(), enemy8.currentY(), enemy8.tickLength(), enemy8.atkChance(), enemy8.defeated]);
				MovieClip(parent).enemyList.push(enemy8); MovieClip(parent).addChild(enemy8);
			} else {
				if (!SharedObjectManager.getData("z5e8")[4]) {
					enemy8 = new Enemy(SharedObjectManager.getData("z5e8")[0], SharedObjectManager.getData("z5e8")[1], SharedObjectManager.getData("z5e8")[2], SharedObjectManager.getData("z5e8")[3]);
					enemy8.addEventListener("dead", killEnemy8, false, 0, true);
					MovieClip(parent).enemyList.push(enemy8); MovieClip(parent).addChild(enemy8);
				}
			}
		}
		
		override protected function readd(e:Event):void {
			super.readd(e);
			if (!SharedObjectManager.getData("z5e1")[4]) {
				enemy1 = new Enemy(SharedObjectManager.getData("z5e1")[0], SharedObjectManager.getData("z5e1")[1], SharedObjectManager.getData("z5e1")[2], SharedObjectManager.getData("z5e1")[3]);
				enemy1.addEventListener("dead", killEnemy1, false, 0, true);
				MovieClip(parent).enemyList.push(enemy1);
				MovieClip(parent).addChild(enemy1);
			}
			if (!SharedObjectManager.getData("z5e2")[4]) {
				enemy2 = new Enemy(SharedObjectManager.getData("z5e2")[0], SharedObjectManager.getData("z5e2")[1], SharedObjectManager.getData("z5e2")[2], SharedObjectManager.getData("z5e2")[3]);
				enemy2.addEventListener("dead", killEnemy2, false, 0, true);
				MovieClip(parent).enemyList.push(enemy2);
				MovieClip(parent).addChild(enemy2);
			}
			if (!SharedObjectManager.getData("z5e3")[4]) {
				enemy3 = new Enemy(SharedObjectManager.getData("z5e3")[0], SharedObjectManager.getData("z5e3")[1], SharedObjectManager.getData("z5e3")[2], SharedObjectManager.getData("z5e3")[3]);
				enemy3.addEventListener("dead", killEnemy3, false, 0, true);
				MovieClip(parent).enemyList.push(enemy3);
				MovieClip(parent).addChild(enemy3);
			}
			if (!SharedObjectManager.getData("z5e4")[4]) {
				enemy4 = new Enemy(SharedObjectManager.getData("z5e4")[0], SharedObjectManager.getData("z5e4")[1], SharedObjectManager.getData("z5e4")[2], SharedObjectManager.getData("z5e4")[3]);
				enemy4.addEventListener("dead", killEnemy4, false, 0, true);
				MovieClip(parent).enemyList.push(enemy4);
				MovieClip(parent).addChild(enemy4);
			}
			if (!SharedObjectManager.getData("z5e5")[4]) {
				enemy5 = new Enemy(SharedObjectManager.getData("z5e5")[0], SharedObjectManager.getData("z5e5")[1], SharedObjectManager.getData("z5e5")[2], SharedObjectManager.getData("z5e5")[3]);
				enemy5.addEventListener("dead", killEnemy5, false, 0, true);
				MovieClip(parent).enemyList.push(enemy5);
				MovieClip(parent).addChild(enemy5);
			}
			if (!SharedObjectManager.getData("z5e6")[4]) {
				enemy6 = new Enemy(SharedObjectManager.getData("z5e6")[0], SharedObjectManager.getData("z5e6")[1], SharedObjectManager.getData("z5e6")[2], SharedObjectManager.getData("z5e6")[3]);
				enemy6.addEventListener("dead", killEnemy6, false, 0, true);
				MovieClip(parent).enemyList.push(enemy6);
				MovieClip(parent).addChild(enemy6);
			}
			if (!SharedObjectManager.getData("z5e7")[4]) {
				enemy7 = new Enemy(SharedObjectManager.getData("z5e7")[0], SharedObjectManager.getData("z5e7")[1], SharedObjectManager.getData("z5e7")[2], SharedObjectManager.getData("z5e7")[3]);
				enemy7.addEventListener("dead", killEnemy7, false, 0, true);
				MovieClip(parent).enemyList.push(enemy7);
				MovieClip(parent).addChild(enemy7);
			}
			if (!SharedObjectManager.getData("z5e8")[4]) {
				enemy8 = new Enemy(SharedObjectManager.getData("z5e8")[0], SharedObjectManager.getData("z5e8")[1], SharedObjectManager.getData("z5e8")[2], SharedObjectManager.getData("z5e8")[3]);
				enemy8.addEventListener("dead", killEnemy8, false, 0, true);
				MovieClip(parent).enemyList.push(enemy8);
				MovieClip(parent).addChild(enemy8);
			}
		}

		private function killEnemy1(e:Event):void {
			SharedObjectManager.setData("z5e1", [0, 0, 0, 0, true]);
			enemy1=null;
		}

		private function killEnemy2(e:Event):void {
			SharedObjectManager.setData("z5e2", [0, 0, 0, 0, true]);
			enemy2=null;
		}

		private function killEnemy3(e:Event):void {
			SharedObjectManager.setData("z5e3", [0, 0, 0, 0, true]);
			enemy3=null;
		}

		private function killEnemy4(e:Event):void {
			SharedObjectManager.setData("z5e4", [0, 0, 0, 0, true]);
			enemy4=null;
		}

		private function killEnemy5(e:Event):void {
			SharedObjectManager.setData("z5e5", [0, 0, 0, 0, true]);
			enemy5=null;
		}

		private function killEnemy6(e:Event):void {
			SharedObjectManager.setData("z5e6", [0, 0, 0, 0, true]);
			enemy6=null;
		}

		private function killEnemy7(e:Event):void {
			SharedObjectManager.setData("z5e7", [0, 0, 0, 0, true]);
			enemy7=null;
		}

		private function killEnemy8(e:Event):void {
			SharedObjectManager.setData("z5e8", [0, 0, 0, 0, true]);
			enemy8=null;
		}

		private function removedHandler(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeypress);
			if (enemy1!=null) {SharedObjectManager.setData("z5e1", [enemy1.currentX(), enemy1.currentY(), enemy1.tickLength(), enemy1.atkChance(), enemy1.defeated]);}
			if (enemy2!=null) {SharedObjectManager.setData("z5e2", [enemy2.currentX(), enemy2.currentY(), enemy2.tickLength(), enemy2.atkChance(), enemy2.defeated]);}
			if (enemy3!=null) {SharedObjectManager.setData("z5e3", [enemy3.currentX(), enemy3.currentY(), enemy3.tickLength(), enemy3.atkChance(), enemy3.defeated]);}
			if (enemy4!=null) {SharedObjectManager.setData("z5e4", [enemy4.currentX(), enemy4.currentY(), enemy4.tickLength(), enemy4.atkChance(), enemy4.defeated]);}
			if (enemy5!=null) {SharedObjectManager.setData("z5e5", [enemy5.currentX(), enemy5.currentY(), enemy5.tickLength(), enemy5.atkChance(), enemy5.defeated]);}
			if (enemy6!=null) {SharedObjectManager.setData("z5e6", [enemy6.currentX(), enemy6.currentY(), enemy6.tickLength(), enemy6.atkChance(), enemy6.defeated]);}
			if (enemy7!=null) {SharedObjectManager.setData("z5e7", [enemy7.currentX(), enemy7.currentY(), enemy7.tickLength(), enemy7.atkChance(), enemy7.defeated]);}
			if (enemy8!=null) {SharedObjectManager.setData("z5e8", [enemy8.currentX(), enemy8.currentY(), enemy8.tickLength(), enemy8.atkChance(), enemy8.defeated]);}
		}

		override protected function onKeypress(ke:KeyboardEvent):void {
			super.onKeypress(ke);
			if (ke.keyCode==SharedObjectManager.getData("actionKey")) {
				if (isFacing(0,4)) {
					MovieClip(parent).transitionTo(MovieClip(parent).zone4F, 12, 4);return;
				}
				if (isFacing(11,4)) {
					if (!chest4.opened) {SoundManager.play("pickup");}
					chest4.opened = true;
					SharedObjectManager.setData("chest4", true);
					addChild(chest4);
					MovieClip(parent).player.addItem("Water Gem",true);
					(this.parent.parent as MovieClip).addCrystal();
				}
				if (isFacing(13,4)&&MovieClip(parent).player.getItem("Water Gem")) {
					(this.parent.parent.parent as MovieClip).gotoWin();
				}
			}
		}
	}
}