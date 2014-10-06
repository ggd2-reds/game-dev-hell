package 
{
	import org.flixel.*;
	import mx.collections.ArrayList;

	public class PlayState extends FlxState
	{
		var player:Player;
		var enemy:Enemy;
		
		override public function PlayState():void
		{
			/* initialization code */
			
			var text:FlxText = new FlxText( 0, FlxG.height - 24, FlxG.width, "The game has started, currently in the play state." );
			text.setFormat( null, 16, 0xcccccccc, "center" );
			this.add(text);
			
			this.player = new Player(FlxG.width/2, FlxG.height - 100);
			this.add(player);
			
			this.enemy = new Enemy(FlxG.width/2, 0);
			this.add(enemy);
		}
		
		override public function update():void
		{
			var playerBullets:ArrayList = player.getBullets();
			for (var i:Number = 0; i < playerBullets.length; ++i) {
				FlxU.overlap(enemy, Bullet(playerBullets.getItemAt(i)));
			}
			
			var enemyBullets:ArrayList = enemy.getBullets();
			for (var j:Number = 0; j < enemyBullets.length; ++j) {
				FlxU.overlap(player, Bullet(enemyBullets.getItemAt(j)));
			}
			
			super.update();
		}
	}
	
}