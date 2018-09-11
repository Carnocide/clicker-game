package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
	
	/**
	  * This is the document level class that runs our entire game.
	  */
	public class Game extends MovieClip {
		
		var score:int = 0
		var resetButton:ResetButton;
		var thingy:CoolThing;
		var song:Song;
		/** The Constructor of the Game class. */
		public function Game() {
			addEventListener(Event.ENTER_FRAME, gameLoop);
			addEventListener("RESET_GAME", resetGame);
			//resetbutton
			thingy = new CoolThing();
			addChild(thingy);
			thingy.x = this.stage.stageWidth / 2;
			thingy.y = this.stage.stageHeight / 4;
			resetButton = new ResetButton(thingy);
			resetButton.y = this.stage.stageHeight;
			song = new Song;
			song.play(0, 100, new SoundTransform(0.1, 0));
			
			
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
			
			var acceptableRangeFromHoopXToScorePoints = (hoop.width / 2); 
			if (!hoop.hasScored && (thingy.y <= hoop.y + thingy.velocityY && thingy.y >= hoop.y - thingy.velocityY) && thingy.x <= (hoop.x + acceptableRangeFromHoopXToScorePoints) && thingy.x >= (hoop.x - acceptableRangeFromHoopXToScorePoints))
			{
				this.score += 100
				hoop.reposition();
			}
			scoreText.text = "SCORE: " + this.score;
			if (thingy.isOutOfBounds) 
			{
				addChild(resetButton);
				
				resetButton.x = (stage.stageWidth / 2);
				resetButton.y = (stage.stageHeight / 2);
				gameOver.x = (stage.stageWidth / 2);
				gameOver.y = (stage.stageHeight / 4);
				
			}
			
			// 4. draw everything
			
		} // gameLoop
		
		/**
		* Resets the game to the state it should have at the start of the game
		* @param e The event object that is triggering this event-handler.
		* @return returns void
		*/
		function resetGame(e:Event):void {
			thingy.reset();
			score = 0;
			gameOver.y = -100;
			resetButton.y = stage.stageHeight + (.5 * resetButton.height);
		}
		


	} // Game class
	
}// package
