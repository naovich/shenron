package  com.nao.Textes {
	import flash.html.HTMLLoader;
	import com.nao.Effects.Shadow;
	import com.nao.Basic.Background;
	import com.nao.Basic.Border;
	import com.nao.Power.Ki;
	import com.nao.Containers.Balise;
	import com.nao.Containers.Element;
	import com.nao.Textes.Paragraph;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.nao.Components.Bouton;
	import flash.geom.Point;
	import com.nao.Textes.IconeTexte;

	
	public class Texte extends Element{
		
		
		private var _color:uint = 0x000000 ;
		private var _letterSpacing:int = 0 ;
		private var _lineHeight:uint = 18 ;
		private var _textTransform:String = "none"; // none|capitalize|uppercase|lowercase|initial|inherit;
		private var _whiteSpace:String = "normal"//normal|nowrap|pre|pre-line|pre-wrap|initial|inherit;
		private var _wordSpacing:int = 0 ;
		private var _textDecoration:String = "none"; //text-decoration: none|underline|overline|line-through|initial|inherit;
		private var _fontFamily:String = "Open Sans";
		private var _fontSize:uint = 14;
		private var _fontStyle:String = "normal"; //normal|italic|oblique|initial|inherit;
		private var _fontWeight:Boolean = false; //normal|bold|bolder|lighter|
		private var _fontVariant:Boolean = false; //normal|small-caps
		private var _label:String;
		private var _textField:TextField = new TextField();
		
		
		private var _textAlign:String = "justify" ; //text-align: left|right|center|justify|initial|inherit;
		private var _textAlignLast:String = "start" ; //text-align-last: auto|left|right|center|justify|start|end|initial|inherit;
		
		
		//protected var _label:String = "";
		

		
		public function Texte(label:String = "Mon texte",x:Number = 0, y:Number = 0, color:uint = 0x000000, fontSize:uint = 14, fontFamily:String = "Open Sans", fontWeight:Boolean = false, fontStyle:String = "normal", fontVariant:Boolean = false,width:Number = 100,height:Number = 20)  {
			
			
			
		super(x,y,width,height);
			_fontFamily  = fontFamily;
			_fontSize = fontSize;
			_color = color;
			_fontStyle = fontStyle;
			_fontWeight = fontWeight;
			_fontVariant = fontVariant;
			_label = label;
			
			
			changeSpace();
			
			
			
			
			//this.resize();
			super.codeHTML = <span>{label}</span>;
			super.htmlLoad.paintsDefaultBackground = false;
			background.backgroundImage = "transparent";
			border.borderStyle = "none";
			Ki.texteChange(this);
		}
		
		
		public function changeSpace(){
			
			_textField.defaultTextFormat = new TextFormat(_fontFamily,_fontSize);
			
			_textField.text = _label;
			if(_textField.textWidth < 2000)
			{
				this.htmlWidth = _textField.textWidth;
				this.htmlHeight = _textField.textHeight;
			}else{
				
				this.htmlWidth = 2000;
				this.htmlHeight = 2000;
			}
		}
		
		
		public function resize():Point{
			
			var xy:Point = new Point();
			var txf:TextFormat = new TextFormat(this.fontFamily,this.fontSize,this.color,this.fontWeight);
			txf.letterSpacing = this.letterSpacing;
			this.textField.defaultTextFormat = txf;
			
			this.textField.text = this.label;
		
			this.htmlWidth = this.textField.textWidth;
			this.htmlHeight = this.textField.textHeight;
			if(this.fontStyle == "italic" || this.fontStyle == "oblique" || this.letterSpacing != 0 ) this.htmlWidth += 4;
			
			xy.x = this.htmlWidth;
			xy.y = this.htmlHeight;
			
			return xy;
			
		}
		
		private function texteTypeArrangement(){
			
			if(this.parent is IconeTexte){
		
				Ki.iconeTexteChange(this.parent as IconeTexte );
			}

			
		}
		
		
		
		
//--------------------------------------------GETTER/SETTER------------------------------------------
		public function get label(): String {
			return _label;
			
		}
		
		public function set label(label: String) {
			
			_label = label;
		
			if (this as Paragraph)
			{
				codeHTML = <p>{label}</p>;
				Ki.paragraphChange(this);
				
			}else{
				this.resize();
				codeHTML = <span>{label}</span>;
				Ki.texteChange(this);
			}
			
		texteTypeArrangement();
			
			
			
		}
		
		
		public function get color(): uint {
			return _color;
		}
		
		public function set color(color: uint) {
			_color = color;
			Ki.texteChange(this);
		}
		
		//-----------------------------

		public function get letterSpacing(): int {
			return _letterSpacing;
		}
		
		public function set letterSpacing(letterSpacing: int) {

			_letterSpacing = letterSpacing;
			if (this as Paragraph)
			{
				codeHTML = <p>{label}</p>;
				Ki.paragraphChange(this);
				
			}else{
				this.resize();
				codeHTML = <span>{label}</span>;
				Ki.texteChange(this);
			}
		}
		
	//---------------------	
		public function get lineHeight(): uint {
			return _lineHeight;
		}
		
		public function set lineHeight(lineHeight: uint) {

			_lineHeight = lineHeight;
			Ki.texteChange(this);
		}
		
	//---------------------
		
		public function get whiteSpace(): String {
			return _whiteSpace;
		}
		
		public function set whiteSpace(whiteSpace: String) {

			_whiteSpace = whiteSpace;
			Ki.texteChange(this);
		}
		
	//---------------------	
		public function get wordSpacing(): int {
			return _wordSpacing;
		}
		
		public function set wordSpacing(wordSpacing: int) {

			_wordSpacing = wordSpacing;
			
		if (this as Paragraph)
			{
				codeHTML = <p>{label}</p>;
				Ki.paragraphChange(this);
				
			}else{
				this.resize();
				codeHTML = <span>{label}</span>;
				Ki.texteChange(this);
			}
		}	
		
		//---------------------		
		
		public function get textTransform(): String {
			return _textTransform;
		}
		
		public function set textTransform(textTransform: String) {

			_textTransform = textTransform;
		
			
				if (this as Paragraph)
			{
				Ki.paragraphChange(this);
				
			}else if(this as Bouton){
				
				//Ki.boutonChange(this);
			}
			else{
				this.resize();
				Ki.texteChange(this);
			}
			
			
			texteTypeArrangement();
		}
		
		
		//---------------------	
		public function get textAlign(): String {
			return _textAlign;
		}
		
		public function set textAlign(textAlign: String) {

			_textAlign = textAlign;
			Ki.texteChange(this);
			texteTypeArrangement()
		}
		
		//---------------------	
		public function get textAlignLast(): String {
			return _textAlignLast;
		}
		
		public function set textAlignLast(textAlignLast: String) {

			_textAlignLast = textAlignLast;
			Ki.texteChange(this);
			texteTypeArrangement()
		}
		
		//---------------------		
		public function get textDecoration(): String {
			return _textDecoration;
		}
		
		public function set textDecoration(textDecoration: String) {

			_textDecoration = textDecoration;
			Ki.texteChange(this);
			texteTypeArrangement()
		}
	
		
	//---------------------		
		public function get fontFamily(): String {
			return _fontFamily;
		}
		
		public function set fontFamily(fontFamily: String) {
			
			_fontFamily = fontFamily;
			
			if (this as Paragraph)
			{
				Ki.paragraphChange(this);
				
			}else if(this as Bouton){
				
				//Ki.boutonChange(this);
			}
			else{
				this.resize();
				Ki.texteChange(this);
			}
			
			texteTypeArrangement();
		}

		//---------------------	
		public function get fontSize(): uint {
			return _fontSize;
		}
		
		public function set fontSize(fontSize: uint) {

			_fontSize = fontSize;
		
			if (this as Paragraph)
			{
				Ki.paragraphChange(this);
				
			}else if(this as Bouton){
				
				//Ki.boutonChange(this);
			}
			else{
				this.resize();
				Ki.texteChange(this);
			}
			
			texteTypeArrangement();
		}
		
		//---------------------	
		public function get fontWeight(): Boolean {
			return _fontWeight;
		}
		
		public function set fontWeight(fontWeight: Boolean) {

			_fontWeight = fontWeight;
			if (this as Paragraph)
			{
				Ki.paragraphChange(this);
				
			}else if(this as Bouton){
				
				//Ki.boutonChange(this);
			}
			else{
				this.resize();
				Ki.texteChange(this);
			}
			
			texteTypeArrangement();
		}
		
		//---------------------	
		public function get fontVariant(): Boolean {
			return _fontVariant;
		}
		
		public function set fontVariant(fontVariant: Boolean) {

			_fontVariant = fontVariant;
			//Ki.changeTexteStyle(this);
			//this.resize();
			Ki.texteChange(this);
			texteTypeArrangement();
		}
		
	//---------------------		
		public function get fontStyle(): String {
			return _fontStyle;
		}
		
		public function set fontStyle(fontStyle: String) {

			_fontStyle = fontStyle;
			//Ki.changeTexteStyle(this);
			texteTypeArrangement();
		}
	
	//---------------------		
		public function get textField(): TextField {
			return _textField;
		}
		
		public function set textField(textField: TextField) {
			
			
			_textField = textField;
			//Ki.changeTexteStyle(this);
		}
		
		
		
	}
	
}
