package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Bullet extends MovieClip {
		private var speed:Number = 10;
		private var rotInRad:Number;
		private var cos:Function = Math.cos;
		private var sin:Function = Math.sin;
		private var xVel:Number;
		private var yVel:Number;

		public function Bullet(X:int, Y:int, rot:Number) {
			this.x = X;
			this.y = Y;
			this.rotation = rot;
			this.rotInRad = rot*Math.PI/180;
		}
		
		public function loopHandler():void {
			xVel = cos(rotInRad)*speed;
			yVel = sin(rotInRad)*speed;
			
			x+=xVel;
			y+=yVel;
		}
	}
}