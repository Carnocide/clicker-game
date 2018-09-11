package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;


	public class ResetButton extends MovieClip {

		public var thingy: CoolThing


		/** 
		 * Constructor for the ResetButton
		 * @param coolThing CoolThing object to link to the ResetButton
		 */
		public function ResetButton(coolThing: CoolThing) {
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			thingy = coolThing;
		}
		
		
		/**
		* Function called when the ResetButton is clicked
		*/
		function handleClick(e: MouseEvent): void {
			trace("Attempting Dispatch");
			dispatchEvent(new Event("RESET_GAME", true, false));
		}
	}

}