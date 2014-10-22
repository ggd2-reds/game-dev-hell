package  
{
	import org.flixel.*;
	
	public class WavyBullet extends BulletBase
	{
		private var theta:Number;
		private var centerX:Number;
		
		public function WavyBullet(X:Number, Y:Number, image:Class, directionUp:Boolean, speed:Number=400) {
			super (X, Y, image, directionUp, speed);
			this.theta = 0.0;
			this.centerX = X;
		}
		
		public override function update():void {
			this.x = this.centerX + speed/20 * Math.sin(theta);
			theta += speed / 2000;
			
			super.update();
		}
	}

}