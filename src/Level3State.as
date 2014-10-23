package  
{
	import org.flixel.*;
	import mx.collections.ArrayList;
	
	public class Level3State extends BaseLevelState 
	{		
		public function Level3State() 
		{
			super();
		}
		
		protected override function createEnemy():BaseEnemy {
			return new Level3Enemy(FlxG.width/2, 0);
		}
		
		protected override function createInbetweenState():FlxState {
			return new GameOverState("YOU WIN!");
		}
	}

}