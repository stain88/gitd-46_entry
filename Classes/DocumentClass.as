package {	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import commands.*;
	import commands.greensock.*;
	import maps.*;
	
	public class DocumentClass extends MovieClip {
		private var preloader:Preloader;
		private var transitionScreen:TransitionScreen;
		private var mainMenu:MainMenu;
		private var options:Options;
		private var gameScreen:GameScreen;
		private var gameOver:GameOverScene;
		private var winScreen:WinScreen;
		
		private var currentScreen:MovieClip;
		private var nextScreen:MovieClip;

		public function DocumentClass() {
			trace("Hello");
			//QuickKong.connectToKong(stage);
			SharedObjectManager.setup("TheWaterTemple");
			Tiles.setup();
			preloader = new Preloader();
			addChild(preloader);
			currentScreen = preloader;
			stage.stageFocusRect = false;
			loadMusic();
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressMade, false, 0, true);
			loaderInfo.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
		}
		
		private function onProgressMade(pe:ProgressEvent):void {
			trace(Math.floor(100 * loaderInfo.bytesLoaded/loaderInfo.bytesTotal));
			preloader.loaderBar.barColor.scaleX = Math.floor(loaderInfo.bytesLoaded/loaderInfo.bytesTotal);
		}
		private function onLoadComplete(e:Event):void {
			finishedLoading();
			preloader.onLoadComplete();
		}
				
		public function finishedLoading():void {
			gotoAndStop(3);
			setup();
		}

		private function setup():void {
			setControls();
			transitionScreen = new TransitionScreen();
			mainMenu = new MainMenu();
			options = new Options();
			gameScreen = new GameScreen();
			gameOver = new GameOverScene();
			winScreen = new WinScreen();
		}
				
		public function gotoMain():void {
			addTransScreen();
			transition(mainMenu);
		}
		
		public function gotoOptions():void {
			addTransScreen();
			transition(options);
		}
		
		public function gotoGame():void {
			addTransScreen();
			transition(gameScreen);
		}
		
		public function gotoGameOver():void {
			addTransScreen();
			transition(gameOver);
		}
		
		public function gotoWin():void {
			addTransScreen();
			transition(winScreen);
		}
		
		private function transition(mc:MovieClip):void {
			nextScreen = mc;
			nextScreen.x = stage.stageWidth;
			addChild(nextScreen);
			var command:Command = new SerialCommand(0,
									new ParallelCommand(0,
										new TweenMaxTo(currentScreen, 0.5, {x:-640}),
										new TweenMaxTo(transitionScreen, 0.5, {x:0})
									),
									new ParallelCommand(0, 
										new TweenMaxTo(transitionScreen, 0.5, {x:-640}),
										new TweenMaxTo(nextScreen, 0.5, {x:0})
									)
								);
			command.start();
			command.addEventListener(Event.COMPLETE, onFinishCommand);
		}
		
		private function onFinishCommand(e:Event):void {
			removeChild(currentScreen);
			removeChild(transitionScreen);
			currentScreen = nextScreen;
			nextScreen = null;
		}
		
		private function addTransScreen():void {
			transitionScreen.x = stage.stageWidth;
			addChild(transitionScreen);
		}
		
		private function setControls():void {
			if (SharedObjectManager.getData("init")!=null) return;
			SharedObjectManager.setData("moveUpKey", Keyboard.W);
			SharedObjectManager.setData("moveDownKey", Keyboard.S);
			SharedObjectManager.setData("moveLeftKey", Keyboard.A);
			SharedObjectManager.setData("moveRightKey", Keyboard.D);
			SharedObjectManager.setData("minimapKey", Keyboard.M);
			SharedObjectManager.setData("fireKey", Keyboard.J);
			SharedObjectManager.setData("actionKey", Keyboard.U);
			SharedObjectManager.setData("cancelKey", Keyboard.K);
		}
		
		private function loadMusic():void {
			//SoundManager.addSound(new GuiVsPiano(), "guivspiano");
			SoundManager.addSound(new EClip(), "explosion");
			SoundManager.addSound(new FBClip(), "fireball");
			SoundManager.addSound(new HClip(), "hit");
			SoundManager.addSound(new PUClip(), "pickup");
			SoundManager.addSound(new WBClip(), "waterball");
		}
	}
}