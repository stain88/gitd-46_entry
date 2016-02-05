package {
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	
	public class InvalidText extends MovieClip {
		
		
		public function InvalidText() {
			this.x = 120;
			this.y = 350;
			addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		
		private function addedHandler(e:Event):void {
			var t1:TimelineLite = new TimelineLite();
			t1.from(this, 1, {y:800});
			t1.to(this, 2, {alpha:0, onComplete:finishTween}, "+1");
		}
		
		private function finishTween():void {
			MovieClip(parent).removeChild(this);
		}
	}
	
}
