package  
{
	import org.flixel.*;
	
	public class MainMenuBackground extends FlxSprite 
	{
		[Embed(source="../assets/MainMenu.png")]
		private var image : Class;
		
		public function MainMenuBackground() 
		{
			super(0, 0, image);
		}
		
	}

}