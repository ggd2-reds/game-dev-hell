package  
{
	import org.flixel.*;
	
	public class WavyBullet extends FlxSprite
	{
		
		private var speed:Number;
		private var directionUp:Boolean;
		private var theta:Number;
		private var centerX:Number;
		
		public function WavyBullet(X:Number, Y:Number, image:Class, directionUp:Boolean, speed:Number=400) {
			super (X, Y, image);
			this.directionUp = directionUp;
			this.speed = speed;
			this.theta = 0.0;
			this.centerX = X;
		}
		
		public override function update():void {
			this.x = this.centerX + speed/20 * Math.sin(theta);
			theta += speed / 2000;
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