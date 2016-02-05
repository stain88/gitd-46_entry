package commands.greensock {
	import com.greensock.TweenMax;
	import commands.Command;
	
	public class TweenMaxFrom extends Command {
		public var target:Object;
		public var duration:Number;
		public var vars:Object;

		public function TweenMaxFrom(target:Object, duration:Number, vars:Object) {
			this.target = target;
			this.duration = duration;
			this.vars = vars;
		}
		
		override protected function execute():void {
			//tell TweenMax to invoke the command's complete method when the tweening is done
			vars.onComplete = complete;
			TweenMax.from(target, duration, vars);
		}
	}
}