package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	  * This is the document level class that runs our entire game.
	  */
	public class Game extends MovieClip {
		
		var score:int = 0
		
		/** The Constructor of the Game class. */
		public function Game() {
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		/** 
		  * This is our game loop. 
		  * It is an event-handler function that runs on the ENTER_FRAME event.
		  * @param e The Event object that is triggering this event-handler.
		  * @return returns void
		*/
		function gameLoop(e:Event):void {
			// 1. measure how much time has passed
			// 2. get user input
			// 3. update everything
			
			thingy.update();
			score += thingy.unscoredPoints;
			thingy.unscoredPoints = 0;
			scoreText.text = "SCORE: " + this.score;
			
			if (thingy.isOutOfBounds) 
			{
				//game over
				trace("game over")
			}
			
			// 4. draw everything
			
		} // gameLoop

	} // Game class
	
}// package
