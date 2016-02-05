package  {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	
	public class Fireball extends Bullet {
		
		public function Fireball(X:int, Y:int, rot:Number) {
			super(X, Y, rot);
		}
		
		override public function loopHandler():void {
			super.loopHandler();
			if (int(y/32)>=(MovieClip(parent).currentZone.oLayer.length)||MovieClip(parent).currentZone.oLayer[int(y/32)][int(x/32)]!=null||int(x/32)>=(MovieClip(parent).currentZone.oLayer[0].length)||x<0||y<0) {
				this.parent.removeChild(this);return;
			}
			if (MovieClip(parent).enemyList.length>0) {
				for (var enemy in MovieClip(parent).enemyList) {
					if (PPCD.isColliding(this, MovieClip(parent).enemyList[enemy], MovieClip(parent), true)) {
						MovieClip(parent).enemyList[enemy].defeated = true;
						MovieClip(parent).enemyList[enemy].die();
						this.parent.removeChild(this);return;
					}
				}
			}
			if (MovieClip(parent).bulletList.length>0) {
				for (var bullet in MovieClip(parent).bulletList) {
					if (MovieClip(parent).bulletList.indexOf(this)==MovieClip(parent).bulletList.indexOf(bullet)) {continue;}
					if (getQualifiedClassName(MovieClip(parent).bulletList[bullet])=="Waterball") {
						if (PPCD.isColliding(this, MovieClip(parent).bulletList[bullet],MovieClip(parent),true)) {
							MovieClip(parent).bulletList[bullet].explode();
							this.parent.removeChild(this);return;
						}
					}
				}
			}
		}
	}	
}