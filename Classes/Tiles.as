package  {
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	
	public class Tiles {
		[Embed(source="../images/mainSet.png")]
		public static var MainSet:Class;
		
		public static var loader:Loader;
		public static var tileSet:SpriteSheet;

		public function Tiles() {
			// constructor code
		}
		
		public static function setup():void {
			Tiles.loader = new Loader();
			Tiles.loader.load(new URLRequest("./images/mainSet.png"));
			Tiles.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadedSet);
		}
		
		public static function loadedSet(e:Event):void {
			Tiles.tileSet = new SpriteSheet(new MainSet() as Bitmap, 32, 32);
			trace(Tiles.tileSet);
		}
		
		public static function getMap():SpriteSheet {
			return tileSet;
		}

	}
	
}
