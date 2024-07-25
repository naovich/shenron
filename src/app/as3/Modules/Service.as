package  com.nao.Modules {
	import com.nao.Images.Image;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Modules.BlankModule;
	import com.nao.Images.IconeBalise;
	import com.nao.Components.Bouton;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	import flash.geom.Rectangle;
	import com.nao.Pages.Grid;
	import com.nao.Basic.Copy;
	import com.nao.General.L;
	import flash.geom.Point;
	import com.nao.Basic.Copy;
	import com.nao.General.Selection;
	import com.nao.Images.ImageBalise;
	
	public class Service extends BlankModule {
		
		
		private var _icone:IconeBalise = new IconeBalise("",0,0,0,30);
		private var _titre:IconeTexte = new IconeTexte("Titre du message","",0,0,0,110);
		private var _texte:Paragraph = new Paragraph(0,50,130,4);
		private var _bouton:Bouton = new Bouton("View more") ;
		private var _image:ImageBalise = new ImageBalise();
		
	
		public function Service(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
		
			this.column = column;
			this.debutCol = debutCol;
		
		super(grid,column ,debutCol,height,y,x,width );
		
			this.addBalise(_icone);
			this.addBalise(_titre);
			this.addBalise(_texte);
			this.addBalise(_bouton);
		
			_icone.moduleParent = this;
			_titre.moduleParent = this;
			_texte.moduleParent = this;
			_bouton.moduleParent = this;
			
			
			if(titre != "null"){
			this.titre.label = titre ;
			}else{
				this.titre.label = L.services;	
			}
			
			this.baliseType = "Service";

			serviceDefault(grid,column,debutCol,height,y, x,width);
		//	service1(grid, column,debutCol,200,0,0,200);
			
		}
		
		public function serviceDefault(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			 var _defaultModule:Div = new Div(0,0,176,200);
			 var _defaultMainModule:Div = new Div(0,0,176,200);
			 var _defaultHeader:Div = new Div(0,0,176,40);
			 var _defaultFooter:Div = new Div(0,0,176,40);
			 var _defaultImage:ImageBalise = new ImageBalise();
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton(L.viewMore) ;
			
			
			Copy.baliseCopy(_defaultModule,this,true,false,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			
			Copy.baliseCopy(_defaultImage,image,true,true,true,true);
			Copy.iconeTexteCopy(_defaulTitre,titre,true,true,true,true);
			Copy.paragraphCopy(_defaulTexte,texte,true,true,true,true);
			Copy.iconeBaliseCopy(_defaultIcone,icone,true,true,true);
			Copy.boutonCopy(_defaultBouton,bouton,true,true,true);
			
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			//-----------------Visible---------------------
			titre.visible = true;
			texte.visible = true;
			
			mainModule.visible = false;
			header.visible = false;
			footer.visible = false;
			image.visible = false;
			bouton.visible = false;
			icone.visible = false;
			image.visible = false;
			
			
			//-----------------Valeur par défaut---------------------
		
			
			titre.positionTypeX = 4;
			titre.positionTypeY = 3;
			
			texte.marginBottom = 5;
			titre.marginBottom = 5;
			bouton.marginBottom = 5;
			
			texte.numRow = 1;
			texte.texteWidthType = 1;
			texte.positionTypeX = 5 ;
			texte.positionTypeY = 6;
			texte.row = 5 ;
			texte.texteWidthType = 1;
			texte.positionArray[0] = titre
			
			
			//--------ATTRIBUT-------------
			this.titre.texte.fontFamily = "Patua One";
			this.texte.textAlign = "center";
			this.texte.textAlign ="justify";
		/*	this.titre.icone.label = "";
			this.titre.icone.fontFamily = "Font Awesome";*/
			
			//this.titre.positionIcone = 1;
			//Ki.texteChange(this.titre.icone);
			
			Ki.serviceChange(this);
			//Ki.serviceChange(this);
			//Selection.moduleSelect(this,balise_mc);
			

			
		}
		
	
		
	
		
		public function service1(grid:Grid, column:uint,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200){
			
			serviceDefault(grid,column,this.debutCol,height,y, x,width);
			
			//-----------Visible--------

			this.icone.visible = true;
			
			//-----------Taille----------
			
			
			//-----------Position--------
			
			icone.positionTypeX = 4;
			icone.positionTypeY = 6;
			icone.positionArray[0] = titre;
			icone.marginTop = 50;
			
			
			texte.positionTypeX = 5;
			texte.positionTypeY = 6;
			texte.positionArray[0] = icone;
			texte.numRow = 1;
			texte.texteWidthType = 1;
			
	
	
			//----------Apparence-------
			
			this.border.borderStyle = "solid";
			this.border.borderWidth = 1;
			
			
			this.titre.icone.label = "";
			this.titre.icone.fontFamily = "FontAwesome";
			this.titre.positionIcone = 1;
			//Ki.iconeTexteChange(this.titre);

			
			//-----------Rendu----------
			
			Ki.serviceChange(this);

		
			
		}
		
		public function service1b(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			
			serviceDefault(grid,column,debutCol,height,y, x,width);
			this.icone.visible = true;
			Position.permute(titre,icone);
			
			titre.positionTypeX = 4;
			titre.positionTypeY = 6;
			titre.positionArray[0] = icone;
			
			texte.positionTypeX = 5;
			texte.positionTypeY = 6;
			texte.positionArray[0] = titre;
			texte.numRow = 1;
			texte.texteWidthType = 1;
			
			Ki.serviceChange(this);
	
			
		}
		
		public function service2(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			serviceDefault(grid,column,debutCol,height,y, x,width);
			
			//-----------Visible--------
			
			this.icone.visible = true;
			this.image.visible = true;
			this.header.visible = true;
			this.mainModule.visible = true;
			
			
			//-----------Taille----------
			
		
			mainModule.heightType = 0;
			mainModule.fixedHeight = this.htmlHeight - header.htmlHeight - this.paddingBottom;
			//-----------Position--------
			
			header.heightType = 0;
			header.fixedHeight = icone.htmlHeight + 10 ;
			
			mainModule.positionTypeY = 6 ;
			mainModule.positionArray[0] = header;
			
			icone.positionTypeX = 4 ;
			icone.positionTypeY = 4 ;
			this.icone.positionArray[1] = this.header;
			
			
			titre.positionArray[1] = mainModule;
			titre.positionTypeX = 4 ;
			titre.positionTypeY = 3 ;
			
			
			texte.positionTypeX = 5 ;
			texte.positionTypeY = 6 ;
			texte.positionArray[1] = mainModule;
			texte.positionArray[0] = titre;
			texte.row = 14;
			texte.numRow = 1;
			texte.texteWidthType = 1;
		
			
			//----------Apparence-------
				
			this.mainModule.border.borderStyle = "solid";
			this.mainModule.border.borderWidth = 1;
			this.header.opacity = 0;
			this.opacity = 0;
		
			
			this.icone.border.borderStyle = "solid";
			this.icone.border.borderWidth = 1;
			this.icone.border.borderRadius = 50;
			
			//-----------Rendu----------
			
			Ki.serviceChange(this);
			

			
		}
		
		
		public function service3(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			serviceDefault(grid,column,debutCol,height,y, x,width);
			//-----------Visible--------
			this.texte.visible = false;
			
			//-----------Taille----------
			
			
			//-----------Position--------
			titre.positionTypeX = 4 ;
			titre.positionTypeY = 4 ;
			
			
			//----------Apparence-------
			this.border.borderStyle = "solid";
			this.border.borderWidth = 1;
		
			
			Ki.serviceChange(this);
			

		}
		
	
		
		public function service4(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			serviceDefault(grid,column,debutCol,height,y, x,width);
			//-----------Visible--------
			bouton.visible = true;
			//texte.visible = false;
			//-----------Taille----------
			 
			
			texte.row = 3;
			texte.numRow = 2;
			texte.positionArray[4] = bouton;
			//-----------Position--------
			
			titre.positionTypeX = 0 ;
			titre.positionArray[2] = new Rectangle(1,3,1,1);
			
			texte.positionTypeX = 0 ;
			texte.positionArray[2] = new Rectangle(1,3,1,2);
			
			bouton.positionTypeX = 0 ;
			bouton.positionArray[2] = new Rectangle(1,3,1,3);
			//----------Apparence-------
			this.border.borderStyle = "solid";
			this.border.borderWidth = 1;
			
			//-----------Rendu----------
			
			Ki.serviceChange(this);
			

		}
		
		public function service4b(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			serviceDefault(grid,column,debutCol,height,y, x,width);
		//-----------Visible--------	
			this.mainModule.visible = true;
			
			//-----------Taille----------
			
			//-----------Position--------
			//----------Apparence-------
			this.mainModule.background.backgroundColor = 0xFFFFFF;
			this.mainModule.opacity = 70 ;
			this.background.backgroundImage = "http://localhost/shenron/2.jpg";
			
			//-----------Rendu----------
		
			Ki.serviceChange(this);
			

		}
		
		public function service5(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			serviceDefault(grid,column,debutCol,height,y, x,width);
			//-----------Visible--------
			
			this.header.visible = true;
			this.footer.visible = true;
			this.icone.visible = true;
			
			//-----------Taille----------
			header.positionArray[1] = this;
			footer.positionArray[1] = this;
			
			titre.positionArray[1] = header;
			texte.positionArray[1] = header;
			
			this.header.scale.x = 4/10 - (icone.htmlWidth/grid.colWidth(column));
			this.footer.scale.x = 6/10;
	
			
			this.texte.row = 4;
			//-----------Position--------
		
			
			icone.positionTypeX = 2;
			
			header.positionArray[0] = icone ;
			header.positionTypeX = 6 ;
			
			footer.positionArray[0] = header ;
			footer.positionTypeX = 6 ;
			
			texte.positionTypeX = 4 ;
			texte.positionTypeY = 4 ;
			
			
			//----------Apparence-------
			
			this.opacity = 0;
			this.footer.background.backgroundImage = "http://localhost/lar/2.jpg";
			
			//-----------Rendu----------
		
			Ki.serviceChange(this);
			

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
		public function get bouton(): Bouton {
			return _bouton;
		}
		
		public function set bouton(bouton: Bouton) {

			_bouton = bouton;
		}
		
		//--------------------	
		public function get image(): ImageBalise {
			return _image;
		}
		
		public function set image(image: ImageBalise) {

			_image = image
		}
		
		

		
		

	}
	
}
