package com.nao.Listes {

	import com.nao.Containers.Div ;
	import com.nao.Effects.Shadow ;
	import com.nao.Power.Ki;
	import com.nao.Listes.Li;
	

	public class Liste extends Div {

		//private var li:Texte;
		private var _tabLi : Array = new Array();
		
		private var _vertical: Boolean = false;
		private var _marginRightLi: uint = 0;
		private var _marginLeftLi: uint = 0;
		private var _marginTopLi: uint = 0;
		private var _marginBottomLi: uint = 0;
		//private var padding: uint = 10;
		private var _liWidth: uint;
		private var _liHeight: uint;


		protected var _textDecoration: String = "none"; //text-decoration: none|underline|overline|line-through|initial|inherit;
		//protected var _shadow: Shadow = new Shadow();
		protected var _fontFamily: String = "none";
		protected var _fontSize: uint = 14;
		protected var _fontStyle: String = "normal";
		protected var _fontWeight: Boolean = false;
		protected var _fontVariant: Boolean = false;
		protected var _letterSpacing: uint = 1000;






		public function Liste(x: Number = 0, y: Number = 0, liWidth: Number = 100, liHeight: Number = 30) {

			_liWidth = liWidth;
			_liHeight = liHeight;
			

			var wi: uint = liWidth + _marginRightLi + _marginLeftLi ;
			var he: uint = liHeight + _marginTopLi + _marginBottomLi ;
			super(x, y, wi, he);
			super.padding = 0;
			
			
			codeHTML = <div> </div>;
			this.background.backgroundImage = "transparent";
			//this.background.backgroundColor = 0x563599;
		//	this.htmlLoad.paintsDefaultBackground = false ;
			Ki.baliseChange(this);
		}


		public function pushLi(li: Li) {
			_tabLi.push(li);

			if (_vertical == true) {

				li.x = _marginLeftLi;
				if (_tabLi.length == 1) {
					li.y = _marginTopLi;
				} else {
					li.y = _marginTopLi + (liHeight  + padding) * (_tabLi.length - 1);
				}
				
				li.width = this._liWidth; 
				li.height = this._liHeight 

				this.htmlHeight = _tabLi.length * (liHeight + padding) + _marginBottomLi + _marginTopLi - padding;
				
				
			} else {
				li.y = _marginTopLi;
				if (_tabLi.length == 1) {
					li.x = _marginRightLi;
				} else {
					li.x = _marginRightLi + (liWidth +  padding) * (_tabLi.length - 1);
				}
				
				li.width = this._liWidth;
				li.height = this._liHeight;

				this.htmlWidth = _tabLi.length * (liWidth + padding) + _marginLeftLi + _marginRightLi - padding;
				

			}
			if (this.textDecoration != "none") li.textDecoration = textDecoration;
			if (this.letterSpacing != 1000) li.letterSpacing = letterSpacing;
			if (this.fontSize != 14) li.fontSize = fontSize;
			if (this.fontStyle != "normal") li.fontStyle = fontStyle;
			if (this.fontFamily != "none") li.fontFamily = fontFamily;
			if (this.fontWeight != true) li.fontWeight = fontWeight;
			if (this.fontVariant != true) li.fontVariant = fontVariant;

			
			this.addChild(li);
			Ki.liChange(li);
			//Ki.boutonChange(li);
			Ki.baliseChange(this);
			
			
		}
		
		public function permute(li:Li,li2:Li){
			
			var temp:Li = new Li("");
			temp = _tabLi[li2];
			_tabLi[li2] = _tabLi[li];
			_tabLi[li] = temp;
			
			var lix:int = li.x;
			var liy:int = li.y;
			
			li.x = li2.x;
			li.y = li2.y;
			
			li2.x = lix;
			li2.y = liy;
			
		}
		
		
		public function insert(li:Li,li2:Li){
			var positionY:int = li2.y;
			var positionX:int = li2.x;
			var i:uint;
			
			if (_vertical == true) {
				for(i = 0; i<_tabLi.length; i++)
				{
				
					if(positionY <= _tabLi[i].y) 
					{
						_tabLi[i].y = _tabLi[i].y + li.height + padding;
					}
					
				}
				
		}else{
			for(i = 0; i<_tabLi.length; i++)
				{
				
					if(positionX <= _tabLi[i].x) 
					{
						_tabLi[i].x = _tabLi[i].x + li.width + padding;
					}
					
				}
				
		}
		
		li.x = positionX;
		li.y = positionY;
		
	}
		
		
		public function delLi(li:Li)
		{	
			_tabLi.removeAt(_tabLi.indexOf(li));
			var positionY:int = li.y;
			var positionX:int = li.x;
			var i:uint;
			this.removeChild(li);
			
			if (_vertical == true) {
				for(i = 0; i<_tabLi.length; i++)
				{
				
					if(positionY < _tabLi[i].y) 
					{
						_tabLi[i].y = _tabLi[i].y - li.height - padding;
					}
					
				}
				this.htmlLoad.height = this.htmlLoad.height - li.height - padding;
		}else{
			for(i = 0; i<_tabLi.length; i++)
				{
				
					if(positionX < _tabLi[i].x) 
					{
						_tabLi[i].x = _tabLi[i].x - li.width - padding;
					}
					
				}
				this.htmlLoad.width = this.htmlLoad.width - li.width - padding;
			
			
		}
		Ki.baliseChange(this);
		
	}
		

		public function pushSameLi(li:Li,liOrg:Li){
			sameLi(li,liOrg);
			pushLi(li);
		}
		
		
		public function sameLi(li:Li, liOrg:Li ){
			li.background = liOrg.background ;
			li.border = liOrg.border ;
			li.fontFamily = liOrg.fontFamily;
			li.fontSize = liOrg.fontSize;
			li.color = liOrg.color ;
			li.letterSpacing  = liOrg.letterSpacing ;
			li.lineHeight  = liOrg.lineHeight ;
			li.textTransform = liOrg.textTransform; 
			li.whiteSpace = liOrg.whiteSpace;
			li.wordSpacing = liOrg.wordSpacing ;
			li.textDecoration = liOrg.textDecoration; 
			//li.shadow = liOrg.shadow;
			
			li.fontStyle = liOrg.fontStyle;
			li.fontWeight  = liOrg.fontWeight;
			li.fontVariant = liOrg.fontVariant;
			//li.opacity = liOrg.opacity;
			li.textIndent = liOrg.textIndent;
			li.textAlign = liOrg.textAlign;
			li.textAlignLast = liOrg.textAlignLast;
			
			
			
			
			Ki.liChange(li);
			//Ki.boutonChange(li);
			Ki.baliseChange(this);
		}
		
		
		public function changeColorLi(li:Li){
			for(var i:uint = 0; i< _tabLi.length; i++)
			{
				_tabLi[0].background = li.background ;
				
			}
			
		}
		
		
		public function refresh(){
			
		}
		
		
		public function cVertical() {
			
		/*	var tabChange:Array =new Array();
			var i: uint;*/
			var i:uint ;
			
			if (this._vertical == false) {
				

			for(i = 1; i< _tabLi.length; i++)
			{
				
				_tabLi[i].x = _tabLi[0].x ;
				tabLi[i].y =  tabLi[i].y + (liHeight + padding) * i;
				
			}
			this.htmlLoad.height = _tabLi.length * (liHeight + padding) + _marginBottomLi + _marginTopLi - padding;
			this.htmlLoad.width = liWidth + _marginLeftLi + _marginRightLi;
			
			this._vertical = true;
				
			} else {
				
			
				
			for(i = 1; i< _tabLi.length; i++)
			{
				_tabLi[i].y = _tabLi[0].y ;
				tabLi[i].x = tabLi[i].x + (liWidth  + padding) * i;
				
			}
			this.htmlLoad.width = _tabLi.length * (liWidth + padding) + _marginLeftLi + _marginRightLi - padding;
			//this.htmlLoad.height = liHeight + tabLi[0].border.borderBottomWidth + tabLi[0].border.borderTopWidth + _marginTopLi + _marginBottomLi; 
			this.htmlLoad.height = liHeight + _marginTopLi + _marginBottomLi; 

			this._vertical = false;
			}
			
			Ki.baliseChange(this);
		
		}
		
		
		
	

		public function get tabLi(): Array {
			return _tabLi;
		}

		public function set tabLi(tabLi: Array) {
			_tabLi = tabLi;
		}

		//---------------
		public function get marginRightLi(): uint {
			return _marginRightLi;
		}

		public function set marginRightLi(marginRightLi: uint) {
			_marginRightLi = marginRightLi;
		}

		//---------------
		public function get marginLeftLi(): uint {
			return _marginLeftLi;
		}

		public function set marginLeftLi(marginLeftLi: uint) {
			_marginLeftLi = marginLeftLi;
		}
		//---------------
		public function get marginTopLi(): uint {
			return _marginTopLi;
		}

		public function set marginTopLi(marginTopLi: uint) {
			_marginTopLi = marginTopLi;
		}

		//---------------
		public function get marginBottomLi(): uint {
			return _marginBottomLi;
		}

		public function set marginBottomLi(marginBottomLi: uint) {
			_marginBottomLi = marginBottomLi;
		}

		//---------------
		/*override public function get padding(): uint {
			return padding;
		}

		override public function set padding(padding: uint) {
			padding = padding;
		}*/

		//---------------
		public function get liWidth(): uint {
			return _liWidth;
		}

		public function set liWidth(liWidth: uint) {
			_liWidth = liWidth;
		}

		//---------------
		public function get liHeight(): uint {
			return _liHeight;
		}

		public function set liHeight(liHeight: uint) {
			_liHeight = liHeight;
		}

		//---------------
		public function get vertical(): Boolean {
			return _vertical;
		}

		public function set vertical(vertical: Boolean) {
			_vertical = vertical;
		}



		//---------------------		
		public function get textDecoration(): String {
			return _textDecoration;
		}

		public function set textDecoration(textDecoration: String) {

			_textDecoration = textDecoration;
			for (var i: uint = 0; i < _tabLi.length; i++) {
				_tabLi[i].textDecoration = textDecoration;
				Ki.liChange(_tabLi[i]);
				//Ki.boutonChange(_tabLi[i]);
				
			}
		}
		//---------------------	

		/*public function get shadow(): Shadow {
			return _shadow;
		}

		public function set shadow(shadow: Shadow) {
			_shadow = shadow;
		}*/

		//---------------------		
		public function get fontFamily(): String {
			return _fontFamily;
		}

		public function set fontFamily(fontFamily: String) {

			_fontFamily = fontFamily;
		}

		//---------------------	
		public function get fontSize(): uint {
			return _fontSize;
		}

		public function set fontSize(fontSize: uint) {

			_fontSize = fontSize;
		}

		//---------------------		
		public function get fontStyle(): String {
			return _fontStyle;
		}

		public function set fontStyle(fontStyle: String) {

			_fontStyle = fontStyle;
		}

		//---------------------	
		public function get fontWeight(): Boolean {
			return _fontWeight;
		}

		public function set fontWeight(fontWeight: Boolean) {

			_fontWeight = fontWeight;
		}

		//---------------------	
		public function get fontVariant(): Boolean {
			return _fontVariant;
		}

		public function set fontVariant(fontVariant: Boolean) {

			_fontVariant = fontVariant;
		}

		//-----------------------------

		public function get letterSpacing(): uint {
			return _letterSpacing;
		}

		public function set letterSpacing(letterSpacing: uint) {

			_letterSpacing = letterSpacing;
		}

		//---------------------------------------------------------------Exemples------------------------------------------------
		//-----------------------------------------------------------------------------------------------------------------------

		public function colorChange(color:uint){
			
			for(var i=0;i< this.tabLi.length;i++){
				
				this.tabLi[i].color = color;
				Ki.liChange(tabLi[i]);
				//Ki.boutonChange(tabLi[i]);
			}
			
			
		}
		
			public function fontChange(font:String){
			
			for(var i=0;i< this.tabLi.length;i++){
				
				this.tabLi[i].fontFamily = font;
				Ki.liChange(tabLi[i]);
				//Ki.boutonChange(tabLi[i]);
			}
			
			
		}
		
		
		
		
		public function listeHorizontalMenu():void{
				var defaultListe:Liste = new Liste();
				Ki.equalizeListe(this,defaultListe);
			
			
				var li1:Li = new Li("Home");
				li1.fontFamily = "Patua One";
				li1.color = 0xFFFFFF;
				var li2:Li = new Li("Services");
				var li3:Li = new Li("Blog");
				var li4:Li = new Li("Photos");
				var li5:Li = new Li("Contacts");
				this.background.backgroundImage = "transparent";

				this.pushLi(li1);
				this.pushSameLi(li2,li1);
				this.pushSameLi(li3,li1);
				this.pushSameLi(li4,li1);
				this.pushSameLi(li5,li1);
				Ki.baliseChange(this);
			
			
			
		}
		
		public function listeVertival():void{
			
				var defaultListe:Liste = new Liste();
				Ki.equalizeListe(this,defaultListe);
				
			
				var support:Li = new Li("Compagny");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontWeight = true;
				//support.fontSize = 17;
				var espace:Li = new Li("");
				
				
				var li1:Li = new Li("Home");
				li1.fontFamily = "Open sans";
				li1.color = 0xFFFFFF;
			
				var li2:Li = new Li("Services");
				var li3:Li = new Li("Blog");
				var li4:Li = new Li("Photos");
				var li5:Li = new Li("Contacts");
				this.background.backgroundImage = "transparent";

				this.pushLi(support);
			
				
				this.pushLi(li1);
				this.pushSameLi(li2,li1);
				this.pushSameLi(li3,li1);
				this.pushSameLi(li4,li1);
				this.pushSameLi(li5,li1);
				Ki.baliseChange(this);
			
		
			this.cVertical();
		}
		
		//public function listeVertivalContact():void{
		//	
		//		var defaultListe:Liste = new Liste();
		//		Ki.equalizeListe(this,defaultListe);
		//		
		//	
		//		var support:Li = new Li("Get in Touch);
		//		support.fontFamily = "Patua One";
		//		support.color = 0xFFFFFF;
		//		support.fontWeight = true;
		//		//support.fontSize = 17;
		//		var espace:Li = new Li("");
		//		
		//		
		//		var li1:Li = new Li("Phone: 256 235 263","",1);
		//		li1.fontFamily = "Open sans";
		//		li1.color = 0xFFFFFF;
		//	
		//		var li2:Li = new Li("Services");
		//		var li3:Li = new Li("Blog");
		//		var li4:Li = new Li("Photos");
		//		var li5:Li = new Li("Contacts");
		//		this.background.backgroundImage = "transparent";

		//		this.pushLi(support);
		//	
		//		
		//		this.pushLi(li1);
		//		this.pushSameLi(li2,li1);
		//		this.pushSameLi(li3,li1);
		//		this.pushSameLi(li4,li1);
		//		this.pushSameLi(li5,li1);
		//		Ki.baliseChange(this);
		//	
		//
		//	this.cVertical();
		//}
		
		
		
		public function listeCallToAction():void{
			
				var defaultListe:Liste = new Liste();
				Ki.equalizeListe(this,defaultListe);
			
				var li1:Li = new Li("Purchase Now");
				li1.fontFamily = "Patua One";
				li1.border.borderStyle = "solid";
				li1.border.borderWidth = 2;
				/*li1.background.backgroundImage ="color";
				li1.background.backgroundColor = 0x865243;*/
				this.padding = 20;
				this.liWidth = 200;
				this.liHeight = 30;
				var li2:Li = new Li("How it's works");
				
				this.background.backgroundImage = "transparent";

				this.pushLi(li1);
				this.pushSameLi(li2,li1);
				
				
				Ki.baliseChange(this);
			
			
			
		}
		
		
	}

}