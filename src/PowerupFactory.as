package  
{
	public class PowerupFactory 
	{
		import org.flixel.*;
		import flash.utils.Timer;
		import flash.events.*;
		
		private var state:BaseLevelState;
		private var player:Player;
		private var powerupTimer:Timer;
		private const powerUpCoolDownMin:int = 4 * 1000;
		private const powerUpCoolDownMax:int = 6 * 1000;
		
		private function generatePowerup(e:Event):void {
			this.powerupTimer.delay = Random.generate(powerUpCoolDownMin, powerUpCoolDownMax);
			var direction:int = Random.generate(0, 1);
			
			// Set the X values
			var x:Number;
			var xSpeed:int = Random.generate(2, 5);
			if (direction == 0) {
				x = 0;
			}
			else if (direction == 1) {
				x = FlxG.width;
				xSpeed = -xSpeed;
			}
			
			// Set the Y values
			var y:Number = Random.generate(0, FlxG.height / 2);
			var ySpeed:int = Random.generate(2, 5);
			
			var powerup:int= Random.generate(0, 3);
			if (powerup == 0) {
				this.state.add(new RapidFirePowerUp(player, xSpeed, ySpeed, state, x, y));
			}
			else if (powerup == 1) {
				this.state.add(new InvinciblePowerup(player, xSpeed, ySpeed, state, x, y));
			}
			else if (powerup == 2) {
				this.state.add(new HealthPowerup(player, xSpeed, ySpeed, state, x, y));
			}
			else {
				this.state.add(new WavyBulletPowerup(player, xSpeed, ySpeed, state, x, y));
			}
		}

		public function PowerupFactory(state:BaseLevelState, player:Player) 
		{
			this.state = state;
			this.player = player;
			this.powerupTimer = new Timer(Random.generate(powerUpCoolDownMin, powerUpCoolDownMax), 0);
			this.powerupTimer.addEventListener(TimerEvent.TIMER, generatePowerup);
			this.powerupTimer.start();
		}
	}

}