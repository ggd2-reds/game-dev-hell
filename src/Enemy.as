package 
{
	import org.flixel.*;

	public class Enemy extends FlxSprite
	{
		[Embed(source="../assets/Enemy.png")]
		public var image : Class;
		
		private const speed:Number = 200;
		
		private var goLeft:Boolean;
		
		public function Enemy(X:Number, Y:Number) {
			super (X, Y, this.image);
			this.goLeft = true;
		}
		
		public override function update():void {
			
			if (this.goLeft) {
				velocity.x = -speed;
			}
			else {
				velocity.x = speed;
			}
			
			if (x <= 0) {
				goLeft = false;
			}
			else if (x >= (FlxG.width - width)) {
				goLeft = true;
			}
			
			super.update();
		}
	}
	
}