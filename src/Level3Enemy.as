package  
{
	public class Level3Enemy extends BaseEnemy 
	{
		import org.flixel.*;
		import mx.collections.ArrayList;
		
		[Embed(source="../assets/Enemy3.png")]
		public var image : Class;
		
		//bullet vars
		[Embed(source = "../assets/Level2EnemyBullet.png")]
		private var bulletImage : Class;
		private var bulletDropSpeed:Number;
		private var bulletExpandSpeed:Number;
		
		public function Level3Enemy(X:Number=0, Y:Number=0) {
			super(X, Y - 50, this.image, 5, "God");
			this.bulletDropSpeed = 10; // Value controls how fast the bullets fall
			this.bulletExpandSpeed = 2; // Value that controls how fast the bullets expand and rotate			
		}
		
		public override function update():void {
			super.update();
		}
		
		protected override function createBullets(x:Number, y:Number):ArrayList {
			var bullets:ArrayList = new ArrayList();
			bullets.addItem(new CircleBullet(x + 40, y, bulletImage, false, 5, bulletExpandSpeed, bulletDropSpeed));
			return bullets;
		}
		
		protected override function checkHealth():void {
			if ((health <= 80) && (currentBulletCoolDown > bulletCoolDown - 100)) {
				currentBulletCoolDown = bulletCoolDown - 100;
				bulletCoolDownTimer.delay = currentBulletCoolDown;
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
				bulletDropSpeed = 5;
				bulletExpandSpeed *= 1.5;
			}
			else if ((health <= 50) && (currentBulletCoolDown > bulletCoolDown - 200)) {
				currentBulletCoolDown = bulletCoolDown - 200;
				bulletCoolDownTimer.delay = currentBulletCoolDown;
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
				bulletDropSpeed = 2;
				bulletExpandSpeed *= 1.2;
			}
			else if ((health <= 30) && (currentBulletCoolDown > bulletCoolDown - 300)) {
				currentBulletCoolDown = bulletCoolDown - 300;
				bulletCoolDownTimer.delay = currentBulletCoolDown;
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
				bulletDropSpeed = 1;
				bulletExpandSpeed *= 0.75;
			}
		}
		
		public override function getBullets(): ArrayList {
			var circleBullets:ArrayList = new ArrayList();
			for (var i:int = 0; i < bullets.length; ++i) {
				var b:ArrayList = bullets.getItemAt(i).getBullets();
				for (var j:int = 0; j < b.length; ++j) {
					circleBullets.addItem(b.getItemAt(j));
				}
			}
			return circleBullets;
		}
		
	}

}