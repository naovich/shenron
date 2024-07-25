package com.nao.Blocks {
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Components.Bouton;

	import com.nao.Listes.Liste;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Components.Email;
	import com.nao.Components.Copyright;
	import com.nao.Images.Image;
	import com.nao.Textes.IconeTexte;
	import com.nao.Components.SocialIcon;
	import com.nao.Basic.Position;
	import flash.geom.Point;
	import com.nao.Power.Ki;
	import com.nao.Pages.Grid;
	import com.nao.Modules.BlankModule;
	import com.nao.Images.IconeBalise;
	import com.nao.Listes.SuperListe;
	import com.nao.Modules.GetInTouch;
	import com.nao.Modules.StayInTouch;
	import com.nao.Modules.Social;
	import com.nao.Modules.Compagny;
	import com.nao.Modules.Payment;
	import com.nao.Forms.Contact;
	import com.nao.Modules.AboutUs;
	import com.nao.Basic.Copy;
	import com.nao.Containers.Form;
	
	public class Footer extends BlankModule {
		

		private var _titre:IconeTexte = new IconeTexte("Titre du message","",0,0,0,110);
		private var _liste:Liste = new Liste();
		private var _telephone:Telephone = new Telephone();
		private var _adress:Adress = new Adress();
		private var _email:Email = new Email();
		private var _form:Contact;
	
		private var _copyright:Copyright = new Copyright();
		private var _logo:Image = new Image(0,0,120,50);
		private var _socialIcon:SocialIcon = new SocialIcon();
		private var _superListe:SuperListe = new SuperListe();
		
		private var _getInTouch:GetInTouch = new GetInTouch();
		private var _stayInTouch:StayInTouch = new StayInTouch();
		private var _social:Social = new Social ();
		private var _compagny:Compagny = new Compagny();
		private var _payment:Payment = new Payment();
		private var _aboutUs:AboutUs;
	
		
		

		public function Footer(grid:Grid,column:uint = 0 ,debutCol:int = -1,height:Number = 400,y:Number = 0,x:Number = 0,width:Number = 200) {
		
			//_container = balise;
		super(grid,column ,debutCol,height,y,x,width );
			this.column = column;
			this.debutCol = debutCol;
			
			
			aboutUs = new AboutUs(grid,"About us",0,0,3,150);
			
			this.addBalise(aboutUs);
						
			//------------------addChild-----------
			this.addBalise(_liste);
			this.addBalise(_telephone);
			this.addBalise(_adress);
			this.addBalise(_email);
			this.addBalise(_copyright);
			this.addBalise(_logo);
			
			
			this.addBalise(_socialIcon);
			this.addBalise(_superListe);
			this.addBalise(_getInTouch);
			this.addBalise(_stayInTouch);
			this.addBalise(_social);
			this.addBalise(_compagny);
			this.addBalise(_payment);
			this.addBalise(_aboutUs);
			this.addBalise(_form);
		
		
	
			
	
			liste.listeVertival();
			//superListe.listeVertivalContact();
			
			footerDefault(grid,column,debutCol,height,y, x,width);
			
		}
		
		
		//---------------------------------------------GETTER/SETTER----------------------------------------

		
		//---------------------------------------------------------------Exemples------------------------------------------------
		//-----------------------------------------------------------------------------------------------------------------------
		
		public function footerDefault(grid:Grid,column:uint = 0,debutCol:int=-1,height:Number = 400,y:Number = 0, x:Number = 0,width:Number = 200):void{
			
			
			
			
			var _defaultModule:Div = new Div(0,0,grid.page.htmlWidth,this.htmlHeight) ;
			var _defaultHeader:Div = new Div(0,0,grid.page.htmlWidth,30);
			var _defaultMainModule:Div = new Div(0,0,grid.page.htmlWidth,this.htmlHeight);
		
			var _defaultFooter:Div = new Div(0,0,grid.page.htmlWidth,50);
			var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			var _defaultListe:Liste = new Liste();
			var _defaultTelephone:Telephone = new Telephone();
			var _defaultAdress:Adress = new Adress();
			var _defaultEmail:Email = new Email();
		
			var _defaultCopyright:Copyright = new Copyright();
			var _defaultLogo:Image = new Image(0,0,120,50);
			var _defaultSocialIcon:SocialIcon = new SocialIcon();
			var _defaultSuperListe:SuperListe = new SuperListe();
			
			var _defaultGetInTouch:GetInTouch = new GetInTouch();
			var _defaultStayInTouch:StayInTouch = new StayInTouch();
			var _defaultSocial:Social = new Social ();
			var _defaultCompagny:Compagny = new Compagny();
			var _defaultPayment:Payment = new Payment();
			var _defaultAboutUs:AboutUs = new AboutUs(grid);
			
			aboutUs.positionArray[1] = this;
			aboutUs.positionArray[0] = this;
			aboutUs.positionArray[5] = this;
			aboutUs.titre.positionTypeX = 5;
			
			aboutUs.titre.fontSize = 16;
			aboutUs.titre.marginBottom = 20;
			aboutUs.titre.color = 0xFFFFFF;
			aboutUs.texte.color = 0xFFFFFF;
			aboutUs.texte.positionArray[0] = titre;
			aboutUs.texte.marginTop = 10;
			
			aboutUs.background.backgroundImage = "transparent";
			
			
			//-------Disposition--------
			
			mainModule.disposition = 4;
			
			
			aboutUs.padding = 0;
			//aboutUs.paddingLeft = 0;
			//aboutUs.paddingRight = 0;
			
			
			
			var _defaultContact:Contact = new Contact(grid);
			_defaultContact.lastname.visible = false;
			_defaultContact.message.inputText.inputHeight = 70;
			_defaultContact.lastname.marginTop = 0;
			_defaultContact.email.marginTop = 0;
			_defaultContact.subject.marginTop = 0;
			_defaultContact.message.marginTop = 0;
			_defaultContact.email.positionArray[0] = _defaultContact.firstname;
			
		
			
			//------------------Attributs--------------
			
			Copy.baliseCopy(_defaultModule,this,true,false,true,true);
			
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.iconeTexteCopy(_defaultTelephone,telephone,true,true,true,true);
			Copy.iconeTexteCopy(_defaultAdress,adress,true,true,true,true);
			Copy.iconeTexteCopy(_defaultEmail,email,true,true,true,true);
			Copy.texteCopy(_defaultSocialIcon,socialIcon,true,true,true,true);
			
			Copy.baliseCopy(_defaultGetInTouch,getInTouch,true,true,true,true);
			Copy.baliseCopy(_defaultStayInTouch,stayInTouch,true,true,true,true);
			Copy.baliseCopy(_defaultSocial,social,true,true,true,true);
			Copy.baliseCopy(_defaultCompagny,compagny,true,true,true,true);
			Copy.baliseCopy(_defaultContact,form,true,true,true,true);
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			//_defaultModule.padding = this.padding ;
			//Ki.equalizeMain(this,_defaultModule);
			//Ki.equalize(mainModule,_defaultMainModule);
			//Ki.equalize(header,_defaultHeader);
			//Ki.equalize(footer,_defaultFooter);
			//Ki.equalize(telephone,_defaultTelephone);
			//Ki.equalize(email,_defaultEmail);
			//Ki.equalize(adress,_defaultAdress);
			//Ki.equalize(socialIcon,_defaultSocialIcon);
			//Ki.equalizeNoSize(liste,_defaultListe);
			//Ki.equalizeSuperListe(superListe,_defaultSuperListe);
			//Ki.equalizeSuperListe(getInTouch,_defaultGetInTouch);
			//Ki.equalizeSuperListe(getInTouch,_defaultStayInTouch);
			//Ki.equalizeSuperListe(social,_defaultSocial);
			//Ki.equalizeSuperListe(compagny,_defaultCompagny);
			//Ki.equalizeSuperListe(payment,_defaultPayment);
			////Ki.equalizeContact(form,_defaultContact);
			//		
			//header == _defaultHeader;
			//footer == _defaultFooter;
			//mainModule == _defaultMainModule;
			//liste == _defaultListe;
			//telephone == _defaultTelephone;
			//email == _defaultEmail;
			//adress == _defaultAdress;
			//logo == _defaultLogo;
			//socialIcon == _defaultSocialIcon;
			//superListe == _defaultSuperListe;
			//getInTouch == _defaultGetInTouch;
			//stayInTouch == _defaultStayInTouch;
			//social == _defaultSocial;
			//compagny == _defaultCompagny;
			//payment == _defaultPayment;
			////form == _defaultContact;
			//this.htmlWidth = grid.colWidth(nbCol);
			
			//------------------True---------------
			
			header.visible = false;
			footer.visible = true;
			mainModule.visible = true;
			copyright.visible = true;
			
			
		
			telephone.visible = false;
			email.visible = false;
			adress.visible = false;
			socialIcon.visible = false;
			stayInTouch.visible = false;
			payment.visible = false;
			form.visible = false;
			
			
			header.paddingLeft = grid.gutterWidth;
			header.paddingRight =  grid.gutterWidth;
			footer.paddingLeft = grid.gutterWidth;
			footer.paddingRight =  grid.gutterWidth;
			
			mainModule.paddingLeft = grid.gutterWidth;
			mainModule.paddingRight =  grid.gutterWidth;
			
			mainModule.paddingTop = 5;
			mainModule.paddingBottom = 5;
		
			this.paddingRight =  grid.gutterWidth;
			this.paddingLeft =  grid.gutterWidth;
			
			
			footer.positionTypeY = 6;
			footer.positionArray[0] = mainModule;
			footer.background.backgroundColor = 0x444444;
			footer.paddingTop = 0;
			
			footer.fixedHeight = 30;
			footer.heightType = 0;
			
			copyright.positionArray[1] = footer;
			copyright.positionTypeX = 4;
			copyright.positionTypeY = 4;
			
			
			//Ki.baliseChange(social);
			
			
			mainModule.paddingBottom = 0;
			mainModule.background.backgroundImage ="color";
			mainModule.background.backgroundColor = 0x666666;
			mainModule.heightType = 0;
			mainModule.fixedHeight = 200;
			
			form.lastname.visible = _defaultContact.lastname.visible;
			form.message.inputText.inputHeight = _defaultContact.message.inputText.inputHeight;
			form.lastname.marginTop = _defaultContact.lastname.marginTop ;
			form.email.marginTop = _defaultContact.email.marginTop;
			form.subject.marginTop = _defaultContact.subject.marginTop;
			form.message.marginTop = _defaultContact.message.marginTop;
			form.email.positionArray[0] = _defaultContact.email.positionArray[0];
			form.positionArray[1] = mainModule;
			form.positionTypeX = 3;
			form.positionTypeY = 3;
			form.widthType = 3;
			form.heightType = 3;
			
			this.background.backgroundImage ="transparent";
			
			
			//aboutUs.titre = _defaultAboutUs.titre;
			//aboutUs.texte = _defaultAboutUs.texte;
		
			
			mainModule.addSat(aboutUs);
			mainModule.addSat(compagny);
			mainModule.addSat(getInTouch);
			//mainModule.addSat(stayInTouch);
			mainModule.addSat(social);
			//mainModule.addSat(payment);
			mainModule.disposition = 4;
			copyright.color = 0xFFFFFF;
			this.resizeBaliseHeight();
			Ki.footerChange(this);
			
			
		}
		
		public function footer2(grid:Grid,column:uint = 0,debutCol:int=-1,height:Number = 400,y:Number = 0, x:Number = 0,width:Number = 200){
			footerDefault(grid,column,debutCol,height,y, x,width);
		// this.bouton.visible = true;
			Ki.footerChange(this);
		}
		
		//---------------------------------------------GETTER/SETTER----------------------------------------
		
		public function get aboutUs(): AboutUs {
			return _aboutUs;
		}

		public function set aboutUs(aboutUs: AboutUs) {
			_aboutUs = aboutUs;
		}
		//--------------------	
		public function get titre(): IconeTexte {
			return _titre;
		}
		
		public function set titre(titre: IconeTexte) {

			_titre = titre;
		}
		//--------------------	
		
		public function get liste(): Liste {
			return _liste;
		}

		public function set liste(liste: Liste) {
			_liste = liste;
		}
		//--------------------	
		public function get superListe(): SuperListe {
			return _superListe;
		}

		public function set superListe(superListe: SuperListe) {
			_superListe = superListe;
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
		
		public function get socialIcon(): SocialIcon {
			return _socialIcon;
		}

		public function set socialIcon(socialIcon: SocialIcon) {
			_socialIcon = socialIcon;
		}
		//---------------------	
		
		public function get copyright(): Copyright {
			return _copyright;
		}

		public function set copyright(copyright: Copyright) {
			_copyright = copyright;
		}
		//---------------------	
		
		public function get email(): Email {
			return _email;
		}

		public function set email(email: Email) {
			_email = email;
		}

		//---------------------	
		public function get getInTouch(): GetInTouch {
			return _getInTouch;
		}

		public function set getInTouch(getInTouch: GetInTouch) {
			_getInTouch = getInTouch;
		}
		
		//---------------------	
		public function get stayInTouch(): StayInTouch {
			return _stayInTouch;
		}

		public function set stayInTouch(stayInTouch: StayInTouch) {
			_stayInTouch = stayInTouch;
		}
		
		//---------------------	
		public function get social(): Social {
			return _social;
		}

		public function set social(social: Social) {
			_social = social;
		}
		
		//---------------------	
		public function get compagny(): Compagny {
			return _compagny;
		}

		public function set compagny(compagny: Compagny) {
			_compagny = compagny;
		}
		
		//---------------------	
		public function get payment(): Payment {
			return _payment;
		}

		public function set payment(payment: Payment) {
			_payment = payment;
		}
		
		//---------------------	
		public function get form(): Contact {
			return _form;
		}

		public function set form(form: Contact) {
			_form = form;
		}
		
		
	}
	
	
	
}