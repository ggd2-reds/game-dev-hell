package 
{
	import org.flixel.*;
	import mx.collections.ArrayList;

	public class Player extends FlxSprite
	{
		[Embed(source="../assets/Player.png")]
		public var image : Class;
		
		private const speed:Number = 200;
		
		//bullet vars
		[Embed(source = "../assets/PlayerBullet.png")]
		public var bulletImage : Class;
		private const maxBullets:Number = 3;
		private var bullets:ArrayList;
		private var framesSinceLastBullet:Number;
		private const bulletCoolDown:Number = 15;
		
		
		public function Player( X:Number, Y:Number) {
			super(X, Y, this.image);
			this.bullets = new ArrayList();
			this.framesSinceLastBullet = 0;
			this.health = 100;
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
			
			++this.framesSinceLastBullet;
			
			// Check for bullets
			if (FlxG.keys.SPACE) {
				fireBullet();
			}
			
			deleteBullets();
			
			super.update();
		}
		
		public function getBullets(): ArrayList {
			return this.bullets;
		}
		
		public override function kill():void {
			health -= 50;
			if (health <= 0) {
				super.kill();
				visible = false;
			}
		}
		
		private function fireBullet():void {
			if ((bullets.length < 3) && this.framesSinceLastBullet >= this.bulletCoolDown){
				var bullet:Bullet = new Bullet(x + width/4, y, bulletImage, true);
				FlxG.state.add(bullet);
				bullets.addItem(bullet);
				this.framesSinceLastBullet = 0;
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
