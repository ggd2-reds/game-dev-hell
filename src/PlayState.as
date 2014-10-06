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
			
			var player:Player = new Player(150, 150);
			this.add(player);
			
		}
		
		override public function update():void
		{
			/* your code here */
			
			super.update();
		}
	}
	
}