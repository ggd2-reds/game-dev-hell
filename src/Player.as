package 
{
	import org.flixel.*;
	import mx.collections.ArrayList;
	import flash.utils.Timer;
	import flash.events.*;

	public class Player extends FlxSprite
	{
		[Embed(source="../assets/Player.png")]
		public var image : Class;
		
		private const speed:int = 500;
		
		private const damangeCost:int = 35;
		
		//Powerup vars
		private var isWavyBullet:Boolean;
		private var isImmune:Boolean;
		
		//bullet vars
		[Embed(source = "../assets/PlayerBullet.png")]
		public var bulletImage : Class;
		private var maxBullets:int = 3;
		private var bullets:ArrayList;
		private var canFire:Boolean;
		private var bulletCoolDown:int = 400;		
		private var bulletCoolDownTimer:Timer;
		
		private function bulletCoodDownTimerExpired(e:Event):void {
			this.canFire = true;
		}
		
		public function Player( X:Number, Y:Number) {
			super(X, Y, this.image);
			this.bullets = new ArrayList();
			this.health = 100;
			this.isWavyBullet = false;
			this.isImmune = false;
			
			bulletCoolDownTimer = new Timer(bulletCoolDown, 0);
			bulletCoolDownTimer.addEventListener(TimerEvent.TIMER, bulletCoodDownTimerExpired);
			bulletCoolDownTimer.start();
		}
		
		public override function update():void {
			updatePosition();
			
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
			if (!isImmune) {
				this.health = this.health - damangeCost;
				if (health <= 0) {
					super.kill();
					visible = false;
				}
			}
		}
		
		private function updatePosition():void {
			velocity.x = 0;
			velocity.y = 0;
			
			
			// Set the speed
			if ((FlxG.keys.LEFT && FlxG.keys.UP) || (FlxG.keys.A && FlxG.keys.W)) {
				velocity.x = -speed;
				velocity.y = -speed;
			}
			else if ((FlxG.keys.RIGHT && FlxG.keys.UP) || (FlxG.keys.D && FlxG.keys.W)) {
				velocity.x = speed;
				velocity.y = -speed;
			}
			else if ((FlxG.keys.LEFT && FlxG.keys.DOWN) || (FlxG.keys.A && FlxG.keys.S)) {
				velocity.x = -speed;
				velocity.y = speed;
			}
			else if ((FlxG.keys.RIGHT && FlxG.keys.DOWN) || (FlxG.keys.D && FlxG.keys.S) ) {
				velocity.x = speed;
				velocity.y = speed;
			}
			else if (FlxG.keys.LEFT || FlxG.keys.A) {
				velocity.x = -speed;
			}
			else if (FlxG.keys.RIGHT || FlxG.keys.D) {
				velocity.x = speed;
			}
			else if (FlxG.keys.UP || FlxG.keys.W) {
				velocity.y = -speed;
			}
			else if (FlxG.keys.DOWN || FlxG.keys.S) {
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
			
		}
		
		private function fireBullet():void {
			if ((bullets.length < this.maxBullets) && canFire) {
				canFire = false;

				var bullet:BulletBase; 
				if (isWavyBullet) {
					bullet = new WavyBullet(x + width, y, bulletImage, true);
				}
				else {
					bullet = new Bullet(x + width / 4, y, bulletImage, true);
				}
				FlxG.state.add(bullet);
				bullets.addItem(bullet);
				
				bulletCoolDownTimer.reset();
				bulletCoolDownTimer.start();
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
		
		public function activateRapidFire():void {
			this.bulletCoolDown = 200;
			this.bulletCoolDownTimer.delay = this.bulletCoolDown;
			this.maxBullets = 10;
		}
		
		public function stopRapidFire():void {
			this.bulletCoolDown = 400;
			this.bulletCoolDownTimer.delay = this.bulletCoolDown;
			this.maxBullets = 3;
		}
		
		public function setWavyBullet(turnOn:Boolean):void {
			this.isWavyBullet = turnOn;
		}
		
		public function setImmune(turnOn:Boolean):void {
			this.isImmune = turnOn;
		}
		
		public function heal():void {
			this.health = this.health + damangeCost;
		}
	}
}
