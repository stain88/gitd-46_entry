package commands.events {
	import commands.Command;
	import flash.events.IEventDispatcher;
	
	public class AddEventListener extends Command {
		public var dispatcher:IEventDispatcher;
		public var type:String;
		public var listener:Function;

		public function AddEventListener(dispatcher:IEventDispatcher, type:String, listener:Function) {
			this.dispatcher = dispatcher;
			this.type = type;
			this.listener = listener;
		}
		
		override protected function execute():void {
			dispatcher.addEventListener(type, listener);
			complete();
		}
	}
}