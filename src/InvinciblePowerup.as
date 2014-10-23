package  
{
	public class InvinciblePowerup extends Powerup 
	{
		[Embed(source = "../assets/invinciblePowerup.png")]
		private var image:Class;

		public function InvinciblePowerup(player:Player, xSpeed:Number, ySpeed:Number, state:BaseLevelState, X:Number=0, Y:Number=0) 
		{
			super(player, xSpeed, ySpeed, state, "Thick Skin!", X, Y, image);
		}
		
		protected override function powerUpPlayer(player:Player):void {
			player.setImmune(true);
		}
		
		protected override function resetPlayer(player:Player):void {
			player.setImmune(false);
		}
	}

}