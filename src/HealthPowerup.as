package  
{
	public class HealthPowerup extends Powerup 
	{
		[Embed(source = "../assets/HealthPowerup.png")]
		private var image:Class;
		public function HealthPowerup(player:Player, xSpeed:Number, ySpeed:Number, X:Number=0, Y:Number=0) 
		{
			super(player, xSpeed, ySpeed, X, Y, image);	
		}
	
		protected override function powerUpPlayer(player:Player):void {
			player.heal();
		}
	}

}