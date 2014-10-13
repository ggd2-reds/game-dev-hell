package  
{
	import flash.events.TimerEvent;
	import org.flixel.*;
	import mx.collections.ArrayList;
	import flash.utils.Timer;
	import flash.events.*;
	
	public class Level2Enemy extends FlxSprite
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
		private const bulletCoolDown:Number = 600;
		private var currentBulletCoolDown:Number;
		private var bulletCoolDownTimer:Timer;
		private var bulletSpeed:Number;
		
		private function bulletCoodDownTimerExpired(e:Event):void {
			this.canFire = true;
		}
		
		public function Level2Enemy(X:Number, Y:Number) {
			super (X, Y, this.image);
			this.goLeft = false;
			this.bullets = new ArrayList();
			this.health = 100;
			this.bulletSpeed = 450;
			
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
			health -= 10;
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
		
		private function updateBullets():void {
			if (canFire) {
				this.canFire = false;

				var bullet:WavyBullet = new WavyBullet(x + width / 4, y + height, bulletImage, false, bulletSpeed);
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