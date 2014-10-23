package  
{
	import org.flixel.*;
	import mx.collections.ArrayList;
	
	public class CircleBullet extends BulletBase 
	{
		private var radius:Number;
		private var theta:Number;
		private var delta:Number;
		private var expandSpeed:Number;
		
		public function CircleBullet(X:Number, Y:Number, image:Class, directionUp:Boolean, numBullets:Number, expandSpeed:Number, speed:Number=10)
		{
			super (X, Y, null, directionUp, speed, true);
			this.expandSpeed = expandSpeed;

			this.bullets = new ArrayList();
			for (var i:Number = 0; i < numBullets; ++i) {
				var bullet:Bullet = new Bullet(X, Y, image, directionUp, 0);
				bullets.addItem(bullet);
				FlxG.state.add(bullet);
				
				this.radius = 0;
				this.theta = 0;
				this.delta = 2 * Math.PI / numBullets;
			}
			
			this.visible = false;
		}

		public override function update():void {
			var vel:Number;
			
			if (directionUp) {
				vel = -speed;
			}
			else {
				vel = speed;
			}
			velocity.y += vel;
			
			for (var i:Number = 0; i < this.bullets.length; ++i) {
				bullets.getItemAt(i).x = radius * Math.cos(theta + (delta * i)) + x;
				bullets.getItemAt(i).y = radius * Math.sin(theta + (delta * i)) + y;
			}
			theta += 1 / (expandSpeed * 50);
			radius += expandSpeed;
			
			if ((y - radius) >= FlxG.height) {
				bullets.removeAll();
				super.kill();
			}
			
			superUpdate();
		}	
	}

}