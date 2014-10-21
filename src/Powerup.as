package  
{
	import org.flixel.*;
	import flash.utils.Timer;
	import flash.events.*;
	
	public class Powerup extends FlxSprite 
	{
		private var player:Player;
		private var xSpeed:Number;
		private var ySpeed:Number;
		private const duration:Number = 3 * 1000;
		private var timer:Timer;
		
		public function Powerup(player:Player, xSpeed:Number, ySpeed:Number, 
								X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			this.player = player;
			this.xSpeed = xSpeed;
			this.ySpeed = ySpeed;
			this.timer = new Timer(duration, 1);
			this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, powerupExpired);
		}
		
		public override function update():void {
			this.x += xSpeed;
			this.y += ySpeed;
			if (this.y > FlxG.height + this.height) {
				super.kill();
			}
			FlxU.overlap(this.player, this, powerUp);
		}
		
		private function powerUp(object1:FlxObject,object2:FlxObject):void {
			this.visible = false;
			powerUpPlayer(player);
			this.timer.start();
		}
		
		protected function powerUpPlayer(player:Player):void {
			/// OVERRIDE THIS FUNCTION IN A BASE CLASS!!!
		}
		
		private function powerupExpired(e:Event):void {
			this.kill();
			resetPlayer(player);
		}
		
		protected function resetPlayer(player:Player):void {
			// OVERRIDE THIS FUNCTION IN A BASE CLASS!!!
		}
	}

}