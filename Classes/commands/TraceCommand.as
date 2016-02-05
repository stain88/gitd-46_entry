package commands {
	
	public class TraceCommand extends Command {
		private var _message:String;

		public function TraceCommand(delay:Number, message:String) {
			super(delay);
			_message = message;
		}
		
		override protected function execute():void {
			trace(_message);
			complete();
		}
	}
}