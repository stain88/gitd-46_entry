package commands.utils {
	import commands.Command;
	
	public class SetProperties extends Command {
		public var target:Object;
		public var properties:Object;

		public function SetProperties(target:Object, properties:Object) {
			this.target = target;
			this.properties = properties;
		}
		
		override protected function execute():void {
			for (var key:String in properties) {
				target[key] = properties[key];
			}
			complete();
		}
	}
}