package com.nao.Listes {

	import com.nao.Containers.Div ;
	import com.nao.Effects.Shadow ;
	import com.nao.Power.Ki;
	import com.nao.Containers.* ;
	import com.nao.Textes.*;
	import com.nao.Components.* ;
	import com.nao.Images.Icone;
	import com.nao.Basic.Position;
	import com.nao.Themes.StyleBalise;
	import com.nao.Modules.Profil;
	import com.nao.Pages.Grid;

	//import flash.display.DisplayObject;
	

	public class SuperListe extends Div {

		
		private var _superListeTab: Array = new Array();
		private var _vertical: Boolean;
		//private var _shadow: Shadow = new Shadow();
		private var _liWidth: uint;
		private var _liHeight: uint;
		private var _rowLimit:uint ;
		private var _paddingHorizontal:uint = 0;
		private var _paddingVertical:uint = 0 ;







		public function SuperListe(x: Number = 0, y: Number = 0, rowLimit:uint = 5, vertical:Boolean = false) {

			_vertical = vertical;
			_rowLimit = rowLimit;
			var wi: uint = marginRight + marginLeft ;
			var he: uint =  marginTop + marginBottom ;
			super(x, y, 1, 1);
			//super.padding = 0;
			
			
			codeHTML = <div> </div>;
			Ki.baliseChange(this);
		}

		
		public function pushItem(li:Balise){
			
			_superListeTab.push(li);
			tabGo();
		//	this.addBalise(li);
			this.addSat(li);
			li.positionArray[1] = this;
			//li.positionTypeX = 1
			Ki.baliseChange(this);
			
		}
		
		public function pushFirstItem(li:Balise)
		{	
			_superListeTab.unshift(li);
			tabGo();
			//this.addBalise(li);
			this.addSat(li);
			Ki.baliseChange(this);
			
		}
		
		public function insert(li:Balise,li2:Balise){
			_superListeTab.insertAt(_superListeTab.indexOf(li2),li);
			tabGo();
			//this.addBalise(li);
			this.addSat(li);
			Ki.baliseChange(this);
				
		}
		
		public function delItem(li:Balise)
		{	
			_superListeTab.removeAt(_superListeTab.indexOf(li));
			li.visible = false;
			this.removeBalise(li);
			this.removeSat(li);
			tabGo();
			Ki.baliseChange(this);
			
		}
		
		public function removeItem(li:Balise)
		{	
			_superListeTab.removeAt(_superListeTab.indexOf(li));
			li.visible = false;
			tabGo();
			Ki.baliseChange(this);
			
		}
		
		
		public function permute(li:Balise,li2:Balise){
		
			var index:uint = _superListeTab.indexOf(li);
			_superListeTab.removeAt(_superListeTab.indexOf(li));
			_superListeTab.insertAt(_superListeTab.indexOf(li2),li);
			superListeTab.removeAt(_superListeTab.indexOf(li2));
			 _superListeTab.insertAt(index,li2);
			
			tabGo();
			Ki.baliseChange(this);
		
		}
		
		
		public function reverseItems()
		{	
			_superListeTab.reverse();
			tabGo();
			Ki.baliseChange(this);
			
		}
		

		public function pushSameLi(li:Li,liOrg:Li){
			/*sameLi(li,liOrg);
			pushLi(li);*/
		}
		
		
		public function sameLi(li:Li, liOrg:Li ){
			/*li.background = liOrg.background ;
			li.border = liOrg.border ;
			Ki.changeLiStyle(li);
			Ki.changeStyle(this);*/
		}
		
		
		public function changeColorLi(li:Li){
			/*for(var i:uint = 0; i< _superListeTab.length; i++)
			{
				_superListeTab[0].background = li.background ;
				
			}*/
			
		}
		
		
		public function refresh(){
			
		}
		
		/*	private function tabGo(){
			
			var wi:Number ;
			var he:Number;
			var higher:Number;
			var i:uint;
			
			_superListeTab[0].x = paddingLeft;
			_superListeTab[0].y = paddingTop;
			
			if (_vertical == true) {
				
				he = paddingTop + paddingBottom ;
				higher = _superListeTab[0].htmlWidth;
				
				for( i=0; i<= _superListeTab.length - 1;i++){
					if(i != 0){
						_superListeTab[i].x = paddingLeft;
						Position.afterY(_superListeTab[i],_superListeTab[i - 1]);
						_superListeTab[i].y += paddingBottom;
					}
					
					he += _superListeTab[i].htmlHeight + _superListeTab[i].marginTop + _superListeTab[i].marginBottom ;
					if(_superListeTab[i].htmlWidth > higher) higher = _superListeTab[i].htmlWidth;
				}
				he += paddingBottom * (_superListeTab.length - 1);
				this.htmlHeight = he ;
				this.htmlWidth = higher + paddingRight + paddingLeft;
				
			} else {
				
				wi = paddingRight + paddingLeft ;
				higher = _superListeTab[0].htmlHeight;
			
			
			for(i=0; i<= _superListeTab.length - 1;i++){
				if(i != 0){
					_superListeTab[i].y = paddingTop;
					Position.afterX(_superListeTab[i],_superListeTab[i - 1]);
					_superListeTab[i].x += paddingRight;
				}
				
				
				wi += _superListeTab[i].htmlWidth + _superListeTab[i].marginRight + _superListeTab[i].marginLeft;
				if(_superListeTab[i].htmlHeight > higher) higher = _superListeTab[i].htmlHeight;
			}
			wi += paddingRight * (_superListeTab.length - 1);
			this.htmlWidth = wi ;
			this.htmlHeight = higher + paddingTop + paddingBottom;
				
		}
			
			
			
		}*/
		
			public function tabGo(){
			
			var wi:Number ;
			var he:Number;
			var higher:Number;
			var i:uint;
			
			_superListeTab[0].x = paddingLeft;
			_superListeTab[0].y = paddingTop;
			
			if (_vertical == true) {
				
				he = paddingTop + paddingBottom ;
				higher = _superListeTab[0].htmlWidth;
				
				for( i=0; i<= _superListeTab.length - 1;i++){
					if(i != 0){
						_superListeTab[i].x = paddingLeft;
						_superListeTab[i - 1].marginBottom = paddingVertical
						Position.afterY(_superListeTab[i],_superListeTab[i - 1]);
						_superListeTab[i].y += paddingVertical;
					}
					
					he += _superListeTab[i].htmlHeight + _superListeTab[i].marginTop + _superListeTab[i].marginBottom ; //i - 1 au lieu de i
					if(_superListeTab[i].htmlWidth > higher) higher = _superListeTab[i].htmlWidth;
				}
				he += paddingVertical * (_superListeTab.length - 1);
				this.htmlHeight = he ;
				this.htmlWidth = higher + paddingRight + paddingLeft;
				
			} else {
				
				wi = paddingRight + paddingLeft ;
				higher = _superListeTab[0].htmlHeight;
			
			
			for(i=0; i<= _superListeTab.length - 1;i++){
				if(i != 0){
					_superListeTab[i].y = paddingTop;
					_superListeTab[i - 1].paddingRight = paddingHorizontal;
					Position.afterX(_superListeTab[i],_superListeTab[i - 1]);
					_superListeTab[i].x += paddingHorizontal;
				}
				
				
				wi += _superListeTab[i].htmlWidth + _superListeTab[i].marginRight + _superListeTab[i].marginLeft; //i - 1 au lieu de i
				if(_superListeTab[i].htmlHeight > higher) higher = _superListeTab[i].htmlHeight;
			}
			wi += paddingHorizontal * (_superListeTab.length - 1);
			this.htmlWidth = wi ;
			this.htmlHeight = higher + paddingTop + paddingBottom;
				
		}
			
			
			
		}
		
		public function cVertical() {
			
			var wi:Number ;
			var he:Number;
			var higher:Number;
			var i:uint ;
			
			if (this._vertical == false) {
				
			he = paddingTop + paddingBottom ;
			higher = _superListeTab[0].htmlWidth;
			for(i = 0; i< _superListeTab.length; i++)
			{
				
				_superListeTab[i].x = _superListeTab[0].x ;
				if(i != 0){
					Position.afterY(superListeTab[i],_superListeTab[i - 1]);
				_superListeTab[i].y += paddingBottom;
				}
				
				he += _superListeTab[i].htmlHeight + _superListeTab[i].marginTop + _superListeTab[i].marginBottom ;
				if(_superListeTab[i].htmlWidth > higher) higher = _superListeTab[i].htmlWidth;
				
				
			}
			he += paddingBottom * (_superListeTab.length - 1);
			this.htmlHeight = he ;
			this.htmlWidth = higher + paddingRight + paddingLeft;
			
			this._vertical = true;
				
			} else {
				
			
			wi = paddingRight + paddingLeft ;
			higher = _superListeTab[0].htmlHeight;	
			for(i = 0; i< _superListeTab.length; i++)
			{
				_superListeTab[i].y = _superListeTab[0].y ;
				if(i != 0){
				Position.afterX(superListeTab[i],_superListeTab[i - 1]);
				_superListeTab[i].x += paddingRight;
				}
				wi += _superListeTab[i].htmlWidth + _superListeTab[i].marginRight + _superListeTab[i].marginLeft;
				if(_superListeTab[i].htmlHeight > higher) higher = _superListeTab[i].htmlHeight;
				
				
			}
			wi += paddingRight * (_superListeTab.length - 1);
			this.htmlWidth = wi ;
			this.htmlHeight = higher + paddingTop + paddingBottom;

			this._vertical = false;
			}
			
			Ki.baliseChange(this);
		
		}
		
	//--------------------------------------------------------------------------------------
		
		
		public function listeImg():void{
			
			 emptyTab();
			
			var img1:Balise = new Balise(0,0,50,50);
			img1.background.backgroundImage = "http://localhost/shenron/image.jpg";
			img1.border.borderStyle = "solid";
			img1.border.borderWidth = 2;
			Ki.baliseChange(img1);
			
			var img2:Balise = new Balise(0,0,50,50);
			StyleBalise.copyBaliseStyle(img2,img1);
			Ki.baliseChange(img2);
			
			var img3:Balise = new Balise(0,0,50,50);
			StyleBalise.copyBaliseStyle(img3,img1);
			Ki.baliseChange(img3);
			
			var img4:Balise = new Balise(0,0,50,50);
			StyleBalise.copyBaliseStyle(img4,img1);
			Ki.baliseChange(img4);
			
			var img5:Balise = new Balise(0,0,50,50);
			StyleBalise.copyBaliseStyle(img5,img1);
			Ki.baliseChange(img5);
			
			this.superListeTab = [];
			this.padding = 3;
		
			pushItem(img1);
			pushItem(img2);
			pushItem(img3);
			pushItem(img4);
			pushItem(img5);
			
			Ki.baliseChange(this);
			
		}
		
		
		public function listeTeam(grid:Grid):void{
			
			emptyTab();
			
			var profil1:Profil = new Profil(grid,"Marc Stewart", 20,20,2,230);
			profil1.mainModule.border.borderStyle = "solid";
			profil1.mainModule.border.borderWidth = 2 ;
			profil1.profilRounded(grid,2);
			profil1.sousTitre.label = "CEO";
			profil1.sousTitre.visible = true;
			Ki.profilChange(profil1);
			
			var profil2:Profil = new Profil(grid,"Cathy Lewis", 20,20,2,230);
			profil2.profilRounded(grid,2);
			//StyleBalise.copyBaliseStyle(profil2,profil1);
			profil2.sousTitre.label = "Designer";
			profil2.sousTitre.visible = true;
			Ki.profilChange(profil2);
			
			var profil3:Profil = new Profil(grid,"Kelly Johnson", 20,20,2,230);
			profil3.profilRounded(grid,2);
			profil3.sousTitre.label = "Webmaster";
			profil3.sousTitre.visible = true;
			Ki.profilChange(profil3);
			
			var profil4:Profil = new Profil(grid,"Bradley Lewis", 20,20,2,230);
			profil4.profilRounded(grid,2);
			profil4.sousTitre.label = "Community manager";
			profil4.sousTitre.visible = true;
			Ki.profilChange(profil4);
			
			this.padding = 50;
			this.paddingTop = 10;
			this.paddingBottom = 10;
			
			pushItem(profil1);
			pushItem(profil2);
			pushItem(profil3);
			pushItem(profil4);
			
			Ki.baliseChange(this);
			
		}
		
		public function emptyTab():void{
			
			for(var i:uint = 0; i<= superListeTab.length - 1; i++)
			{
				_superListeTab[i].visible = false;
				_superListeTab[i] = null;
			}
			this.superListeTab = [];
			Ki.baliseChange(this);
		}
		
		
		public function addTab(superListe:SuperListe):void{
			
			for(var i:uint = 0; i<= superListe.superListeTab.length - 1; i++)
			{
				pushItem(superListe.superListeTab[i]);
			}
			Ki.baliseChange(this);
			
		}
	
		
	//------------------------------------------------------------------------------------

		public function get superListeTab(): Array {
			return _superListeTab;
		}

		public function set superListeTab(superListeTab: Array) {
			_superListeTab = superListeTab;
		}

		//---------------
		public function get vertical(): Boolean {
			return _vertical;
		}

		public function set vertical(vertical: Boolean) {
			_vertical = vertical;
		}


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
		
		//---------------------	

	/*	public function get shadow(): Shadow {
			return _shadow;
		}

		public function set shadow(shadow: Shadow) {
			_shadow = shadow;
		}*/
		
		public function get rowLimit(): int {
			return _rowLimit;
		}

		public function set rowLimit(rowLimit: int) {
			_rowLimit = rowLimit;
		}
		
		//---------------------	

		public function get paddingHorizontal(): uint {
			return _paddingHorizontal;
		}

		public function set paddingHorizontal(paddingHorizontal: uint) {
			_paddingHorizontal = paddingHorizontal;
		}
		//---------------------	

		public function get paddingVertical(): uint {
			return _paddingVertical;
		}

		public function set paddingVertical(paddingVertical: uint) {
			_paddingVertical = paddingVertical;
		}
		
		
		
		
		//-----------------------------------------------FONCTIONS--------------------------------------------------
		
		
		public function listeVertivalContact():void{
			
				var defaultSuperListe:SuperListe = new SuperListe();
				Ki.equalizeSuperListe(this,defaultSuperListe);
				
			
				var support:IconeTexte = new IconeTexte("Get in Touch");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontWeight = true;
				
				//support.fontSize = 17;
				var espace:Texte = new Texte("");
				
				
				var phone:Telephone = new Telephone();
				phone.fontFamily = "Open sans";
				phone.color = 0xFFFFFF;
			
				var adress:Adress = new Adress();
				adress.fontFamily = "Open sans";
				adress.color = 0xFFFFFF;
			
				
				var social:SocialIcon = new SocialIcon();
				social.fontFamily = "FontAwesome";
				social.color = 0xFFFFFF;
			
			
			
			
				this.background.backgroundImage = "transparent";

				this.pushItem(support);
				this.pushItem(espace);
				this.pushItem(phone);
				this.pushItem(adress);
				this.pushItem(social);
				
				Ki.baliseChange(this);
			
		
			this.cVertical();
		}
		
		
		

		

	}

}