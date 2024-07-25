package  com.nao.Blocks {
	import com.nao.Listes.SuperListe;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Texte;
	import com.nao.Containers.Div;
	import com.nao.Modules.BlankModule;
	import com.nao.Images.IconeBalise;
	import com.nao.Images.Image;
	import com.nao.Textes.Paragraph;
	import com.nao.Power.Ki;
	import com.nao.Listes.Liste;
	import com.nao.Listes.SuperListe;
	import com.nao.Components.Bouton;
	import com.nao.Basic.Copy;
	import com.nao.Pages.Grid;
	import com.nao.General.L;
	import flash.geom.Point;
	import com.nao.Basic.Copy;
	import com.nao.Components.ArrowSlide;
	
	public class ServiceBlock extends BlankModule {
		
		
		private var _icone:IconeBalise = new IconeBalise("",0,0,0,30);
		private var _titre:IconeTexte = new IconeTexte("Titre du block","",0,0,0,110);
		private var _texte:Paragraph = new Paragraph(0,50,130,4);
		private var _bouton:Bouton = new Bouton("View more") ;
		private var _image:Image = new Image();
		private var _liste:Liste = new Liste();
		private var _superListe:SuperListe = new SuperListe();
		private var _arrowSlide:ArrowSlide = new ArrowSlide() ;
		

		public function ServiceBlock(grid:Grid, titre:String = "Services", column:uint = 0 ,debutCol:int = -1,height:Number = 250,y:Number = 0,x:Number = 0,width:Number = 200) {
			// constructor code
			super(grid,column ,debutCol,height,y,x,width );
		
			this.titre.label = titre ;
			this.column = column;
			serviceBlockDefault(grid,column,debutCol,height,y, x,width);
			this.debutCol = debutCol;
		
		}
		
			public function serviceBlockDefault(grid:Grid,column:uint = 0,debutCol:int=-1,height:Number = 400,y:Number = 0, x:Number = 0,width:Number = 200):void{
			
			
			
			
			var _defaultModule:Div = new Div(0,0,grid.page.htmlWidth,this.htmlHeight) ;
			var _defaultHeader:Div = new Div(0,0,grid.page.htmlWidth,30);
			var _defaultMainModule:Div = new Div(0,0,grid.page.htmlWidth,this.htmlHeight);
			var _defaultFooter:Div = new Div(0,0,grid.page.htmlWidth,50);
		    var _defaultBouton:Bouton = new Bouton(L.viewMore) ;
			var _defaultImage:Image = new Image();
			var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
		
			var _defaultListe:Liste = new Liste();
			var _defaultSuperListe:SuperListe = new SuperListe();
			var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			var _defaultArrowSlide:ArrowSlide = new ArrowSlide() ;
			
			
			//-------Disposition--------
			
			
			
			//------------------Attributs--------------
			
			Copy.baliseCopy(_defaultModule,this,true,false,true,true);
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			
			Copy.baliseCopy(_defaultImage,image,true,true,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.iconeTexteCopy(_defaulTitre,titre,true,true,true,true);
			Copy.paragraphCopy(_defaulTexte,texte,true,true,true,true);
			Copy.iconeBaliseCopy(_defaultIcone,icone,true,true,true);
			Copy.boutonCopy(_defaultBouton,bouton,true,true,true);
			Copy.baliseCopy(_defaultArrowSlide,arrowSlide,true,true,true,true);
			
			
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			
			//------------------True---------------
			
			header.visible = false;
			footer.visible = false;
			mainModule.visible = false;
			
			bouton.visible = false;
			texte.visible = false;
			liste.visible = false;
			image.visible = false;
			icone.visible = false;
			arrowSlide.visible = false;
		
			titre.visible = true;
			superListe.visible = false;
			
			titre.positionTypeX = 4;
			titre.positionTypeY = 3;
			
			
			superListe.positionTypeX = 4;
			superListe.positionTypeY = 6;
			superListe.positionArray[0] = titre;
			//superListe.background.backgroundImage = "transparent";
			superListe.background.backgroundColor = 0x856232;
			superListe.heightType = 0;
			superListe.disposition = 4;
			superListe.paddingHorizontal = 10;
			//superListe.fixedHeight = superListe.htmlHeight;
			
			arrowSlide.positionTypeX = 4;
			arrowSlide.positionTypeY = 4;
			arrowSlide.widthType = 0;
			arrowSlide.fixedWidth = arrowSlide.htmlWidth;
			arrowSlide.heightType = 0;
			arrowSlide.fixedHeight = arrowSlide.htmlHeight;
			Ki.serviceBlockChange(this);
			
			
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
		public function get icone(): IconeBalise {
			return _icone;
		}

		public function set icone(icone: IconeBalise) {
			_icone = icone;
		}
		
		//--------------------	
		public function get bouton(): Bouton {
			return _bouton;
		}
		
		public function set bouton(bouton: Bouton) {

			_bouton = bouton;
		}
		
		//--------------------	
		public function get image(): Image {
			return _image;
		}
		
		public function set image(image: Image) {

			_image = image;
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
		//--------------------	
		public function get arrowSlide(): ArrowSlide {
			return _arrowSlide;
		}

		public function set arrowSlide(arrowSlide: ArrowSlide) {
			_arrowSlide = arrowSlide;
		}


	}
	
}
