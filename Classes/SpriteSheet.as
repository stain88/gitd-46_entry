package {
	
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.geom.Matrix;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class SpriteSheet extends Sprite {
		private var tileSheetBitmapData:BitmapData;
		private var canvasBitmapData:BitmapData;
		
		private var tileWidth:int;
		private var tileHeight:int;
		private var rowLength:int;
		
		private var tileRectangle:Rectangle;
		private var tilePoint:Point;

		public function SpriteSheet(tileSheetBitmap:Bitmap, width:int = 16, height:int = 16) {
			tileSheetBitmapData = tileSheetBitmap.bitmapData;
			tileWidth = width;
			tileHeight = height;
			
			rowLength = int(tileSheetBitmap.width / width);
			
			tileRectangle = new Rectangle(0, 0, tileWidth, tileHeight);
			tilePoint = new Point(0,0);
			
			canvasBitmapData = new BitmapData(tileWidth, tileHeight, true);
			var canvasBitmap:Bitmap = new Bitmap(canvasBitmapData);
			addChild(canvasBitmap);
			
			//drawTile(0,2);
			
			addEventListener(Event.REMOVED_FROM_STAGE, remove, false, 0, true);
		}
		
		public function drawTile(tileNumber:int, offset:int = 0, xFlipped:Boolean = false, yFlipped:Boolean = false):BitmapData {
			tileRectangle.x = int((tileNumber % rowLength)) * (tileWidth+offset);
			tileRectangle.y = int((tileNumber / rowLength)) * (tileHeight+offset);
			canvasBitmapData.copyPixels(tileSheetBitmapData, tileRectangle, tilePoint);
			if (xFlipped) {
				canvasBitmapData = flipBitmapData(canvasBitmapData);
			}
			if (yFlipped) {
				canvasBitmapData = flipBitmapData(canvasBitmapData, "y");
			}
			
			return canvasBitmapData.clone();
		}
		
		public function remove(e:Event):void {
			tileSheetBitmapData.dispose();
			canvasBitmapData.dispose();
		}

		private function flipBitmapData(original:BitmapData, axis:String = "x"):BitmapData {
			var flipped:BitmapData = new BitmapData(original.width, original.height, true, 0);
			var matrix:Matrix;
			if (axis=="x") {
				matrix = new Matrix(-1,0,0,1,original.width,0);
			} else {
				matrix = new Matrix(1,0,0,-1,0,original.height);
			}
			flipped.draw(original, matrix, null, null, null, true);
			return flipped;
		}
	}
}