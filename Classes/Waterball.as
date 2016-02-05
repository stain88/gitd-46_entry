package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Waterball extends Bullet {
		private var damage:int;
		
		public function Waterball(X:int, Y:int, rot:Number, dam:int = 1) {
			super(X,Y,rot);
			this.damage = dam;
		}
		
		override public function loopHandler():void {
			super.loopHandler();
			if (int(y/32)>=(MovieClip(parent).currentZone.oLayer.length)||MovieClip(parent).currentZone.oLayer[int(y/32)][int(x/32)]!=null||int(x/32)>=(MovieClip(parent).currentZone.oLayer[0].length)||x<0||y<0) {
				this.parent.removeChild(this);return;
			}
			if (PPCD.isColliding(this, (this.parent as MovieClip).player, (this.parent as MovieClip),true)) {
				SoundManager.play("hit");
				MovieClip(parent).player.getHit(damage);
				this.parent.removeChild(this);return;
			}
		}
		
		public function explode():void {
			this.parent.removeChild(this);
		}
	}
	
}
