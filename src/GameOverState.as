package 
{
	import org.flixel.*;
	
	public class GameOverState extends FlxState
	{
		private var text:String;

		override public function GameOverState(text:String):void 
		{
			super();
			this.text = text;
		}
		
		override public function create():void {
			var gameOverText:FlxText = new FlxText(0, (FlxG.height / 2) - 200, FlxG.width, "Game Over." );
			gameOverText.setFormat(null, 32, 0xeeeeeeee, "center");
			
			var winText:FlxText = new FlxText(0, FlxG.height / 2 - 100, FlxG.width, text);
			winText.setFormat(null, 32, 0xeeeeeeee, "center");
			
			var enterText:FlxText = new FlxText(0, (FlxG.height / 2), FlxG.width, "Press SPACE to play again.");
			enterText.setFormat(null, 20, 0xeeeeeeee, "center");
			
			this.add(gameOverText);
			this.add(winText);
			this.add(enterText);
		}
		
		override public function update():void {
			if (FlxG.keys.pressed("SPACE"))
			{
				FlxG.fade.start(0xee000000, 0.2, onFade);
			}
			super.update();
		}
		
		private function onFade():void {
			FlxG.state = new MenuState();
		}
	}
	
}