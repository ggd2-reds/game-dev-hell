package  
{
	import Background;
	import org.flixel.*;
	import mx.collections.ArrayList;
	
	public class BaseLevelState extends FlxState 
	{
		protected var player:Player;
		protected var enemy:BaseEnemy;
		private var powerUpFactory:PowerupFactory;
		private var playerHealthText:FlxText;
		
		public function BaseLevelState() 
		{
			super();
		}
		
		protected function createEnemy():BaseEnemy {
			//OVERRIDE THIS IN THE BASE CLASS
			return null;
		}
		
		protected function createInbetweenState():FlxState {
			//OVERRIDE THIS IN THE BASE CLASS
			return null;
		}
		
		override public function create():void {
			/* initialization code */		
			this.add(new Background);
			this.player = new Player(FlxG.width/2, FlxG.height - 100);
			this.add(player);
			
			this.enemy = createEnemy();
			this.add(enemy);
			
			this.powerUpFactory = new PowerupFactory(this, player);
			
			this.playerHealthText = new FlxText(0, FlxG.height - 20, 20, player.health.toString());
			this.add(playerHealthText);
		}
		
		override public function update():void {
			this.playerHealthText.text = player.health.toString();
			
			var playerBullets:ArrayList = player.getBullets();
			for (var i:Number = 0; i < playerBullets.length; ++i) {
				FlxU.overlap(enemy, BulletBase(playerBullets.getItemAt(i)));
			}
			
			if (this.player.dead) {
				FlxG.state = new GameOverState("YOU LOSE!");
			}
			
			var enemyBullets:ArrayList = enemy.getBullets();
			for (var j:Number = 0; j < enemyBullets.length; ++j) {
				FlxU.overlap(player, BulletBase(enemyBullets.getItemAt(j)));
			}

			if (this.enemy.dead || FlxG.keys.pressed("L")) {
				FlxG.state = createInbetweenState();
			}
			
			super.update();
		}
	}

}