package  
{
	public class PowerupFactory 
	{
		import org.flixel.*;
		import flash.utils.Timer;
		import flash.events.*;
		
		private var state:FlxState;
		private var player:Player;
		private var powerupTimer:Timer;
		private const powerUpCoolDownMin:Number = 7 * 1000;
		private const powerUpCoolDownMax:Number = 10 * 1000;
		
		private function generatePowerup(e:Event):void {
			this.powerupTimer.delay = Random.generate(powerUpCoolDownMin, powerUpCoolDownMax);
			var direction:Number = Random.generate(0, 1);
			
			// Set the X values
			var x:Number;
			var xSpeed:Number = Random.generate(2, 5);
			if (direction == 0) {
				x = 0;
			}
			else if (direction == 1) {
				x = FlxG.width;
				xSpeed = -xSpeed;
			}
			
			// Set the Y values
			var y:Number = Random.generate(0, FlxG.height / 2);
			var ySpeed:Number = Random.generate(2, 5);
			
			var powerup:int= Random.generate(0, 2);
			if (powerup == 0) {
				this.state.add(new RapidFirePowerUp(player, xSpeed, ySpeed, x, y));
			}
			else if (powerup == 1) {
				this.state.add(new InvinciblePowerup(player, xSpeed, ySpeed, x, y));
			}
			else {
				this.state.add(new WavyBulletPowerup(player, xSpeed, ySpeed, x, y));
			}
		}

		public function PowerupFactory(state:FlxState, player:Player) 
		{
			this.state = state;
			this.player = player;
			this.powerupTimer = new Timer(Random.generate(powerUpCoolDownMin, powerUpCoolDownMax), 0);
			this.powerupTimer.addEventListener(TimerEvent.TIMER, generatePowerup);
			this.powerupTimer.start();
		}
	}

}