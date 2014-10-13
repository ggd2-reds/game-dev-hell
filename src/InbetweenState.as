package  
{
	import org.flixel.*;

	/**
	 * \brief The state that appears between levels.
	 */
	public class InbetweenState extends FlxState 
	{
		private var nextState:FlxState;

		public function InbetweenState(levelNumber:Number, nextState:FlxState) 
		{
			super();
			this.nextState = nextState;
			
			var levelText:FlxText = new FlxText(0, FlxG.height / 2 - 100, FlxG.width, 
												"Get ready for level " + String(levelNumber));
			levelText.setFormat(null, 32, 0xeeeeeeee, "center");
			
			var enterText:FlxText = new FlxText(0, (FlxG.height / 2), FlxG.width, "Press ENTER to start.");
			enterText.setFormat(null, 20, 0xeeeeeeee, "center");
			
			this.add(levelText);
			this.add(enterText);
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("ENTER"))
			{
				FlxG.fade.start(0xee000000, 0.2, onFade);
			}
			super.update();
		}
		
		private function onFade():void
		{
			FlxG.state = this.nextState;
		}
	}

}