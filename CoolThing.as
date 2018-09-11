package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class CoolThing extends MovieClip {
		
		
		/** the x-component of the acceleration pixels/ttick/tick; */
		var accelerationX:Number = 0;
		/** the y-component of the acceleration pixels/ttick/tick; */
		var accelerationY:Number = 0.06;

		/** The x component of velocity in pixels/tick. */
		var velocityX:Number = 0;
		/** The y-component of velocity in pixels/tick. */
		var velocityY:Number = 0;
		
		/** Rotational velocity in degrees/tick; */
		var velocityR:Number = 1;
		var constWidth:Number;
		
	    public var unscoredPoints:int = 0;
		
		public var isOutOfBounds:Boolean = false;
		
		/** 
		* Constructor for CoolThing
		*/
		public function CoolThing() {
			this.constWidth = this.width;
			this.addEventListener(MouseEvent.MOUSE_DOWN, handleClick)
		}
		
		/**
		* Updates the CoolThing object
		*/
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
				this.accelerationY = 0;
				this.velocityY = 0;
			}
		}
		
		/**
		* This function is called when the 'thingy' is clicked. Neato.
		* Changes the X velocity depending on how far from the center you click the circle. Is NOT random. 
		* This allows you to control the ball and try to make it in the hoop.
		* @Param e The MouseEvent object that is triggering this event-handler.
		*/
		function handleClick(e:MouseEvent):void {
			
			var clickX = e.stageX - this.x;


			var absMaxClickX = this.constWidth / 2;

			var proportionX = clickX / absMaxClickX;

			this.velocityX = proportionX * -10; //-10 to 10;

			this.velocityY = -5.5;
			this.velocityR = Math.random() * 10 - 5; // -5 to 5;

			
			var blip:SoundBlip = new SoundBlip
			blip.play();
			
		}
		
		/** 
		* This function resets the ball to the settings it should have when it starts
		*/
		function reset():void {
			this.x = 400;
			this.y = 130;
			this.velocityX = 0;
			this.velocityY = 0;
			this.velocityR = 0;
			this.isOutOfBounds = false;
			this.accelerationY = 0.10;
			this.accelerationX = 0;
		}
	}
	
}
