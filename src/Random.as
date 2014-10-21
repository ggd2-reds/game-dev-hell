package  
{
	public class Random 
	{
		public static function generate(min:Number, max:Number):int {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
		
	}

}