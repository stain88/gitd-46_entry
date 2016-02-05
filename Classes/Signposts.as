package  {
	
	public class Signposts {

		public function Signposts() {
			// constructor code
		}
		
		public static function intro():String {
			var up:String = Signposts.getKey("moveUpKey");
			var down:String = Signposts.getKey("moveDownKey");
			var left:String = Signposts.getKey("moveLeftKey");
			var right:String = Signposts.getKey("moveRightKey");
			var action:String = Signposts.getKey("actionKey");
			var cancel:String = Signposts.getKey("cancelKey");
			return "Welcome to the Water Temple. To move " +
				"up/down/left/right, press "+up+", "+down+", "+left+", "+right+". " +
				"To read or open doors, press "+action+". To close windows, press any key.";
		}
		
		public static function intro2():String {
			var fire:String = Signposts.getKey("fireKey");
			return "Due to your exploits in the Fire Temple, you have the ability to launch " +
					"fireballs by pressing "+fire+". Try it out on the enemy in the next room.";
		}
		
		public static function intro3():String {
			return "Easy enough! Now, onwards, to find the Water Crystal."
		}
		
		public static function intro4():String {
			return "Hmmm, looks like you (might) need a key to get through here. Better come back later.";
		}
		
		public static function zone3c():String {
			return "Did you expect enemies in every room?";
		}
		
		public static function zone4f():String {
			return "Prepare yourself! The crystal is near."
		}
		
		private static function getKey(id:String):String {
			var result = SharedObjectManager.getData(id);
			switch (result) {
				case 37:
					return "Left";
				case 38:
					return "Up";
				case 39:
					return "Right";
				case 40:
					return "Down";
				default:
					return String.fromCharCode(result);
			}
		}

	}
}