package {
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
		
	/**
	 * How to use:
	 * 
	 * // imports
	 * import SharedObjectManager;
	 * // Call setup() method just once.
	 * SharedObjectManager.setup();
	 * // Creating a SharedObject data
	 * SharedObjectManager.setData ("lives",3);
	 * // Recovering the existing data
	 * SharedObjectManager.getData ("lives");
	 * 
	 */
	 
	public class SharedObjectManager {
		
		public static var SHARED_OBJECT_NAME:String = "mySaveGame";
		
		public static var _instance:SharedObjectManager;
		public static var so:SharedObject;
		public static var storage:Object;
		public static var dictionary:Dictionary;
		
		public static function setup(gameName:String = null):void {
			if (gameName!=null) {SHARED_OBJECT_NAME = gameName;}
			SharedObjectManager.so = SharedObject.getLocal (SHARED_OBJECT_NAME);			
		}
		
		public static function getInstance():SharedObjectManager {
			return SharedObjectManager._instance;
		}
		
		public static function getData(_string:String):* {
			var _data:Object = SharedObjectManager.so.data[_string];
			return _data;
		}
		
		public static function setData(_key:String,_val:*):void {
			SharedObjectManager.so.data[_key] = _val;
			save();
		}
		
		public static function save():void {
			SharedObjectManager.so.flush();
		}
		
		public static function destroy():void {
			SharedObjectManager.so.clear();
		}
	}
}