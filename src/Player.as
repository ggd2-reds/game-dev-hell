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
		
		private const speed:Number = 200;
		
		//bullet vars
		[Embed(source = "../assets/PlayerBullet.png")]
		public var bulletImage : Class;
		private const maxBullets:Number = 3;
		private var bullets:ArrayList;
		private var canFire:Boolean;
		private var bulletCoolDown:Number = 800;		
		private var bulletCoolDownTimer:Timer;
		
		private function bulletCoodDownTimerExpired(e:Event):void {
			this.canFire = true;
		}
		
		public function Player( X:Number, Y:Number) {
			super(X, Y, this.image);
			this.bullets = new ArrayList();
			this.health = 100;
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
			health -= 50;
			if (health <= 0) {
				super.kill();
				visible = false;
			}
		}
		
		private function updatePosition():void {
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
			
		}
		
		private function fireBullet():void {
			if ((bullets.length < 3) && canFire) {
				canFire = false;

				var bullet:Bullet = new Bullet(x + width/4, y, bulletImage, true);
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
	}
	
}
