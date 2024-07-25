package  com.nao.Listes {
	import flash.html.HTMLLoader;
	import com.nao.Basic.Background;
	import com.nao.Basic.Border ;
	import com.nao.Effects.Shadow ;
	import com.nao.Images.Icone;
	import com.nao.Power.Ki;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Li extends HTMLLoader{
		
		
		protected var _color:uint = 0x000000 ;
		protected var _letterSpacing:uint = 1000 ;
		protected var _lineHeight:uint = 18 ;
		protected var _textTransform:String = "none"; // none|capitalize|uppercase|lowercase|initial|inherit;
		protected var _whiteSpace:String = "normal"//normal|nowrap|pre|pre-line|pre-wrap|initial|inherit;
		protected var _wordSpacing:uint = 1000 ;
		protected var _textDecoration:String = "none"; //text-decoration: none|underline|overline|line-through|initial|inherit;
		protected var _shadow:Shadow = new Shadow();
		protected var _fontFamily:String = "none";
		protected var _fontSize:uint = 14;
		protected var _fontStyle:String = "normal";
		protected var _fontWeight:Boolean = false;
		protected var _fontVariant:Boolean = false;
		protected var _background:Background = new Background();
		protected var _border:Border = new Border();
		
		protected var _codeHTML:XML ;
		protected var _label:String;
		protected var _opacity:Number = 1;
		protected var _display:String; //block, inline, none
		protected var _visibility:Boolean = true; //block, inline, none
		protected var _zIndex:int;
		//protected var _label:String = "";
		
		private var _textIndent:uint = 0 ; //0
		protected var _textAlign:String = "justify" ; //text-align: left|right|center|justify|initial|inherit;
		protected var _textAlignLast:String = "start" ; //text-align-last: auto|left|right|center|justify|start|end|initial|inherit;
		
		private var _icone:Icone = new Icone("",0,0,50);
		private var _positionIcone:uint ;
		private var _fontIconFamilly:String = "FontAwesome";
		
		private var _iconColor:uint = 0xFFFFFF;
		private var _iconMarginRight:uint = 5;
		private var _iconMarginLeft:uint = 0;
		private var _iconMarginTop:uint = 0;
		private var _iconMarginBottom:uint = 0;
		private var _iconField:TextField = new TextField();
		private var _relativePosition:String = 'position:relative;top:25%;';	
		private var _styleIcon:String =   "color:" + _iconColor + ";font-family:"  +_fontIconFamilly + ";margin-top:" + _iconMarginTop.toString() + "px;margin-bottom:"  + _iconMarginBottom.toString() +  "px;margin-left:"  + _iconMarginLeft.toString() + "px;margin-right:"  + _iconMarginRight.toString() + "px;" + _relativePosition ;
		
			

		
		public function Li(label:String , icone:String = "", positionIcone:uint = 0, iconSize:uint = 20)  {
			
			
			_icone.fontSize = iconSize;
			_icone.label = icone;
			_positionIcone = positionIcone ;
			
			_label = label;
			//_codeHTML = <li> <span style='position:relative;top:25%;'>{label}</span></li>;
			//_codeHTML = <li><span style='margin:auto;'>{label}</span></li>;

			 swt();
			
						
			this.paintsDefaultBackground = false;
			_background.backgroundImage = "transparent";
			_border.borderStyle = "none";
			_textAlign = "center";
			
			// constructor code
		}
		
		
//--------------------------------------------GETTER/SETTER------------------------------------------
		 public function  set label(label: String) {
			
			
			_label = label;
			 swt();
		}
		
		
		
		
		private function swt():void {
			
		_styleIcon = "font-family:" + _fontIconFamilly + ";margin-top:" + _iconMarginTop.toString() + "px;margin-bottom:"  + _iconMarginBottom.toString() +  "px;margin-left:"  + _iconMarginLeft.toString() + "px;margin-right:"  + _iconMarginRight.toString() + "px;" + _relativePosition  ;
			
			switch(positionIcone)
			{
				case 0: 
				_codeHTML = <li>{label}</li>;
				break;
				
				case 1: 
				_codeHTML = <li><span style = {styleIcon}>{_icone.label}</span><span style = {_relativePosition} >{label}</span></li>;
				break;
				
				case 2:
				_codeHTML = <li><span style = {styleIcon}>{_icone.label}</span><br></br><br></br><span>{label}</span></li>;
				break;
				
				case 3:
				_codeHTML = <li><span style = {_relativePosition} >{label}</span><span style = {styleIcon}>{_icone.label}</span></li>;
				break;
				
				case 4:
				_codeHTML = <li><span>{label}</span><br></br><span style = {styleIcon}>{_icone.label}</span></li>;
				break;
			
			}

		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		public function get label(): String {
			return _label;
		}
		
	/*	public function set label(label: String) {
			_codeHTML = <span>{label}</span>;
			_label = label;
		}*/
		
		
		public function get color(): uint {
			return _color;
		}
		
		public function set color(color: uint) {
			_color = color;
			Ki.liChange(this);
		}
		
		public function get opacity(): Number {
			return _opacity;
			
		}
		
		public function set opacity(opacity: Number) {
			_opacity = opacity/100;
			Ki.liChange(this);
		}
		
		
		
		public function get display(): String {
			return _display;
		}
		
		public function set display(display: String) {
			_display = display;
			Ki.liChange(this);
		}
		
		public function get visibility(): Boolean {
			return _visibility;
		}
		
		public function set visibility(visibility: Boolean) {
			_visibility = visibility;
			Ki.liChange(this);
		}
		
		
		public function get zIndex(): int {
			return _zIndex;
		}
		
		public function set zIndex(zIndex: int) {
			_zIndex = zIndex;
			Ki.liChange(this);
		}
		
		
		//-----------------------------

		public function get letterSpacing(): uint {
			return _letterSpacing;
		}
		
		public function set letterSpacing(letterSpacing: uint) {

			_letterSpacing = letterSpacing;
			Ki.liChange(this);
		}
		
	//---------------------	
		public function get lineHeight(): uint {
			return _lineHeight;
		}
		
		public function set lineHeight(lineHeight: uint) {

			_lineHeight = lineHeight;
			Ki.liChange(this);
		}
		
	//---------------------
		
		public function get whiteSpace(): String {
			return _whiteSpace;
		}
		
		public function set whiteSpace(whiteSpace: String) {

			_whiteSpace = whiteSpace;
			Ki.liChange(this);
		}
		
	//---------------------	
		public function get wordSpacing(): uint {
			return _wordSpacing;
		}
		
		public function set wordSpacing(wordSpacing: uint) {

			_wordSpacing = wordSpacing;
			Ki.liChange(this);
		}	
		
		//---------------------		
		
		public function get textTransform(): String {
			return _textTransform;
		}
		
		public function set textTransform(textTransform: String) {

			_textTransform = textTransform;
			Ki.liChange(this);
		}
		
		
		//---------------------		
		public function get textDecoration(): String {
			return _textDecoration;
		}
		
		public function set textDecoration(textDecoration: String) {

			_textDecoration = textDecoration;
			Ki.liChange(this);
		}
	//---------------------	

		public function get shadow(): Shadow {
			return _shadow;
		}
		
		public function set shadow(shadow: Shadow) {
			_shadow = shadow;
			Ki.liChange(this);
		}
		
	//---------------------		
		public function get fontFamily(): String {
			return _fontFamily;
		}
		
		public function set fontFamily(fontFamily: String) {

			_fontFamily = fontFamily;
			Ki.liChange(this);
		}

		//---------------------	
		public function get fontSize(): uint {
			return _fontSize;
		}
		
		public function set fontSize(fontSize: uint) {

			_fontSize = fontSize;
			Ki.liChange(this);
		}
		
		//---------------------	
		public function get fontWeight(): Boolean {
			return _fontWeight;
		}
		
		public function set fontWeight(fontWeight: Boolean) {

			_fontWeight = fontWeight;
			Ki.liChange(this);
		}
		
		//---------------------	
		public function get fontVariant(): Boolean {
			return _fontVariant;
		}
		
		public function set fontVariant(fontVariant: Boolean) {

			_fontVariant = fontVariant;
			Ki.liChange(this);
		}
		
	//---------------------		
		public function get fontStyle(): String {
			return _fontStyle;
		}
		
		public function set fontStyle(fontStyle: String) {

			_fontStyle = fontStyle;
			Ki.liChange(this);
		}
	//---------------------		
		public function get background(): Background {
			return _background;
		}
		
		public function set background(background: Background) {
			_background = background;
			Ki.liChange(this);
		}
	//---------------------		
	public function get codeHTML(): XML {
			return _codeHTML;
		}
		
		public function set codeHTML(codeHTML: XML) {
			_codeHTML = codeHTML;
			Ki.liChange(this);
		}
		
		//---------------------		
	public function get border(): Border {
			return _border;
		}
		
		public function set border(border: Border) {
			_border = border;
			Ki.liChange(this);
		}
		
	
	//---------------------	
		public function get textAlign(): String {
			return _textAlign;
		}
		
		public function set textAlign(textAlign: String) {

			_textAlign = textAlign;
			Ki.liChange(this);
		}
		
		//---------------------	
		public function get textAlignLast(): String {
			return _textAlignLast;
		}
		
		public function set textAlignLast(textAlignLast: String) {

			_textAlignLast = textAlignLast;
			Ki.liChange(this);
		}

		
		//--------------------	
		public function get textIndent(): uint {
			return _textIndent;
		}
		
		public function set textIndent(textIndent: uint) {

			_textIndent = textIndent;
			Ki.liChange(this);
		}
		
		
		
		//---------------------	
		public function get positionIcone(): uint {
			return _positionIcone;
		}
		
		public function set positionIcone(positionIcone: uint) {
			_positionIcone = positionIcone;
			 swt();
			Ki.liChange(this);
		}
		
		
		
		//---------------------	
		public function get styleIcon(): String {
			return _styleIcon;
		}
		
		public function set styleIcon(styleIcon: String) {

			_styleIcon = styleIcon;
			 swt();
			Ki.liChange(this);
		}
		
		
		//---------------------	
		public function get fontIconFamilly(): String {
			return _fontIconFamilly;
		}
		
		public function set fontIconFamilly(fontIconFamilly: String) {

			_fontIconFamilly = fontIconFamilly;
			 swt();
			Ki.liChange(this);
		}
		
		//---------------------	
		public function get iconMarginTop(): uint {
			return _iconMarginTop;
		}
		
		public function set iconMarginTop(iconMarginTop: uint) {

			_iconMarginTop = iconMarginTop;
			_label = label;
			Ki.liChange(this);
		}
		//---------------------	
		public function get iconMarginBottom(): uint {
			return _iconMarginBottom;
			
		}
		
		public function set iconMarginBottom(iconMarginBottom: uint) {

			_iconMarginBottom = iconMarginBottom;
			 swt();
			Ki.liChange(this);
		}
		//---------------------	
		public function get iconMarginRight(): uint {
			return _iconMarginRight;
		}
		
		public function set iconMarginRight(iconMarginRight: uint) {

			_iconMarginRight = iconMarginRight;
			 swt();
			Ki.liChange(this);
		}
		
		//---------------------	
		public function get iconMarginLeft(): uint {
			return _iconMarginLeft;
		}
		
		public function set iconMarginLeft(iconMarginLeft: uint) {

			_iconMarginLeft = iconMarginLeft;
			 swt();
			Ki.liChange(this);
		}
		
		//---------------------	
		public function get iconColor(): uint {
			return _iconColor;
		}
		
		public function set iconColor(iconColor: uint) {

			_iconColor = iconColor;
			 swt();
			Ki.liChange(this);
		}
		
		//---------------------		
		public function get iconField(): TextField {
			return _iconField;
		}
		
		public function set iconField(iconField: TextField) {

			_iconField = iconField;
			Ki.liChange(this);
		}
		
		
		
		
		
		
		
		
	}
	
}
