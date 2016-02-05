package commands.utils {
	import commands.Command;
	
	public class Dummy extends Command {

		public function Dummy() {
			
		}
		
		override protected function execute():void {
			complete();
		}
	}
}