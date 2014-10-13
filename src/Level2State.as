package  
{
	import org.flixel.*;
	import mx.collections.ArrayList;
	
	public class Level2State extends FlxState 
	{
	
		private var player:Player;
		private var enemy:Level2Enemy;
		
		public function Level2State() 
		{
			super();
			
			/* initialization code */			
			this.player = new Player(FlxG.width/2, FlxG.height - 100);
			this.add(player);
			
			this.enemy = new Level2Enemy(FlxG.width/2, 0);
			this.add(enemy);
		}
		
		override public function update():void
		{
			var playerBullets:ArrayList = player.getBullets();
			for (var i:Number = 0; i < playerBullets.length; ++i) {
				FlxU.overlap(enemy, Bullet(playerBullets.getItemAt(i)));
			}
			
			if (this.player.dead) {
				FlxG.state = new GameOverState("YOU LOSE!");
			}
			
			var enemyBullets:ArrayList = enemy.getBullets();
			for (var j:Number = 0; j < enemyBullets.length; ++j) {
				FlxU.overlap(player, WavyBullet(enemyBullets.getItemAt(j)));
			}

			if (this.enemy.dead) {
				FlxG.state = new GameOverState("YOU WIN!");
			}
			
			super.update();
		}
	}

}