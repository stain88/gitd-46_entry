package commands.greensock {
	import commands.Command;
	import com.greensock.TweenMax;
	
	public class TweenMaxTo extends Command {
		public var target:Object;
		public var duration:Number;
		public var vars:Object;

		public function TweenMaxTo(target:Object, duration:Number, vars:Object) {
			this.target = target;
			this.duration = duration;
			this.vars = vars;
		}
		
		override protected function execute():void {
			//tell TweenMax to invoke the command's complete method when the tweening is done
			vars.onComplete = complete;
			TweenMax.to(target, duration, vars);
		}
	}
}