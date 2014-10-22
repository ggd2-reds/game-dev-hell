package 
{
	import org.flixel.*;

	public class Bullet extends BulletBase
	{		
		public function Bullet(X:Number, Y:Number, image:Class, directionUp:Boolean, speed:Number=400) {
			super (X, Y, image, directionUp, speed);
		}
	}
	
}