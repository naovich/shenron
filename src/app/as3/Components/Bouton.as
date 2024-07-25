package  com.nao.Components {
	
	import flash.html.HTMLLoader;
	import com.nao.Textes.Texte;
	import com.nao.Images.Icone;
	import com.nao.Power.Ki;
	import flash.text.TextField;
	import flash.text.TextFormat;

	
	public class Bouton extends Texte {

	private var _disabled:Boolean = false;
	private var _type:String = "button";
	private var _icone:Icone = new Icone("",0,0,50);
	private var _positionIcone:uint ;
	private var _value:String;
	
	private var _fontIconFamilly:String = "FontAwesome";
	private var _iconColor:uint = 0xFFFFFF;
	private var _iconMarginRight:uint = 5;
	private var _iconMarginLeft:uint = 0;
	private var _iconMarginTop:uint = 5;
	private var _iconMarginBottom:uint = 10;
	private var _iconField:TextField = new TextField();
	private var _styleIcon:String =   "color:" + _iconColor + ";font-family:"  +_fontIconFamilly + ";margin-top:" + _iconMarginTop.toString() + "px;margin-bottom:"  + _iconMarginBottom.toString() +  "px;margin-left:"  + _iconMarginLeft.toString() + "px;margin-right:"  + _iconMarginRight.toString() + "px;"  ;
		
		


		
		public function Bouton(value:String,  icone:String = "", positionIcone:uint = 0, x:Number = 0, y:Number = 0, width:Number = 100, height:Number = 30, iconSize:uint = 20, color:uint = 0x000000,fontSize:uint = 14, fontFamily:String = "Open Sans", fontWeight:Boolean = false, fontStyle:String = "normal", fontVariant:Boolean = false ) {
			// constructor code
		
			//var space:String = "  ";
			_icone.fontSize = iconSize;
			_icone.label = icone;
			_positionIcone = positionIcone ;
			
			_iconField.defaultTextFormat = new TextFormat(_fontIconFamilly,iconSize);
			_iconField.text = icone;
			_value = value;
			super(value,x,y,color,fontSize,fontFamily,fontWeight,fontStyle,fontVariant,width,height);
			super.htmlWidth = width;
			super.htmlHeight = height;
			
			switch(positionIcone)
			{
				case 0: 
				codeHTML = <button>{value}</button>;
				break;
				
				case 1: 
				codeHTML = <button><span style = {styleIcon}>{_icone.label}</span>{value}</button>;
				break;
				
				case 2:
				codeHTML = <button><span style = {styleIcon}>{_icone.label}</span><br></br>{value}</button>;
				break;
				
				case 3:
				codeHTML = <button>{value} <span style = {styleIcon}>{_icone.label}</span></button>;
				break;
				
				case 4:
				codeHTML = <button>{value} <br></br><span style = {styleIcon}>{_icone.label}</span></button>;
				break;
				
				
				
			}
			
		//	_codeHTML = <button><i style = {styleIcon}>{_icone.value}</i><br></br>{value}</button>;
			this.background.backgroundImage = "default";
			Ki.boutonChange(this);
		}
		
		 public function get value(): String {
			return _value;
			
		}
		
		public function set value(value: String) {
			_value = value;
			swt();
			
		}
		//----------------------------------------
		
		private function swt():void {
			
		_styleIcon = "font-family:" + _fontIconFamilly + ";margin-top:" + _iconMarginTop.toString() + "px;margin-bottom:"  + _iconMarginBottom.toString() +  "px;margin-left:"  + _iconMarginLeft.toString() + "px;margin-right:"  + _iconMarginRight.toString() + "px;"  ;
			
			switch(positionIcone)
			{
				case 0: 
				codeHTML = <button>{value}</button>;
				break;
				
				case 1: 
				codeHTML = <button><span style = {styleIcon}>{_icone.label}</span>{value}</button>;
				break;
				
				case 2:
				codeHTML = <button><span style = {styleIcon}>{_icone.label}</span><br></br>{value}</button>;
				break;
				
				case 3:
				codeHTML = <button>{value} <span style = {styleIcon}>{_icone.label}</span></button>;
				break;
				
				case 4:
				codeHTML = <button>{value} <br></br><span style = {styleIcon}>{_icone.label}</span></button>;
				break;
			
			}
		Ki.boutonChange(this);
			

		}
		
	//---------------------	
		public function get disabled(): Boolean {
			return _disabled;
		}
		
		public function set disabled(disabled: Boolean) {

			_disabled = disabled;
		}
		
		//---------------------	
		public function get type(): String {
			return _type;
		}
		
		public function set type(type: String) {

			_type = type;
			 swt();
		}
		
		//---------------------	
		public function get icone(): Icone {
			return _icone;
		}
		
		public function set icone(icone: Icone) {

			_icone = icone;
			 swt();
		}
		
		//---------------------	
		public function get positionIcone(): uint {
			return _positionIcone;
		}
		
		public function set positionIcone(positionIcone: uint) {
			_positionIcone = positionIcone;
			 swt();
		}
		
		//---------------------	
		public function get styleIcon(): String {
			return _styleIcon;
		}
		
		public function set styleIcon(styleIcon: String) {

			_styleIcon = styleIcon;
			 swt();
		}
		
		
		//---------------------	
		public function get fontIconFamilly(): String {
			return _fontIconFamilly;
		}
		
		public function set fontIconFamilly(fontIconFamilly: String) {

			_fontIconFamilly = fontIconFamilly;
			 swt();
		}
		
		//---------------------	
		public function get iconMarginTop(): uint {
			return _iconMarginTop;
		}
		
		public function set iconMarginTop(iconMarginTop: uint) {

			_iconMarginTop = iconMarginTop;
		//	_value = value;
			 swt();
		}
		//---------------------	
		public function get iconMarginBottom(): uint {
			return _iconMarginBottom;
			
		}
		
		public function set iconMarginBottom(iconMarginBottom: uint) {

			_iconMarginBottom = iconMarginBottom;
			 swt();
		}
		//---------------------	
		public function get iconMarginRight(): uint {
			return _iconMarginRight;
		}
		
		public function set iconMarginRight(iconMarginRight: uint) {

			_iconMarginRight = iconMarginRight;
			 swt();
		}
		
		//---------------------	
		public function get iconMarginLeft(): uint {
			return _iconMarginLeft;
		}
		
		public function set iconMarginLeft(iconMarginLeft: uint) {

			_iconMarginLeft = iconMarginLeft;
			 swt();
		}
		
		//---------------------	
		public function get iconColor(): uint {
			return _iconColor;
		}
		
		public function set iconColor(iconColor: uint) {

			_iconColor = iconColor;
			 swt();
		}
		
		//---------------------		
		public function get iconField(): TextField {
			return _iconField;
		}
		
		public function set iconField(iconField: TextField) {

			_iconField = iconField;
			//Ki.changeTexteStyle(this);
			 swt();
		}
		
		
		
		
	}
	
}
