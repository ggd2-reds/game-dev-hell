package 
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		override public function PlayState():void
		{
			/* initialization code */
			
			var text:FlxText = new FlxText( 0, FlxG.height - 24, FlxG.width, "The game has started, currently in the play state." );
			text.setFormat( null, 16, 0xcccccccc, "center" );
			this.add(text);
			
			var player:Player = new Player(FlxG.width/2, FlxG.height - 100);
			this.add(player);
			
			var enemy:Enemy = new Enemy(FlxG.width/2, 0);
			this.add(enemy);
		}
		
		override public function update():void
		{
			/* your code here */
			
			super.update();
		}
	}
	
}