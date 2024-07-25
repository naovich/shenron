package  com.nao.Basic {
	
	
	
	
	public class Border   {
		
		
		private var _borderColor:uint = 0x100000;
		private var _borderWidth:uint = 0;
		private var _borderRadius:uint = 0;
		private var _borderStyle:String = "Solid";

		private var _borderBottomColor:uint = 0x100000;
		private var _borderBottomWidth:uint = 0;
		private var _borderBottomLeftRadius:uint = 0;
		private var _borderBottomRightRadius:uint = 0;
		private var _borderBottomStyle:String = "Solid";  //dotted|dashed|solid|double|groove|ridge|inherit;
		
		private var _borderTopColor:uint = 0x100000;
		private var _borderTopWidth:uint = 0;
		private var _borderTopLeftRadius:uint = 0;
		private var _borderTopRightRadius:uint = 0;
		private var _borderTopStyle:String = "Solid";  //dotted|dashed|solid|double|groove|ridge|inherit;
		
		private var _borderLeftColor:uint = 0x100000;
		private var _borderLeftWidth:uint = 0;
		private var _borderLeftStyle:String = "Solid";  //dotted|dashed|solid|double|groove|ridge|inherit;
		
		private var _borderRightColor:uint = 0x100000;
		private var _borderRightWidth:uint = 0;
		private var _borderRightStyle:String = "Solid";  //dotted|dashed|solid|double|groove|ridge|inherit;
		
		//private var _borderImageBol:Boolean;
		//private var _borderImageRepeat:String;  //stretch|repeat|round|initial|inherit;
		//private var _borderImageSlice:uint; 
		//private var _borderImageSource:String; 
		//private var _borderImageWidth:uint; 
		
		private var _borderSame:Boolean = false;

		
		
		
		public function Border() {
			// constructor code

		}
		
		
		
		
		
		//---------------------------------------------METHODES---------------------------------------------

		/*public function sameWidth():void
		{
			_borderBottomWidth = _borderTopWidth;
			_borderLeftWidth = _borderTopWidth;
			_borderRightWidth = _borderTopWidth;
		}
		
		public function sameColor():void
		{
			_borderBottomColor = _borderTopColor;
			_borderLeftColor = _borderTopColor;
			_borderRightColor = _borderTopColor;
		}
		
		public function sameStyle():void
		{
			_borderBottomStyle = _borderTopStyle;
			_borderLeftStyle = _borderTopStyle;
			_borderRightStyle = _borderTopStyle;
		}*/
		
		//--------------------------------------------GETTER/SETTER------------------------------------------
		
		
		public function set borderColor(borderColor: uint) {
			_borderColor = borderColor;
			_borderBottomColor = borderColor ;
			_borderTopColor = borderColor ;
			_borderLeftColor = borderColor;
			_borderRightColor = borderColor;
		}
		
		public function set borderWidth(borderWidth: uint) {
			_borderWidth = borderWidth;
			_borderBottomWidth = borderWidth ;
			_borderTopWidth = borderWidth ;
			_borderLeftWidth = borderWidth;
			_borderRightWidth = borderWidth;
		}
		
		public function set borderRadius(borderRadius: uint) {
			_borderRadius = borderRadius;
			_borderTopLeftRadius = borderRadius ;
			_borderTopRightRadius = borderRadius ;
			_borderBottomLeftRadius = borderRadius;
			_borderBottomRightRadius = borderRadius;
		}
		
		public function set borderStyle(borderStyle: String) {
			_borderStyle = borderStyle;
			_borderBottomStyle = borderStyle ;
			_borderTopStyle = borderStyle ;
			_borderLeftStyle = borderStyle;
			_borderRightStyle = borderStyle;
		}
		
		public function get borderStyle(): String {
			return _borderStyle;
		}
		
	
		public function get borderBottomColor(): uint {
			return _borderBottomColor;
		}
		
		public function set borderBottomColor(borderBottomColor: uint) {
			_borderBottomColor = borderBottomColor;
		}
		
//------			
		public function get borderBottomLeftRadius(): uint {
			return _borderBottomLeftRadius;
		}
		
		public function set borderBottomLeftRadius(borderBottomLeftRadius: uint) {
			_borderBottomLeftRadius = borderBottomLeftRadius;
		}
		
//------		
		public function get borderBottomRightRadius(): uint {
			return _borderBottomRightRadius;
		}
		
		public function set borderBottomRightRadius(borderBottomRightRadius: uint) {
			_borderBottomRightRadius = borderBottomRightRadius;
		}
		
//------		
		public function get borderBottomWidth(): uint {
			return _borderBottomWidth;
		}
		
		public function set borderBottomWidth(borderBottomWidth: uint) {
			_borderBottomWidth = borderBottomWidth;
		}

		
		public function get borderBottomStyle(): String {
			return _borderBottomStyle;
		}
		
		public function set borderBottomStyle(borderBottomStyle: String) {
			_borderBottomStyle = borderBottomStyle;
		}
		
//---------------------------------------------------------------------------------
	
		public function get borderTopColor(): uint {
			return _borderTopColor;
		}
		
		public function set borderTopColor(borderTopColor: uint) {
			_borderTopColor = borderTopColor;
		}
		
//------			
		public function get borderTopLeftRadius(): uint {
			return _borderTopLeftRadius;
		}
		
		public function set borderTopLeftRadius(borderTopLeftRadius: uint) {
			_borderTopLeftRadius = borderTopLeftRadius;
		}
		
//------		
		public function get borderTopRightRadius(): uint {
			return _borderTopRightRadius;
		}
		
		public function set borderTopRightRadius(borderTopRightRadius: uint) {
			_borderTopRightRadius = borderTopRightRadius;
		}
		
//------		
		public function get borderTopWidth(): uint {
			return _borderTopWidth;
		}
		
		public function set borderTopWidth(borderTopWidth: uint) {
			_borderTopWidth = borderTopWidth;
		}
		
//------		
		public function get borderTopStyle(): String {
			return _borderTopStyle;
		}
		
		public function set borderTopStyle(borderTopStyle: String) {
			_borderTopStyle = borderTopStyle;
		}

//---------------------------------------------------------------------------------
		
		public function get borderLeftColor(): uint {
			return _borderLeftColor;
		}
		
		public function set borderLeftColor(borderLeftColor: uint) {
			_borderLeftColor = borderLeftColor;
		}
		
		
//------		
		public function get borderLeftWidth(): uint {
			return _borderLeftWidth;
		}
		
		public function set borderLeftWidth(borderLeftWidth: uint) {
			_borderLeftWidth = borderLeftWidth;
		}

		
		public function get borderLeftStyle(): String {
			return _borderLeftStyle;
		}
		
		public function set borderLeftStyle(borderLeftStyle: String) {
			_borderLeftStyle = borderLeftStyle;
		}

		
//---------------------------------------------------------------------------------
		
		public function get borderRightColor(): uint {
			return _borderRightColor;
		}
		
		public function set borderRightColor(borderRightColor: uint) {
			_borderRightColor = borderRightColor;
		}
		
		
//------		
		public function get borderRightWidth(): uint {
			return _borderRightWidth;
		}
		
		public function set borderRightWidth(borderRightWidth: uint) {
			_borderRightWidth = borderRightWidth;
		}

		
		public function get borderRightStyle(): String {
			return _borderRightStyle;
		}
		
		public function set borderRightStyle(borderRightStyle: String) {
			_borderRightStyle = borderRightStyle;
		}
		
		
//---------------------------------------------------------------------------------

		
		public function get borderSame(): Boolean {
			return _borderSame;
		}
		
		public function set borderSame(borderSame: Boolean) {
			_borderSame = borderSame;
		}
		
		/*public function get borderImageBol(): Boolean {
			return _borderImageBol;
		}
		
		public function set borderImageBol(borderImageBol: Boolean) {
			_borderImageBol = borderImageBol;
		}
		
		
		
		
		/*public function get borderImageRepeat(): String {
			return _borderImageRepeat;
		}
		
		public function set borderImageRepeat(borderImageRepeat: String) {
			_borderImageRepeat = borderImageRepeat;
		}
		
		
		public function get borderImageSlice(): uint {
			return _borderImageSlice;
		}
		
		public function set borderImageSlice(borderImageSlice: uint) {
			_borderImageSlice = borderImageSlice;
		}
		
		
		public function get borderImageSource(): String {
			return _borderImageSource;
		}
		
		public function set borderImageSource(borderImageSource: String) {
			_borderImageSource = borderImageSource;
		}
		
		
		public function get borderImageWidth(): uint {
			return _borderImageWidth;
		}
		
		public function set borderImageWidth(borderImageWidth: uint) {
			_borderImageWidth = borderImageWidth;
		}*/
		
		
		
		
		
		
		
		
	
		
		
		
	}
	
}
