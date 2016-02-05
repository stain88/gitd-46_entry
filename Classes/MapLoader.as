package {
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	
	public class MapLoader extends MovieClip {
		[Embed(source="../images/mainSet.png")]
		public static var MainSet:Class;
		
		private var tileSetLoader:Loader;
		private var tileSheet:SpriteSheet;
		private var tileBitmap:Bitmap;
		
		private var _map:String;
		private var mapJson:URLLoader;
		protected var parsedMap:Object;
		private const TI_MAPS:String = "Classes/TIMaps.as";
		
		protected var fLayer:Array;
		public var oLayer:Array;
		
		public function MapLoader(mapName:String) {
			_map = mapName;
			loadMap();
			//loadTileSet();
			addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
		}
		
		protected function addedHandler(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.ADDED, readd, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeypress, false, 0, true);
		}
		
		protected function readd(e:Event):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeypress, false, 0, true);
		}
		
		private function loadTileSet():void {
			tileSetLoader = new Loader();
			tileSetLoader.load(new URLRequest("./images/mainSet.png"));
			tileSetLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadedTiles);
		}
		private function loadedTiles(e:Event):void {
			//tileSheet = new SpriteSheet(tileSetLoader.content as Bitmap, 32, 32);
			tileSheet = new SpriteSheet(new MainSet() as Bitmap,32,32);
			loadMap();
		}
		
		private function loadMap() {
			mapJson = new URLLoader();
			mapJson.addEventListener(Event.COMPLETE, parseMap, false, 0, true);
			mapJson.load(new URLRequest(TI_MAPS));
		}
		
		private function parseMap(e:Event):void {
			parsedMap = JSON.parse(mapJson.data);
			for (var i:int = 0; i<parsedMap.maps.length; i++) {
				if (parsedMap.maps[i].mapName == _map) {
					fLayer = parsedMap.maps[i].design[0].construct;
					oLayer = parsedMap.maps[i].design[1].construct;
				}
			}
			//loadTiles();
			drawTiles();
		}
		
		private function loadTiles():void {
			drawTiles();
		}
		
		private function drawTiles():void {
			for (var fi:int = 0; fi<fLayer[0].length; fi++) {
				for (var fj:int = 0; fj<fLayer.length; fj++) {
					tileBitmap = new Bitmap();
					tileBitmap.bitmapData = Tiles.getMap().drawTile(fLayer[fj][fi]);//tileSheet.drawTile(fLayer[fj][fi]);
					tileBitmap.x = fi*32;
					tileBitmap.y = fj*32;
					addChild(tileBitmap);
				}
			}
			for (var oi:int = 0; oi<oLayer[0].length; oi++) {
				for (var oj:int = 0; oj<oLayer.length; oj++) {
					if (oLayer[oj][oi]!=null) {
						tileBitmap = new Bitmap();
						tileBitmap.bitmapData = Tiles.getMap().drawTile(oLayer[oj][oi]);//tileSheet.drawTile(oLayer[oj][oi]);
						tileBitmap.x = oi*32;
						tileBitmap.y = oj*32;
						addChild(tileBitmap);
					}
				}
			}
		}
				
		protected function onKeypress(ke:KeyboardEvent):void {
			
		}
		
		protected function currentX():int {
			return (MovieClip(parent).player.x-MovieClip(parent).player.width/2)/32;
		}
		protected function currentY():int {
			return (MovieClip(parent).player.y-MovieClip(parent).player.height/2)/32;
		}
		
		protected function isFacing(X:int, Y:int):Boolean {
			return (currentX()==X-1&&currentY()==Y&&MovieClip(parent).player.rotation==0 ||
					currentX()==X+1&&currentY()==Y&&MovieClip(parent).player.rotation==180 ||
					currentX()==X&&currentY()==Y-1&&MovieClip(parent).player.rotation==90 ||
					currentX()==X&&currentY()==Y+1&&MovieClip(parent).player.rotation==-90)?true:false;
		}
	}
}