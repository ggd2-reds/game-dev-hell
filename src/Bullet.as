package 
{
	import org.flixel.*;

	public class Bullet extends FlxSprite
	{
		private const speed:Number = 400;
		private var directionUp:Boolean;
		
		public function Bullet(X:Number, Y:Number, image:Class, directionUp:Boolean) {
			super (X, Y, image);
			this.directionUp = directionUp;
		}
		
		public override function update():void {
			if (directionUp) {
				velocity.y = -speed;
				if ((y + height) < 0) {
					kill();
				}
			}
			else {
				velocity.y = speed;
				if (y >= FlxG.height) {
					kill();
				}
			}
			
			super.update();
		}
	}
	
}