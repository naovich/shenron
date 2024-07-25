package com.nao.Themes {
	import com.nao.Basic.Background;
	import com.nao.Basic.Border;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Texte;
	import com.nao.Images.Image;
	import com.nao.Containers.Balise;
	import com.nao.Textes.Paragraph;
	import com.nao.Power.Ki;
	
	
	public class StyleBalise {

		private var _background:Background = new Background();
		private var _border:Border = new Border();
		private var _titre:IconeTexte = new IconeTexte();
		private var _texte:Paragraph = new Paragraph();
		private var _image:Image = new Image();
		private var _padding: uint = 0;
		private var _paddingRight: uint = 0;
		private var _paddingLeft: uint = 0;
		private var _paddingTop: uint = 0;
		private var _paddingBottom: uint = 0;
		private var _opacity:Number = 1;
		

		
		public function StyleBalise() {
			// constructor code
			this.padding = 10;
		}
		
		
		
		
		
		
		public function setBaliseStyle(balise:Balise){
			
			
			balise.opacity = this.opacity ;
			balise.background = this.background ;
			balise.border = this.border;
			balise.padding = this.padding;
			balise.paddingRight = this.paddingRight;
			balise.paddingLeft = this.paddingLeft;
			balise.paddingTop = this.paddingTop;
			balise.paddingBottom = this.paddingBottom;
			
			/*for(var i:uint = 0; i<= balise.numChildren; i++)
			{
				if(balise.getChildAt(i) as Paragraph) 
				{
					paragraphCopy(balise.getChildAt(i), this.texte)
					
				}
				
			}*/
			
			Ki.baliseChange(balise);
			
			
		}
		
			public function getBaliseStyle(balise:Balise){
				
				
				  this.opacity = balise.opacity;
				  this.background = balise.background  ;
				  this.border = balise.border;
				  this.padding = balise.padding ;
				  this.paddingRight = balise.paddingRight;
				  this.paddingLeft = balise.paddingLeft;
				  this.paddingTop = balise.paddingTop ;
				  this.paddingBottom = balise.paddingBottom;

			}
			
			
			public function getStyle(style:StyleBalise){
				
				
				  this.opacity = style.opacity;
				  this.background = style.background  ;
				  this.border = style.border;
				  this.padding = style.padding ;
				  this.paddingRight = style.paddingRight;
				  this.paddingLeft = style.paddingLeft;
				  this.paddingTop = style.paddingTop ;
				  this.paddingBottom = style.paddingBottom;
				
				
				
			}
		
		
		
			public static function texteCopyStyle(texte1:Texte, texte2:Texte){
			
					texte1.color = texte2.color ;
					texte1.letterSpacing = texte2.letterSpacing ;
					texte1.lineHeight = texte2.lineHeight ;
					texte1.textTransform = texte2.textTransform ;
					texte1.whiteSpace = texte2.whiteSpace ;
					texte1.wordSpacing = texte2.wordSpacing ;
					texte1.textDecoration = texte2.textDecoration ;
					texte1.fontFamily = texte2.fontFamily ;
					texte1.fontSize = texte2.fontSize ;
					texte1.fontStyle = texte2.fontStyle ;
					texte1.fontWeight = texte2.fontWeight ;
					texte1.fontVariant = texte2.fontVariant ;
					
					Ki.texteChange(texte1);
			
			}
			
			
			public static function paragraphCopyStyle(paragraph1:Paragraph, paragraph2:Paragraph){
					texteCopyStyle(paragraph1, paragraph2);
					
					paragraph1.textIndent = paragraph2.textIndent ;
					paragraph1.textAlign = paragraph2.textAlign ;
					paragraph1.textAlignLast = paragraph2.textAlignLast ;
					Ki.paragraphChange(paragraph1);
								
			
			}
			
			
			public static function backgroundCopyStyle(balise1:Balise,balise2:Balise ){
					
				balise1.background = balise2.background ;
				Ki.baliseChange(balise1);
			}
		
			public static function borderCopyStyle(balise1:Balise,balise2:Balise ){
					
				balise1.border = balise2.border ;
				Ki.baliseChange(balise1);
			
			}
			
			public static function paddingCopyStyle(balise1:Balise,balise2:Balise ){
					
				balise1.padding = balise2.padding;
				balise1.paddingRight = balise2.paddingRight;
				balise1.paddingLeft = balise2.paddingLeft;
				balise1.paddingTop = balise2.paddingTop;
				balise1.paddingBottom = balise2.paddingBottom;
			
			}
			
			public static function copyBaliseStyle(balise1:Balise,balise2:Balise ){
					
				balise1.opacity = balise2.opacity ;
				backgroundCopyStyle(balise1,balise2);
				borderCopyStyle(balise1,balise2);
				paddingCopyStyle(balise1,balise2) ;
				
				Ki.baliseChange(balise1);
			
			}
			
			
			public static function applyBaliseStyle(balise:Balise,style:StyleBalise ){
					
				balise.opacity = style.opacity ;
				balise.background = style.background ;
				balise.border = style.border ;
				balise.padding = style.padding ;
				balise.paddingRight = style.paddingRight ;
				balise.paddingLeft  = style.paddingLeft  ;
				balise.paddingTop = style.paddingTop ;
				balise.paddingBottom = style.paddingBottom ;
				
				Ki.baliseChange(balise);
			
			}
		
		
			
			
			public function theme1(balise:Balise ){
					
				/*balise1.opacity = balise2.opacity ;
				backgroundCopy(balise1,balise2);
				borderCopy(balise1,balise2);
				paddingCopy(balise1,balise2) ;*/
			
			}
		
		
		public static function colorChange(balise:Balise, color1:uint, color2:uint){
			
			for(var i:uint = 0; i<= balise.numChildren; i++){
				
				if( balise.background.backgroundGradiant.color1 == color1)
				{
					balise.background.backgroundGradiant.color1 = color2;
				}
				
			}
			
		}
		
		
		
		public function get opacity(): Number {
			return _opacity * 100;
		}
		
		public function set opacity(opacity: Number) {
			_opacity = opacity/100;
		}
		
		public function get background(): Background {
			return _background;
		}
		
		public function set background(background: Background) {
			_background = background;
	
			
		}
		
		public function get border(): Border {
			return _border;
		}
		
		public function set border(border: Border) {
			_border = border;
			
		}
		
		//---------------
		public function get padding(): uint {
			return _padding;
		}
		
		public function set padding(padding: uint) {
			_padding = padding;
			_paddingRight = padding;
			_paddingLeft = padding;
			_paddingTop = padding;
			_paddingBottom =  padding;
			
		}
		
		//---------------
		public function get paddingRight(): uint {
			return _paddingRight;
		}

		public function set paddingRight(paddingRight: uint) {
			_paddingRight = paddingRight;
		}

		//---------------
		public function get paddingLeft(): uint {
			return _paddingLeft;
		}

		public function set paddingLeft(paddingLeft: uint) {
			_paddingLeft = paddingLeft;
		}
		//---------------
		public function get paddingTop(): uint {
			return _paddingTop;
		}

		public function set paddingTop(paddingTop: uint) {
			_paddingTop = paddingTop;
		}

		//---------------
		public function get paddingBottom(): uint {
			return _paddingBottom;
		}

		public function set paddingBottom(paddingBottom: uint) {
			_paddingBottom = paddingBottom;
		}
		

	}
	
}
