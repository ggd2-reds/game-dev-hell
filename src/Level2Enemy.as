package  
{
	import mx.collections.ArrayList;
	import org.flixel.*;
	
	public class Level2Enemy extends BaseEnemy
	{
		[Embed(source="../assets/Enemy2.png")]
		public var image : Class;

		//bullet vars
		[Embed(source = "../assets/Level2EnemyBullet.png")]
		private var bulletImage : Class;
		
		public function Level2Enemy(X:Number, Y:Number) {
			super (X, Y, this.image, 7.5, "Cliffy B");
		}

		protected override function createBullets(x:Number, y:Number):ArrayList {
			var bullets:ArrayList = new ArrayList();
			bullets.addItem(new WavyBullet(this.x + (4 * width / 5), y, this.bulletImage, false, bulletSpeed));
			bullets.addItem(new WavyBullet(this.x + (width / 5), y, this.bulletImage, false, bulletSpeed));
			return bullets;
		}
		
		protected override function changeDirection():void {
			if (x <= -20) {
				goLeft = false;
			}
			else if (x >= (FlxG.width - width + 20)) {
				goLeft = true;
			}
		}
		
		protected override function checkHealth():void {
			if ((health <= 80) && (currentBulletCoolDown > bulletCoolDown - 100)) {
				currentBulletCoolDown = bulletCoolDown - 100;
				bulletCoolDownTimer.delay = currentBulletCoolDown;
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
				bulletSpeed += 200;
			}
			else if ((health <= 50) && (currentBulletCoolDown > bulletCoolDown - 200)) {
				currentBulletCoolDown = bulletCoolDown - 200;
				bulletCoolDownTimer.delay = currentBulletCoolDown;
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
				bulletSpeed += 100;
			}
			else if ((health <= 30) && (currentBulletCoolDown > bulletCoolDown - 300)) {
				currentBulletCoolDown = bulletCoolDown - 300;
				bulletCoolDownTimer.delay = currentBulletCoolDown;
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
				bulletSpeed += 100;
			}
		}		
	}

}