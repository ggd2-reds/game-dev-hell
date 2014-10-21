package  
{
	import com.dborisenko.api.twitter;
	import com.dborisenko.api.twitter.net.TwitterOperation;
	import com.dborisenko.api.twitter.TwitterAPI;

	public class Tweets 
	{
		/////
		// Static functions/vars
		/////
		private static var instance:Tweets = null;
		
		public static function getInstance():Tweets {
			if (instance == null) {
				instance = new Tweets();
			}
			return instance;
		}
		
		/////
		// Member functions/vars
		/////	
		private var twitter:TwitterAPI;
		
		private function Tweets() 
		{
			this.twitter = new TwitterAPI();
		}
		
		public function loadTweets():void {
		}
		
	}

}