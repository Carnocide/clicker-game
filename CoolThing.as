package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class CoolThing extends MovieClip {
		
		
		/** the x-component of the acceleration pixels/ttick/tick; */
		var accelerationX:Number = 0;
		/** the y-component of the acceleration pixels/ttick/tick; */
		var accelerationY:Number = 0.25;

		/** The x component of velocity in pixels/tick. */
		var velocityX:Number = 0;
		/** The y-component of velocity in pixels/tick. */
		var velocityY:Number = 0;
		
		/** Rotational velocity in degrees/tick; */
		var velocityR:Number = 1;
		
	    public var unscoredPoints:int = 0;
		
		public var isOutOfBounds:Boolean = false;
		
		public function CoolThing() {
			this.addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function update():void {
			
			velocityX += accelerationX;
			velocityY += accelerationY;
			
			this.x += velocityX;
			this.y += velocityY;
			this.rotation += velocityR;
			
			if(this.x <= 0 || this.x >= stage.stageWidth)
			{
				this.velocityX *= -1
			}
			if (this.y >= stage.stageHeight + .5 * this.height)
			{
				this.isOutOfBounds = true;
			}
		}
		
		/**
		* This function is called when the 'thingy' is clicked. Neato.
		* @Param e The MouseEvent object that is triggering this event-handler.
		*/
		function handleClick(e:MouseEvent):void {
			this.velocityX = Math.random() * 20 + -10; //-10 to 10;
			this.velocityY = -10;
			this.velocityR = Math.random() * 100 - 50; // -2 to 2;
			this.unscoredPoints = 100;
			
			var blip:SoundBlip = new SoundBlip
			blip.play();
		}
	}
	
}
