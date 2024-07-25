package  com.nao.Basic {
	
	import flash.geom.Point;
	import com.nao.Basic.Gradiant;
	import com.nao.Effects.Shadow;
	import com.nao.Power.Ki;
	
	public class Background    {
		
		private var _backgroundAttachment:String = "scroll"; //scroll*|fixed|local|initial|inherit;
		private var _backgroundPosition:Point = new Point(0,0); //position x et y
		private var _backgroundSize:Point; //position x et y
		private var _backgroundSizeCover:String = "cover"; //None, Cover Contain, total (100%, 100%)
		private var _backgroundColor:uint = 0xFFFFFF;
		private var _backgroundColorTransparent:Boolean = false;
		private var _backgroundImage:String = "color";
		private var _backgroundGradiant:Gradiant = new Gradiant(0x111111,0xCCCCCC);
		private var _backgroundRepeat:String = "repeat";//repeat*|repeat-x|repeat-y|no-repeat|initial|inherit;
		private var _shadow:Shadow = new Shadow();
		
		public function Background() {
			// constructor code
						
		}
	
		
		//---------------------------------------------METHODES---------------------------------------------

			
		
		//--------------------------------------------GETTER/SETTER------------------------------------------
		
		public function get backgroundAttachment(): String {
			return _backgroundAttachment;
		}
		
		public function set backgroundAttachment(backgroundAttachment: String) {
			_backgroundAttachment = backgroundAttachment;
		}
		
	//---------------------------------------------------------------------------------
		
		public function get backgroundPosition(): Point {
			return _backgroundPosition;
		}
		
		public function set backgroundPosition(backgroundPosition: Point) {
			_backgroundPosition = backgroundPosition;
		}
		
	//---------------------------------------------------------------------------------
		
		public function get backgroundSize(): Point {
			return _backgroundSize;
		}
		
		public function set backgroundSize(backgroundSize: Point) {
			_backgroundSize = backgroundSize;
		}
		
//---------------------------------------------------------------------------------
		
		public function get backgroundSizeCover(): String {
			return _backgroundSizeCover;
		}
		
		public function set backgroundSizeCover(backgroundSizeCover: String) {
			_backgroundSizeCover = backgroundSizeCover;
		}
//---------------------------------------------------------------------------------
		
		public function get backgroundColor(): uint {
			return _backgroundColor;
		}
		
		public function set backgroundColor(backgroundColor: uint) {
			_backgroundColor = backgroundColor;
		//	Ki.changeStyle(this.parent);
			
		}
//---------------------------------------------------------------------------------
		
		public function get backgroundColorTransparent(): Boolean {
			return _backgroundColorTransparent;
		}
		
		public function set backgroundColorTransparent(backgroundColorTransparent: Boolean) {
			_backgroundColorTransparent = backgroundColorTransparent;
		}
	
//---------------------------------------------------------------------------------
		
		public function get backgroundImage(): String {
			return _backgroundImage;
		}
		
		public function set backgroundImage(backgroundImage: String) {
			_backgroundImage = backgroundImage;
				//Ki.changeStyle(this.parent);
		}
		
//---------------------------------------------------------------------------------
		
		public function get backgroundGradiant(): Gradiant {
			return _backgroundGradiant;
		}
		
		public function set backgroundGradiant(backgroundGradiant: Gradiant) {
			_backgroundGradiant = backgroundGradiant;
		}
		
//---------------------------------------------------------------------------------
		
		public function get backgroundRepeat(): String {
			return _backgroundRepeat;
		}
		
		public function set backgroundRepeat(backgroundGradiant: String) {
			_backgroundRepeat = backgroundRepeat;
		}
//---------------------------------------------------------------------------------
		
		public function get shadow(): Shadow {
			return _shadow;
		}
		
		public function set shadow(shadow: Shadow) {
			_shadow = shadow;
		}

		
	}
	
}
