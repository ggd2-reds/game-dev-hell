package  {
	import org.flixel.*;
	
	public class Background extends FlxSprite 
	{
		[Embed(source="../assets/Background.png")]
		private var image : Class;
		
		public function Background() 
		{
			super(0, 0, image);
		}
		
	}

}