package 
{
	import org.flixel.*;

	public class Bullet extends FlxSprite
	{
		private var speed:Number;
		private var directionUp:Boolean;
		
		public function Bullet(X:Number, Y:Number, image:Class, directionUp:Boolean, speed:Number=400) {
			super (X, Y, image);
			this.directionUp = directionUp;
			this.speed = speed;
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
		
		public function get Speed():Number {
			return this.speed;
		}
	}
	
}