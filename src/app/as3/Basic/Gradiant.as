package  com.nao.Basic {
	
	import com.nao.Power.Ki;
	
	public class Gradiant {

		
		private var _color1:uint ;
		private var _color2:uint;
		private var _type:String;
		private var  _to:String;
		private var  _from:String;
		private var _colorStop1:uint;
		private var _colorStop2:uint;
		
		
		public function Gradiant(color1:uint = 0, color2:uint = 0xFFFFFF,type = "linear", to = "center top", from = "center bottom", colorStop1:uint = 0, colorStop2:uint = 100) {
			// constructor code
			_color1 = color1 ;
			_color2 = color2 ;
			_type = type ;
			_to = to;
			_from = from ;
			_colorStop1 = colorStop1 ;
			_colorStop2 = colorStop2 ;

		}
		
		
		
		
		
		//----------------------------------------------METHODES------------------------------------------

		public function switchColor():void{
			
			var colorTemp:uint = _color1 ;
			_color1 = _color2 ;
			_color2 = colorTemp;
			
		}
		
		
		
		
		//----------------------------------------------GETTER/SETTER------------------------------------------
		
		
		public function get color1(): uint {
			return _color1;
		}
		
		public function set color1(color1: uint) {
			_color1 = color1;
		}	
		
		
		public function get color2(): uint {
			return _color2;
		}
		
		public function set color2(color2: uint) {
			_color2 = color2;
		}	
		
		//---------------------------------------------------------------------------------
		public function get type(): String {
			return _type;
		}
		
		public function set type(type: String) {
			_type = type;
		}
		public function get to(): String {
			return _to;
		}
		
		public function set to(to: String) {
			_to = to;
		}
		
		public function get from(): String {
			return _from;
		}
		
		public function set from(from: String) {
			_from = from;
		}
		
		
		
		public function get colorStop1(): uint {
			return _colorStop1;
		}
		
		public function set colorStop1(colorStop1: uint) {
			_colorStop1 = colorStop1;
		}	
		
		public function get colorStop2(): uint {
			return _colorStop2;
		}
		
		public function set colorStop2(colorStop2: uint) {
			_colorStop2 = colorStop2;
		}	
	
	}
	
}
