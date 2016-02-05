package {
	import flash.display.*;
	import flash.events.*;
	import maps.*;
	
	public class MapScreen extends MovieClip {
		public var startZone:StartZone;
		public var zone1A:Zone1A, zone1B:Zone1B, zone1C:Zone1C, zone1D:Zone1D;
		public var zone2A:Zone2A, zone2B:Zone2B, zone2C:Zone2C, zone2D:Zone2D, zone2E:Zone2E, zone2F:Zone2F,
					zone2G:Zone2G, zone2H:Zone2H, zone2I:Zone2I;
		public var zone3A:Zone3A, zone3B:Zone3B, zone3C:Zone3C, zone3D:Zone3D, zone3E:Zone3E, zone3F:Zone3F,
					zone3G:Zone3G, zone3H:Zone3H, zone3I:Zone3I, zone3J:Zone3J;
		public var zone4A:Zone4A, zone4B:Zone4B, zone4C:Zone4C, zone4D:Zone4D, zone4E:Zone4E, zone4F:Zone4F;
		public var zone5:Zone5;
		
		public var currentZone:MovieClip;
		private var nextZone:MovieClip;
		private var transScreen:TransitionScreen;
		
		private var transitioning:Boolean = false;
		public var player:Player;
		public var locked:Boolean = false;
		public var bulletList:Array = [];
		public var wbList:Array = [];
		public var enemyList:Array = [];
		
		public function MapScreen() {
			startZone = new StartZone();
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
			
			transScreen = new TransitionScreen();
			transScreen.width = 448;
			transScreen.height = 288;
			loadZones();
		}
		
		private function addedHandler(e:Event=null):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addChild(startZone);
			currentZone = startZone;
			player = new Player();
			player.x = currentZone.startPoint[0]*32+player.width/2;
			player.y = currentZone.startPoint[1]*32+player.height/2;
			addChild(player);
			if (player.getItem("redKey")) {MovieClip(parent).addKey("red");}
			if (player.getItem("blueKey")) {MovieClip(parent).addKey("blue");}
			if (player.getItem("greenKey")) {MovieClip(parent).addKey("green");}
			if (player.getItem("crystal")) {MovieClip(parent).addCrystal();}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeypress, false, 0, true);
			addEventListener(Event.ENTER_FRAME, loopHandler, false, 0, true);
		}
		
		private function loopHandler(e:Event):void {
			if (bulletList.length>0) {
				for (var i:int = bulletList.length-1; i>=0; i--) {
					bulletList[i].addEventListener(Event.REMOVED_FROM_STAGE, removeBullet, false, 0, true);
					bulletList[i].loopHandler();
				}
			}
		}
		
		private function removedHandler(e:Event):void {
			
		}
		
		private function removeBullet(e:Event):void {
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, removeBullet);
			bulletList.splice(bulletList.indexOf(e.currentTarget),1);
		}
		
		public function transitionTo(mc:MovieClip, X:int, Y:int):void {
			if (transitioning) {return;}
			while (bulletList.length>0) {
				removeChild(bulletList.pop());
			}
			while (enemyList.length>0) {
				removeChild(enemyList.pop());
			}
			transitioning=true;
			nextZone = mc;
			addChild(nextZone);
			setChildIndex(player,numChildren-1);
			removeChild(currentZone);
			currentZone = nextZone;
			transitioning = false;
			player.x = X*32+player.width/2;
			player.y = Y*32+player.height/2;
			SharedObjectManager.setData("currentZone",currentZone.toString());
			SharedObjectManager.setData("playerStats",[player.x,player.y,player.health,player.inventory]);
		}
				
		public function onKeypress(ke:KeyboardEvent):void {
			if (locked) {return;}
			var getX:int = currentX();var getY:int = currentY();
			switch (ke.keyCode) {
				case SharedObjectManager.getData("moveUpKey"):
					player.rotation=-90;
					if (getY-1>=0) {
						if (currentZone.oLayer[getY-1][getX]==null&&noEnemy(getY-1,getX)) {
							player.y -= 32;
						}
						if (!noEnemy(getY-1,getX)) {
							player.getHit(1);
						}
					}
					break;
				case SharedObjectManager.getData("moveDownKey"):
					player.rotation=90;
					if (getY+1<currentZone.oLayer.length) {
						if (currentZone.oLayer[getY+1][getX]==null&&noEnemy(getY+1,getX)) {
							player.y+=32;
						}
						if (!noEnemy(getY+1,getX)) {
							player.getHit(1);
						}
					}
					break;
				case SharedObjectManager.getData("moveLeftKey"):
					player.rotation=180;
					if (getX-1>=0) {
						if (currentZone.oLayer[getY][getX-1]==null&&noEnemy(getY,getX-1)) {
							player.x-=32;
						}
						if (!noEnemy(getY,getX-1)) {
							player.getHit(1);
						}
					}
					break;
				case SharedObjectManager.getData("moveRightKey"):
					player.rotation=0;
					if (getX+1<currentZone.oLayer[0].length) {
						if (currentZone.oLayer[getY][getX+1]==null&&noEnemy(getY,getX+1)) {
							player.x+=32;
						}
						if (!noEnemy(getY,getX+1)) {
							player.getHit(1);
						}
					}
					break;
				case SharedObjectManager.getData("fireKey"):
					player.fire();
					break;
				case SharedObjectManager.getData("minimapKey"):
					trace("toggle minimap");
					break;
				default:
					break;
			}
		}
		
		protected function currentX():int {
			return (player.x-player.width/2)/32;
		}
		protected function currentY():int {
			return (player.y-player.height/2)/32;
		}
		
		public function noEnemy(Y:int,X:int):Boolean {
			if (enemyList.length>0) {
				for (var enemy in enemyList) {
					if (enemyList[enemy].currentY()==Y&&enemyList[enemy].currentX()==X) {
						return false;
					}
				}
			}
			return true;
		}
		
		private function loadZones():void {
			zone1A = new Zone1A();zone1B = new Zone1B();zone1C = new Zone1C();zone1D = new Zone1D();
			zone2A = new Zone2A();zone2B = new Zone2B();zone2C = new Zone2C();zone2D = new Zone2D();
			zone2E = new Zone2E();zone2F = new Zone2F();zone2G = new Zone2G();zone2H = new Zone2H();
			zone2I = new Zone2I();
			zone3A = new Zone3A();zone3B = new Zone3B();zone3C = new Zone3C();zone3D = new Zone3D();
			zone3E = new Zone3E();zone3F = new Zone3F();zone3G = new Zone3G();zone3H = new Zone3H();
			zone3I = new Zone3I();zone3J = new Zone3J();
			zone4A = new Zone4A();zone4B = new Zone4B();zone4C = new Zone4C();zone4D = new Zone4D();
			zone4E = new Zone4E();zone4F = new Zone4F();
			zone5 = new Zone5();
		}
	}
}