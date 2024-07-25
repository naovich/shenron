package com.nao.Blocks {
	import com.nao.Containers.Balise;
	import com.nao.Components.Bouton;
	import com.nao.Modules.Login;
	import com.nao.Listes.Liste;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Images.Image;
	import com.nao.Components.SocialIcon;
	import com.nao.Basic.Position;
	import flash.geom.Point;
	import com.nao.Power.Ki;
	import com.nao.Pages.Grid;
	import com.nao.Modules.BlankModule;
	import com.nao.Images.IconeBalise;
	import flash.display.Sprite;
	import com.nao.Basic.Copy;
	
	public class Menu extends BlankModule {
	//public var child1:Sprite = new Sprite();
	public var tab:Array;

	var _menuStyle:uint;
		
	private var _liste:Liste = new Liste();
	private var _telephone:Telephone = new Telephone();
	private var _adress:Adress = new Adress();
	//private var _email:Email = new Email();
	private var _login:Login = new Login() ;
	private var _logo:Image = new Image(0,0,120,50);
	private var _socialIcon:SocialIcon = new SocialIcon();
	private var _icone:IconeBalise = new IconeBalise("",0,0,0,30);
	
		
		

		public function Menu(grid:Grid,column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200) {
		
			super(grid,column ,debutCol,height,y,x,width );
			this.column = column;
			//------------------addChild-----------
	
		
			
			liste.listeHorizontalMenu();
			
			menuDefault(grid,column,debutCol,height,y, x,width);
			
			
		
		}
		
		
		//---------------------------------------------GETTER/SETTER----------------------------------------

		
		//---------------------------------------------------------------Exemples------------------------------------------------
		//-----------------------------------------------------------------------------------------------------------------------
		
		public function menuDefault(grid:Grid,column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200):void{
			
			var _defaultModule:Balise = new Balise(0,0,this.htmlWidth,this.htmlHeight) ;
			var _defaultHeader:Balise = new Balise(0,0,this.htmlWidth,30);
			var _defaultMainModule:Balise = new Balise(0,0,this.htmlWidth,this.htmlHeight);
			var _defaultFooter:Balise = new Balise(0,0,this.htmlWidth,50);
			var _defaultLogin:Login = new Login() ;
			var _defaultListe:Liste = new Liste();
			var _defaultTelephone:Telephone = new Telephone();
			var _defaultAdress:Adress = new Adress();
			var _defaultLogo:Image = new Image(0,0,120,50);
			var _defaultSocialIcon:SocialIcon = new SocialIcon();
			var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			
		
			
			//------------------Attributs--------------
			
			//_defaultModule.padding = this.padding ;
			//Ki.equalizeMain(this,_defaultModule);
			
			/*Ki.equalize(mainModule,_defaultMainModule);
			mainModule == _defaultMainModule;*/
			
			/*Ki.equalize(header,_defaultHeader);
			header == _defaultHeader;*/
			
			/*Ki.equalize(footer,_defaultFooter);
			footer == _defaultFooter;*/
			
			/*Ki.equalize(login,_defaultLogin);
			login == _defaultLogin ;*/
			
			/*Ki.equalize(telephone,_defaultTelephone);
			telephone == _defaultTelephone;*/
			
			/*Ki.equalize(adress,_defaultAdress);
			adress == _defaultAdress;*/
			
			/*Ki.equalize(socialIcon,_defaultSocialIcon);
			socialIcon == _defaultSocialIcon;
			*/
			/*Ki.equalizeNoSize(liste,_defaultListe);
			liste == _defaultListe;*/
			
			/*Ki.equalize(icone,_defaultIcone);
			icone == _defaultIcone;
			logo == _defaultLogo;*/
			
			
			Copy.baliseCopy(_defaultModule,this,true,true,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			Copy.baliseCopy(_defaultListe,liste,false,false,true,true);
			Copy.baliseCopy(_defaultLogin,login,true,true,true,true,true);
			Copy.iconeTexteCopy(_defaultTelephone,telephone,true,true,true,true);
			Copy.iconeTexteCopy(_defaultAdress,adress,true,true,true,true);
			Copy.texteCopy(_defaultSocialIcon,socialIcon,true,true,true);

		/*	
		
			
			Copy.iconeTexteCopy(_defaultTelephone,telephone,true,true,true,true);
			
			Copy.texteCopy(_defaultSocialIcon,socialIcon,true,true,true);
			
			Copy.iconeBaliseCopy(_defaultIcone,icone,true,true,true);*/
			
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
					
			
				//------------------True---------------
			liste.visible = true;
			mainModule.visible = true;
			icone.visible = false;
			
			//------------------false--------------
			login.visible = false;
			header.visible = false;
			telephone.visible = false;
			adress.visible = false;
			logo.visible = false;
			socialIcon.visible = false;
			
			//this.htmlWidth = grid.colWidth(nbCol);
			
			
			header.paddingLeft = grid.gutterWidth;
			header.paddingRight =  grid.gutterWidth;
			footer.paddingLeft = grid.gutterWidth;
			footer.paddingRight =  grid.gutterWidth;
			mainModule.paddingLeft = grid.gutterWidth;
			mainModule.paddingRight =  grid.gutterWidth;
			this.paddingRight =  grid.gutterWidth;
			this.paddingLeft =  grid.gutterWidth;
			
			
			liste.widthType = 0;
			liste.fixedWidth = liste.htmlWidth;
			
			liste.heightType = 0;
			liste.fixedHeight = liste.htmlHeight;
			
			login.widthType = 0;
			login.fixedWidth = login.htmlWidth;
			
			login.heightType = 0;
			login.fixedHeight = login.htmlHeight;
			
			logo.heightType = 0;
			logo.fixedHeight = logo.htmlHeight;
			
			logo.widthType = 0;
			logo.fixedWidth = logo.htmlWidth;
			
			liste.colorChange(0x111111);
			liste.positionArray[1] = this;
			liste.positionTypeX = 3;
			liste.positionTypeY = 4;
			
			liste.background.backgroundImage = "transparent";
			//liste.htmlLoad.paintsDefaultBackground = false ;
			Ki.menuChange(this);
		
			
		}
		
		//---------------------------------------------GETTER/SETTER----------------------------------------
		

		
		//--------------------	
		
		
		
		public function menuMobile(grid:Grid,column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200):void{
		menuDefault(grid, column,debutCol,height,y, x,width);
		liste.visible = false;
		icone.visible = true;
		icone.label.label = "";
		icone.positionTypeX = 5;
		icone.positionTypeY = 4;
		
		Ki.menuChange(this);
			
			
			
		}
		
	/*	public function menuT():void{
			var mt:Menu = new Menu(grid);
			this.child1.parent = mt;
			Ki.menuChange(this);
			
		}*/
		
/*public static function clone(source:Object):*{
	var byteArray:ByteArray = new ByteArray();
	byteArray.writeObject(source);
	byteArray.position = 0;
	return(byteArray.readObject());
}*/


		
		public function menu1(grid:Grid,column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200):void{
			
			menuDefault(grid, column,debutCol,height,y, x,width);
			//file001764
			//-----------Visible--------
			
			header.visible = true;
			mainModule.visible = true;
			login.visible = true;
			telephone.visible = true;
			logo.visible = true;
			this.opacity = 0;
			
			
			//-----------Position/Scale--------
			
			header.positionTypeY = 2;
			header.fixedPositionY = 0;
			header.heightType = 0;
			header.fixedHeight = 30;
			//header.marginRight = 20;
			
			mainModule.positionTypeY = 6;
			mainModule.positionArray[0] = header;
			mainModule.heightType = 0;
			mainModule.fixedHeight = 60;
			
			liste.positionArray[1] = mainModule;
			
			login.positionArray[1] = header;
			login.positionTypeX = 3;
			login.positionTypeY = 4;
			
			telephone.positionArray[1] = header;
			telephone.positionTypeX = 5;
			telephone.positionTypeY = 4;
			telephone.heightType = 0;
			telephone.fixedHeight = 14;
			
			logo.positionArray[1] = mainModule;
			logo.positionTypeX = 5;
			logo.positionTypeY = 4;
			logo.scale.y = 0.8;
			
			//----------Apparence-------
			
			header.background.backgroundColor = 0x187DC2;
			//liste.tabLi[0].background.backgroundImage = "color";
			login.color = 0xFFFFFF;
			telephone.color = 0xFFFFFF;
			telephone.fontSize = 12;
			logo.url = "http://localhost/shenron/logo.jpg";
			Ki.menuChange(this);
		}
		
		public function menu2(grid:Grid, column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200):void{
			menuDefault(grid, column,debutCol,height,y, x,width);
			mainModule.background.backgroundImage = "color";
			mainModule.background.backgroundColor = 0x187DC2;
			Ki.menuChange(this);
			
		}
		
		public function menu3(grid:Grid, column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200):void{
			menuDefault(grid, column,debutCol,height,y, x,width);
			mainModule.background.backgroundColor = 0x111111;
			this.opacity =0;
			mainModule.opacity = 0.3;
			//this.background.backgroundImage = "transparent";
			liste.colorChange(0xFFFFFF);
			
			mainModule.background.shadow.shadowBol =true;
			
			Ki.menuChange(this);
		
		}
		
		
		public function menu4(grid:Grid, column:uint=0,debutCol:int=0,height:Number = 60,y:Number = 0, x:Number = 0,width:Number = 200):void{
		//	menuDefault(column,debutCol,height,y, x,width);
			
			
			Ki.baliseChange(this);
		}
		
		
		
		public function menuStyle(menuColor:uint = 0xFFFFFF, opacity:uint = 100 ):void{
			
			this.background.backgroundColor = menuColor;
			this.opacity = opacity;
		Ki.baliseChange(this);
			
		}
		
		public function topMenuStyle(menuColor:uint = 0xFFFFFF, opacity:uint = 100 ):void{
			
			header.background.backgroundColor = menuColor;
			header.opacity = opacity;
		Ki.baliseChange(header);
			
		}
		
		public function mainMenuStyle(menuColor:uint = 0xFFFFFF, opacity:uint = 100 ):void{
			
			mainModule.background.backgroundColor = menuColor;
			mainModule.opacity = opacity;
			Ki.baliseChange(mainModule);
		
			
		}
		
		//--------------------	
		
		public function get liste(): Liste {
			return _liste;
		}

		public function set liste(liste: Liste) {
			_liste = liste;
		}
		
		
			//--------------------	
		public function get login(): Login {
			return _login;
		}

		public function set login(login: Login) {
			_login = login;
		}
		
		
		//---------------------	
		public function get telephone(): Telephone {
			return _telephone;
		}

		public function set telephone(telephone: Telephone) {
			_telephone = telephone;
		}
		
		//---------------------	
		public function get adress(): Adress {
			return _adress;
		}

		public function set adress(adress: Adress) {
			_adress = adress;
		}
		//---------------------	
		public function get logo(): Image {
			return _logo;
		}

		public function set logo(logo: Image) {
			_logo = logo;
		}
		
		//---------------------	
		
	/*	public function get email(): Email {
			return _email;
		}

		public function set email(email: Email) {
			_email = email;
		}*/
		
		//---------------------	
		
		public function get socialIcon(): SocialIcon {
			return _socialIcon;
		}

		public function set socialIcon(socialIcon: SocialIcon) {
			_socialIcon = socialIcon;
		}
		//---------------------	
		public function get icone(): IconeBalise {
			return _icone;
		}

		public function set icone(icone: IconeBalise) {
			_icone = icone;
		}

		

	}
	
}
