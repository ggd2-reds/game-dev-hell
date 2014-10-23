package 
{
	import org.flixel.*;

	public class Level1State extends BaseLevelState
	{		
		override public function Level1State():void {
			super();
		}
		
		protected override function createEnemy():BaseEnemy {
			return new Level1Enemy(FlxG.width/2, 0);
		}
		
		protected override function createInbetweenState():FlxState {
			return new InbetweenState(2, new Level2State());
		}
	}
	
}