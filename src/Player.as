package 
{
	import org.flixel.*;
	import mx.collections.ArrayList;

	public class Player extends FlxSprite
	{
		[Embed(source="../assets/Player.png")]
		public var image : Class;
		
		[Embed(source = "../assets/PlayerBullet.png")]
		public var bulletImage : Class;
		
		private const speed:Number = 200;
		
		private const maxBullets:Number = 3;
		
		private var bullets:ArrayList;
		
		public function Player( X:Number, Y:Number) {
			super(X, Y, this.image);
			this.bullets = new ArrayList();
		}
		
		public override function update():void {
			
			velocity.x = 0;
			velocity.y = 0;
			
			
			// Set the speed
			if (FlxG.keys.LEFT) {
				velocity.x = -speed;
			}
			else if (FlxG.keys.RIGHT) {
				velocity.x = speed;
			}
			else if (FlxG.keys.UP) {
				velocity.y = -speed;
			}
			else if (FlxG.keys.DOWN) {
				velocity.y = speed;
			}
			
			//Limit the position
			if (this.x >= (FlxG.width - width)) {
				x = FlxG.width - width;
			}
			else if (this.x <= 0) {
				x = 0;
			}
			if (this.y >= (FlxG.height - height)) {
				y = FlxG.height - height;
			}
			else if (this.y <= FlxG.height / 2) {
				y = FlxG.height / 2;
			}
			
			// Check for bullets
			if (FlxG.keys.SPACE) {
				fireBullet();
			}
			
			deleteBullets();
			
			super.update();
		}
		
		private function fireBullet():void {
			if (bullets.length < 3 ){
				var bullet:Bullet = new Bullet(x + width/4, y, bulletImage, true);
				FlxG.state.add(bullet);
				bullets.addItem(bullet);
			}
		}
		
		private function deleteBullets():void {
			for (var i:Number = 0; i < bullets.length; ++i) {
				if (bullets.getItemAt(i).dead) {
					bullets.removeItemAt(i);
					--i;
				}
			}
		}
	}
	
}
