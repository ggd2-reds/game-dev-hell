package 
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source="../assets/Player.png")]
		public var image : Class;
		
		private const speed:Number = 200;
		
		public function Player( X:Number, Y:Number) {
			super(X, Y, this.image);
		}
		
		public override function update():void {
			
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
			else if (this.y <= 0) {
				y = 0;
			}
			
			super.update();
		}
	}
	
}