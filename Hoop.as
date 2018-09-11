package  {
	
	import flash.display.MovieClip;
	
	
	public class Hoop extends MovieClip {
		
		var hasScored:Boolean;
		
		/**
		* Constructor for the Hoop Object
		*/
		public function Hoop() {
			hasScored = false;
		}
		
		/**
		* Called when the ball goes through the hoop. Moves the hoop to a new position
		*/
		public function reposition():void {
			this.hasScored = true;
			var range = this.width / 2;
			
			this.x = Math.random() * (this.stage.stageWidth - range);
			
			this.hasScored = false;
			
		}
	}
	
}
