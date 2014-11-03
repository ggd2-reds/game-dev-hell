package  
{
	import org.flixel.*;
	
	public class InstructionState extends FlxState 
	{	
		public function InstructionState() 
		{
			super();
			
		}
		
		override public function create():void {
			var text:String =
				"Rules:\n" +
				"\t-Defeat the enemy\n" +
				"\t-You have 4 hits before you die\n" +
				"\t-There are currently 3 levels\n" +
				"\t-Powerups appear every 4-6 seconds.\n" +
				"\t\t-They last for three seconds.\n" +
				"\t\t-Use them wisely\n" +
				"\t\t-Powerups Include:\n" +
				"\t\t\t-Rapid Fire\n" + 
				"\t\t\t-Wavy Bullet\n" + 
				"\t\t\t-Health Increase\n" + 
				"\t\t\t-Invincibility\n" +
				"Controls:\n" +
				"\t-Arrow Keys or WASD - Move Up/Down/Left/Right\n" +
				"\t\t-You can move in all 8 directions\n" +
				"\t-Space - Shoot\n" +
				"\n" +
				"Press SPACE to go back to menu";
			var instructionText:FlxText = new FlxText(50, 50, FlxG.width,
													  text);
			instructionText.setFormat(null, 16, 0xeeeeeeee, "left");
			this.add(instructionText);
			
			instructionText = new FlxText(0, (FlxG.height / 2) + 175, FlxG.width, "Created by: Rory Glenn, Evan Albitz\nDaniel Brockwell, Seth Hendrick");
			instructionText.setFormat( null, 14, 0xeeeeeeee, "center" );
			this.add(instructionText);
		}
		
		override public function update():void
		{
			if ( FlxG.keys.pressed("SPACE") )
			{
				FlxG.fade.start(0xee000000, .5, goBackToMenu);
			}
			super.update();
		}
		
		private function goBackToMenu():void {
			FlxG.state = new MenuState();
		}
		
	}

}