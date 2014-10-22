package  
{
	public class RapidFirePowerUp extends Powerup 
	{
		[Embed(source = "../assets/RapidFirePowerup.png")]
		private var image:Class;

		public function RapidFirePowerUp(player:Player, xSpeed:Number, ySpeed:Number, X:Number=0, Y:Number=0) 
		{
			super(player, xSpeed, ySpeed, X, Y, image);
		}
		
		protected override function powerUpPlayer(player:Player):void {
			player.activateRapidFire();
		}
		
		protected override function resetPlayer(player:Player):void {
			player.stopRapidFire();
		}
	}

}