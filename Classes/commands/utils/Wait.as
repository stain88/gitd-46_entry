package commands.utils {
	import commands.Command;
	
	public class Wait extends Command {

		public function Wait(delay:Number = 0) {
			super(delay);
		}
		
		override protected function execute():void {
			complete();
		}
	}
}