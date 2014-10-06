package 
{
	import org.flixel.*;
	import mx.collections.ArrayList;

	public class Enemy extends FlxSprite
	{
		[Embed(source="../assets/Enemy.png")]
		public var image : Class;
		
		private const speed:Number = 200;
		
		private var goLeft:Boolean;
		
		
		//bullet vars
		[Embed(source = "../assets/EnemyBullet.png")]
		public var bulletImage : Class;
		private var bullets:ArrayList;
		private var framesSinceLastBullet:Number;
		private const bulletCoolDown:Number = 15;
		
		public function Enemy(X:Number, Y:Number) {
			super (X, Y, this.image);
			this.goLeft = true;
			this.bullets = new ArrayList();
			this.framesSinceLastBullet = 0;
			this.health = 100;
		}
		
		public override function update():void {
			
			if (this.goLeft) {
				velocity.x = -speed;
			}
			else {
				velocity.x = speed;
			}
			
			if (x <= 0) {
				goLeft = false;
			}
			else if (x >= (FlxG.width - width)) {
				goLeft = true;
			}
			
			updateBullets();
			deleteBullets();
			super.update();
		}
		
		public function getBullets(): ArrayList {
			return this.bullets;
		}
		
		public override function kill():void {
			health -= 10;
			if (health <= 0) {
				super.kill();
				visible = false;
			}
		}
		
		private function updateBullets():void {
			++this.framesSinceLastBullet;
			if (this.framesSinceLastBullet >= this.bulletCoolDown) {
				var bullet:Bullet = new Bullet(x + width / 4, y + height, bulletImage, false);
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