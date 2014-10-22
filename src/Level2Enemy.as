package  
{
	public class Level2Enemy extends BaseEnemy
	{
		[Embed(source="../assets/Enemy.png")]
		public var image : Class;

		//bullet vars
		[Embed(source = "../assets/Level2EnemyBullet.png")]
		private var bulletImage : Class;
		
		public function Level2Enemy(X:Number, Y:Number) {
			super (X, Y, this.image, 7.5, "Metacritic");
		}

		protected override function createBullet(x:Number, y:Number):BulletBase {
			return new WavyBullet(x, y, this.bulletImage, false, bulletSpeed);
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