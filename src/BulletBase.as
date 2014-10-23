package  
{
	import org.flixel.*;
	import mx.collections.ArrayList;

	public class BulletBase extends FlxSprite 
	{
		protected var speed:Number;
		protected var directionUp:Boolean;
		protected var bullets:ArrayList; // Used for bullet groups
		
		public function BulletBase(X:Number = 0, Y:Number = 0, image:Class = null, 
								   directionUp:Boolean = false, speed:Number = 400,
								   isBulletGroup:Boolean = false) 
		{
			super(X, Y, image);
			this.speed = speed;
			this.directionUp = directionUp;
			
			if (!isBulletGroup) {
				this.bullets = new ArrayList();
				this.bullets.addItem(this);
			}
		}
		
		protected function goUp():void {
			velocity.y = -speed;
			if ((y + height) < 0) {
				kill();
			}
		}
		
		protected function goDown():void {
			velocity.y = speed;
			if (y >= FlxG.height) {
				kill();
			}
		}
		
		public function superUpdate():void {
			super.update();
		}
		
		public override function update():void {
			if (directionUp) {
				goUp();
			}
			else {
				goDown();
			}
			
			super.update();
		}
		
		public function get Speed():Number {
			return this.speed;
		}
		
		public function getBullets(): ArrayList {
			return this.bullets;
		}		
		
	}

}