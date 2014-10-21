package  
{
	import flash.events.TimerEvent;
	import org.flixel.*;
	import mx.collections.ArrayList;
	import flash.utils.Timer;
	import flash.events.*;
	
	public class Level3Enemy extends FlxSprite 
	{
		
		[Embed(source="../assets/Enemy.png")]
		public var image : Class;
		
		private const speed:Number = 200;
		
		private var goLeft:Boolean;
		
		//bullet vars
		[Embed(source = "../assets/Level2EnemyBullet.png")]
		public var bulletImage : Class;
		private var bullets:ArrayList;
		private var canFire:Boolean;
		private const bulletCoolDown:Number = 800;
		private var currentBulletCoolDown:Number;
		private var bulletCoolDownTimer:Timer;
		private var bulletDropSpeed:Number;
		private var bulletExpandSpeed:Number;
		
		private function bulletCoodDownTimerExpired(e:Event):void {
			this.canFire = true;
		}
		
		
		public function Level3Enemy(X:Number=0, Y:Number=0) {
			super(X, Y, this.image);
			this.goLeft = false;
			this.bullets = new ArrayList();
			this.health = 100;
			this.bulletDropSpeed = 10; // Value controls how fast the bullets fall
			this.bulletExpandSpeed = 2; // Value that controls how fast the bullets expand and rotate
			
			this.currentBulletCoolDown = bulletCoolDown;
			
			bulletCoolDownTimer = new Timer(currentBulletCoolDown, 0);
			bulletCoolDownTimer.addEventListener(TimerEvent.TIMER, bulletCoodDownTimerExpired);
			bulletCoolDownTimer.start();
		}
		
		public override function update():void {
			checkHealth();
			updatePosition();
			updateBullets();
			deleteBullets();
			super.update();
		}
		
		public function getBullets(): ArrayList {
			return this.bullets;
		}
		
		public override function kill():void {
			health -= 5;
			if (health <= 0) {
				super.kill();
				visible = false;
			}
		}
		
		private function updatePosition():void {
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
		}
		
		private function checkHealth():void {
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
		
		private function updateBullets():void {
			if (canFire) {
				this.canFire = false;

				var bullet:CircleBullet = new CircleBullet(x + width / 4, y + height, bulletImage, false, 5, bulletExpandSpeed, bulletDropSpeed);
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