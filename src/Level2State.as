package  
{
	import org.flixel.*;
	
	public class Level2State extends BaseLevelState 
	{
		public function Level2State() 
		{
			super();	
		}
		
		protected override function createEnemy():BaseEnemy {
			return new Level2Enemy(FlxG.width/2, 0);
		}
		
		protected override function createInbetweenState():FlxState {
			return new InbetweenState(3, new Level3State());
		}
	}
}