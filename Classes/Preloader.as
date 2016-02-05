package {
	import flash.display.*;
	import flash.events.*;
	
	public class Preloader extends MovieClip {
		private var muteBtn:MenuButton;
		private var musicBtn:MenuButton;
		
		public function Preloader() {
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}
		
		private function addedHandler(e:Event):void {
			
		}
		
		private function removedHandler(e:Event):void {
			
		}
		
		public function onLoadComplete():void {
			muteBtn = new MenuButton("Play Muted");
			muteBtn.x = 150; muteBtn.y = 350;muteBtn.name = "mute";
			muteBtn.addEventListener(MouseEvent.CLICK, clickSound, false, 0, true);
			addChild(muteBtn);
			musicBtn = new MenuButton("Play with Sound");
			musicBtn.x = 400; musicBtn.y = 350;musicBtn.name = "music";
			musicBtn.addEventListener(MouseEvent.CLICK, clickSound, false, 0, true);
			addChild(musicBtn);
		}
				
		private function clickSound(me:MouseEvent):void {
			if (me.currentTarget.name == "mute") {
				SoundManager.enabled = false;
			}
			SharedObjectManager.setData("Music", SoundManager.enabled);
			MovieClip(parent).gotoMain();
		}
	}
}