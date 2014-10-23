package  
{
	import flash.events.TimerEvent;
	import org.flixel.*;
	import mx.collections.ArrayList;
	import flash.utils.Timer;
	import flash.events.*;
	
	public class BaseEnemy extends FlxSprite 
	{
		private const speed:Number = 200;
		
		protected var goLeft:Boolean;
		
		private var damangeAmount:int;
		
		//bullet vars
		protected var bullets:ArrayList;
		protected var canFire:Boolean;
		protected const bulletCoolDown:Number = 600;
		protected var currentBulletCoolDown:Number;
		protected var bulletCoolDownTimer:Timer;
		protected var bulletSpeed:Number;
		
		protected var enemyName:String;
		
		private function bulletCoodDownTimerExpired(e:Event):void {
			this.canFire = true;
		}
		
		public function BaseEnemy(X:Number, Y:Number, enemyGraphic:Class, damageAmount:int, enemyName:String) 
		{
			super(X, Y, enemyGraphic);
			
			this.goLeft = true;
			this.bullets = new ArrayList();
			this.health = 100;
			this.bulletSpeed = 450;
			this.damangeAmount = damageAmount;
			this.enemyName = enemyName;
			
			this.currentBulletCoolDown = bulletCoolDown;
			
			bulletCoolDownTimer = new Timer(currentBulletCoolDown, 0);
			bulletCoolDownTimer.addEventListener(TimerEvent.TIMER, bulletCoodDownTimerExpired);
			bulletCoolDownTimer.start();
		}
		
		protected function checkHealth():void {
			// OVERRIDE THIS IN BASE CLASS!!!!
		}
		
		protected function changeDirection():void {
			if (x <= 0) {
				goLeft = false;
			}
			else if (x >= (FlxG.width - width)) {
				goLeft = true;
			}
		}
		
		private function updatePosition():void {
			if (this.goLeft) {
				velocity.x = -speed;
			}
			else {
				velocity.x = speed;
			}
			
			changeDirection();
		}

		protected function createBullets(x:Number, y:Number):ArrayList {
			// OVERRIDE THIS IN BASE CLASS!!!
			return null;
		}
		
		protected function updateBullets():void {
			if (canFire) {
				this.canFire = false;

				var bullet:ArrayList = createBullets(x + width / 4, y + height);
				for (var i:int; i < bullet.length; ++i) {
					FlxG.state.add(BulletBase(bullet.getItemAt(i)));
					bullets.addItem(bullet.getItemAt(i));
				}
			}
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
		
		public function getName():String {
			return enemyName;
		}
		
		public override function kill():void {
			health -= damangeAmount;
			if (health <= 0) {
				super.kill();
				visible = false;
			}
		}
		
		protected function deleteBullets():void {
			for (var i:Number = 0; i < bullets.length; ++i) {
				if (bullets.getItemAt(i).dead) {
					bullets.removeItemAt(i);
					--i;
				}
			}
		}
	}

}