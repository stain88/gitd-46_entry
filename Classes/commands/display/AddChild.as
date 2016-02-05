package commands.display {
	import commands.Command;
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	
	public class AddChild extends Command {
		public  var container:DisplayObjectContainer;
		public var displayObject:DisplayObject;

		public function AddChild(container:DisplayObjectContainer, displayObject:DisplayObject) {
			this.container = container;
			this.displayObject = displayObject;
		}
		
		override protected function execute():void {
			container.addChild(displayObject);
			complete();
		}
	}
}