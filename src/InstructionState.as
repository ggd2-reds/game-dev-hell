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
				"\tDefeat the enemy\n" +
				"\tYou have 2 hits before you die\n" +
				"\tThe enemy has 10 hits before he dies\n" +
				"\tThere are currently 3 levels\n"+
				"Controls:\n" +
				"\tArrow Keys - Move Up/Down/Left/Right\n" +
				"\tSpace - Shoot\n" +
				"\tL - Skip a level\n" + 
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