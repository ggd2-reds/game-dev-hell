package 
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		override public function MenuState():void
		{
			this.add(new MainMenuBackground());
			
			var text:FlxText = new FlxText( 0, (FlxG.height / 2) - 80, FlxG.width, "Game Dev Hell." );
			
			text = new FlxText( 0, FlxG.height - 60, FlxG.width, "Press SPACE to start" );
			text.setFormat( null, 16, 0xcccccccc, "center" );
			this.add(text);
			
			text = new FlxText( 0, FlxG.height - 40, FlxG.width, "Press R for more rules" );
			text.setFormat( null, 16, 0xcccccccc, "center" );
			this.add(text);
		}
		
		override public function update():void
		{
			if ( FlxG.keys.pressed("SPACE") )
			{
				FlxG.fade.start(0xee000000, .5, startGame);
			}
			else if (FlxG.keys.pressed("R")){
				FlxG.fade.start(0xee000000, .5, goToInstructionState);
			}
			super.update();
		}
		
		private function goToInstructionState():void {
			FlxG.state = new InstructionState();
		}
		
		private function startGame():void
		{
			FlxG.state = new Level1State();
		}
	}
	
}