package  
{
	import org.flixel.*;
	import mx.collections.ArrayList;
	
	public class Level3State extends FlxState 
	{
		private var player:Player;
		private var enemy:Level3Enemy;
		
		public function Level3State() 
		{
			super();
		}
		
		override public function create():void {
			/* initialization code */			
			this.player = new Player(FlxG.width/2, FlxG.height - 100);
			this.add(player);
			
			this.enemy = new Level3Enemy(FlxG.width/2, 0);
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
			
			/// \todo maybe make this one of those group thingys?
			var enemyCircleBullets:ArrayList = enemy.getBullets();
			for (var j:Number = 0; j < enemyCircleBullets.length; ++j) {
				var bullets:ArrayList = enemyCircleBullets.getItemAt(j).getBullets();
				for (var k:Number = 0; k < bullets.length; ++k) {
					FlxU.overlap(player, Bullet(bullets.getItemAt(k)));
				}
			}

			if (this.enemy.dead || FlxG.keys.pressed("L")) {
				FlxG.state = new GameOverState("YOU WIN!");
			}
			
			super.update();
		}
	}

}