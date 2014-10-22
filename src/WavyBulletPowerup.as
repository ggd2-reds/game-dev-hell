package  
{
	public class WavyBulletPowerup extends Powerup 
	{
		[Embed(source = "../assets/WavyBulletPowerUp.png")]
		private var image:Class;

		public function WavyBulletPowerup(player:Player, xSpeed:Number, ySpeed:Number, X:Number=0, Y:Number=0) 
		{
			super(player, xSpeed, ySpeed, X, Y, image);
		}
		
		protected override function powerUpPlayer(player:Player):void {
			player.setWavyBullet(true);
		}
		
		protected override function resetPlayer(player:Player):void {
			player.setWavyBullet(false);
		}
		
	}

}