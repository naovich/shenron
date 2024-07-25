package com.nao.Modules {
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
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Textes.Texte;
	
	public class CallToAction extends BlankModule {
		

		private var _icone:IconeBalise = new IconeBalise("",0,0,0,30);
		private var _titre:IconeTexte = new IconeTexte("Titre du message","",0,0,0,110);
		private var _texte:Paragraph = new Paragraph(0,50,130,4);
		private var _bouton:Bouton = new Bouton("View more") ;
		private var _liste:Liste = new Liste(0,0,200,40);
		

		public function CallToAction(grid:Grid, x:int = 0, y:int = 0,width:uint = 1200, column:uint = 0,debutCol:int = -1,height:uint = 60) {
			
			//_container = balise;
			super(grid,column ,debutCol,height,y,x,width );
			this.addBalise(_icone);
			this.addBalise(_titre);
			this.addBalise(_texte);
			this.addBalise(_bouton);
			this.addBalise(_liste);
			
			//------------------addChild-----------
			liste.listeCallToAction();
			
			callToActionDefault(grid,column,debutCol,height,y, x,width);
			
		}
		
		
		//---------------------------------------------GETTER/SETTER----------------------------------------

		
		//---------------------------------------------------------------Exemples------------------------------------------------
		//-----------------------------------------------------------------------------------------------------------------------
		
		public function callToActionDefault(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200):void{
			
			var _defaultModule:Balise = new Balise(0,0,1200,this.htmlHeight) ;
			var _defaultHeader:Balise = new Balise(0,0,1200,30);
			var _defaultMainModule:Balise = new Balise(0,0,1200,this.htmlHeight);
			var _defaultFooter:Balise = new Balise(0,0,1200,50);
			var _defaultListe:Liste = new Liste(0,0,200,40);
			var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			//------------------True---------------
			
			liste.visible = true;
			
			//------------------false--------------
			icone.visible = false;
			header.visible = false;
			footer.visible = false;
			mainModule.visible = false;
			titre.visible = false;
			texte.visible = false;
			
			

			//------------------Attributs--------------
			
			_defaultModule.padding = this.padding ;
			Ki.equalizeMain(this,_defaultModule);
			Ki.equalize(mainModule,_defaultMainModule);
			Ki.equalize(header,_defaultHeader);
			Ki.equalize(footer,_defaultFooter);
			Ki.equalize(titre,_defaulTitre);
			Ki.equalize(texte,_defaulTexte);
			Ki.equalizeNoSize(liste,_defaultListe);
			Ki.equalize(icone,_defaultIcone);
			
			
					
			header == _defaultHeader;
			footer == _defaultFooter;
			mainModule == _defaultMainModule;
			liste == _defaultListe;
			titre == _defaulTitre;
			texte == _defaulTexte;
			icone == _defaultIcone;
			
			this.htmlWidth = grid.colWidth(column);
			
			
			liste.colorChange(0x111111);
			liste.positionArray[1] = this;
			liste.positionTypeX = 4;
			liste.positionTypeY = 4;
			liste.background.backgroundImage = "transparent";
			this.background.backgroundImage = "transparent";
			Ki.callToActionChange(this);
			
			
		}
		
		
		//--------------------	
		public function get icone(): IconeBalise {
			return _icone;
		}

		public function set icone(icone: IconeBalise) {
			_icone = icone;
		}
		
		//--------------------	
		public function get titre(): IconeTexte {
			return _titre;
		}
		
		public function set titre(titre: IconeTexte) {

			_titre = titre;
		}
		//--------------------	
		public function get texte(): Paragraph {
			return _texte;
		}
		
		public function set texte(texte: Paragraph) {

			_texte = texte;
		}
		
		//--------------------	
		public function get liste(): Liste {
			return _liste;
		}

		public function set liste(liste: Liste) {
			_liste = liste;
		}
		
		
		
		
		

	}
	
}
