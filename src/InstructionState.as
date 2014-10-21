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
				"\t-You have 2 hits before you die\n" +
				"\t-The enemy has 10 hits before he dies\n" +
				"\t-There are currently 3 levels\n"+
				"Controls:\n" +
				"\t-Arrow Keys or WASD - Move Up/Down/Left/Right\n" +
				"\t\t-You can move in all 8 directions\n" +
				"\t-Space - Shoot\n" +
				"\t-L - Skip a level\n" + 
				"\n" +
				"Press SPACE to go back";
			var instructionText:FlxText = new FlxText(50, 50, FlxG.width,
													  text);
			instructionText.setFormat(null, 16, 0xeeeeeeee, "left");
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