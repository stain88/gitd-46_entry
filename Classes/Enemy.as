package  {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Enemy extends MovieClip {
		private var actionTick:Timer;
		private var actionTime:Number;
		private var attackChance:Number;
		private var waterBall:Waterball;
		private var wballList:Array = [];
		public var defeated:Boolean = false;

		public function Enemy(X:int, Y:int, time:Number, atkC:Number = 0.3) {
			this.x = X*32+this.width/2;
			this.y = Y*32+this.height/2;
			actionTime = time;
			attackChance = atkC;
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		private function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.ADDED, onReadd, false, 0, true);
			actionTick = new Timer(actionTime);
			actionTick.addEventListener(TimerEvent.TIMER, onTick, false, 0, true);
			actionTick.start();
		}
		
		public function onReadd(e:Event):void {
			actionTick.addEventListener(TimerEvent.TIMER, onTick, false, 0, true);
			actionTick.start();
		}
		
		private function removedHandler(e:Event):void {
			actionTick.removeEventListener(TimerEvent.TIMER, onTick);
			if (waterBall) {waterBall.removeEventListener(Event.REMOVED_FROM_STAGE, wballRemoved);}
		}
		
		private function onTick(te:TimerEvent):void {
			Math.random()<=attackChance?attack():move();
		}
		
		private function attack():void {
			SoundManager.play("waterball");
			waterBall = new Waterball(this.x, this.y, this.rotation, 1);
			(this.parent as MovieClip).bulletList.push(waterBall);
			MovieClip(parent).addChild(waterBall);
		}
		
		private function wballRemoved(e:Event):void {
			(this.parent as MovieClip).bulletList.splice((this.parent as MovieClip).bulletList.indexOf(e.currentTarget),1);
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, wballRemoved);
		}
		
		private function move():void {
			var possibleDir:Array = new Array();
			if (currentY()-1>=0&&MovieClip(parent).currentZone.oLayer[currentY()-1][currentX()]==null&&MovieClip(parent).noEnemy(currentY()-1,currentX())) {possibleDir.push("up");}
			if (currentY()+1<MovieClip(parent).currentZone.oLayer.length&&MovieClip(parent).currentZone.oLayer[currentY()+1][currentX()]==null&&MovieClip(parent).noEnemy(currentY()+1,currentX())) {possibleDir.push("down");}
			if (currentX()-1>=0&&MovieClip(parent).currentZone.oLayer[currentY()][currentX()-1]==null&&MovieClip(parent).noEnemy(currentY(),currentX()-1)) {possibleDir.push("left");}
			if (currentX()+1<MovieClip(parent).currentZone.oLayer[0].length&&MovieClip(parent).currentZone.oLayer[currentY()][currentX()+1]==null&&MovieClip(parent).noEnemy(currentY(),currentX()+1)) {possibleDir.push("right");}
			var choices:int = possibleDir.length;
			var dir = Math.floor(Math.random()*choices);
			possibleDir[dir]=="up"?(y-=32,rotation=-90):possibleDir[dir]=="down"?(y+=32,rotation=90):possibleDir[dir]=="left"?(x-=32,rotation=180):(x+=32,rotation=0);
		}
		
		public function currentX():int {
			return (this.x-this.width/2)/32;
		}
		public function currentY():int {
			return (this.y-this.height/2)/32;
		}
		public function tickLength():Number {
			return actionTime;
		}
		public function atkChance():Number {
			return attackChance;
		}
		public function die():void {
			SoundManager.play("explosion");
			MovieClip(parent).enemyList.splice(MovieClip(parent).enemyList.indexOf(this),1);
			this.parent.removeChild(this);
			dispatchEvent(new Event("dead"));
		}
	}
	
}
