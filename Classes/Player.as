package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Player extends MovieClip {
		private var maxHealth:Number = 10;
		private var healthBar:HealthBar;
		public var health:Number;
		public var inventory:Object;
		
		private var canFire:Boolean = true;
		private var fireTimer:Timer;
		private var fireTick:Number = 750;
		
		public function Player() {
			healthBar = new HealthBar();
			healthBar.x = 60;
			healthBar.y = 30;
			health = maxHealth;
			updateHealth();
			inventory = new Object();
			addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		
		private function addedHandler(e:Event):void {
			(this.parent.parent as MovieClip).addChild(healthBar);
		}
		
		public function fire():void {
			if (canFire) {
				canFire = false;
				var fireBall:Fireball = new Fireball(this.x, this.y, this.rotation);
				(this.parent as MovieClip).bulletList.push(fireBall);
				MovieClip(parent).addChild(fireBall);
				SoundManager.play("fireball");
				fireTimer = new Timer(fireTick,1);
				fireTimer.addEventListener(TimerEvent.TIMER, cooldown, false, 0, true);
				fireTimer.start();
			}
		}
		
		private function cooldown(te:TimerEvent):void {
			fireTimer.removeEventListener(TimerEvent.TIMER, cooldown);
			canFire = true;
		}
		
		public function updateHealth():void {
			healthBar.barColor.scaleX = health/maxHealth;
			if (health<=0) {
				(this.parent.parent.parent as MovieClip).gotoGameOver();
			}
		}
		
		public function getHit(dam:Number):void {
			health-=dam;
			updateHealth();
		}
		
		public function addItem(_key:String, _val:*):void {
			inventory[_key] = _val;
		}
		
		public function getItem(_key:String):* {
			var _data:Object = inventory[_key]==null?false:true;
			return _data;
		}
	}
}