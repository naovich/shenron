package  com.nao.Blocks{
	
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Modules.CallToAction;
	import com.nao.Power.Ki;
	import com.nao.Blocks.ServiceBlock;
	import com.nao.Pages.Grid;
	import com.nao.Images.IconeBalise;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Components.Bouton;
	import com.nao.Components.ArrowSlide;
	import com.nao.Listes.SuperListe;
	import com.nao.Basic.Copy;
	import flash.geom.Point;

	
	public class Slide extends ServiceBlock {

		
		
		
		public function Slide(grid:Grid,titre:String = "null",column:uint = 0 ,debutCol:int = -1,height:Number = 400,y:Number = 0,x:Number = 0,width:Number = 200){
			// constructor code
			
			super(grid, titre,column ,debutCol,height,y,x,width );
			this.background.backgroundColor = 0x444444;
			//super.background.backgroundSizeCover = "cover";
			this.column = column;
			this.debutCol = debutCol;
			
			slideDefault(grid,column,debutCol,height,y, x,width);
			
			Ki.slideChange(this);
		}
		
		
		
		public function slideDefault(grille:Grid,column:uint = 0,debutCol:int=-1,height:Number = 400,y:Number = 0, x:Number = 0,width:Number = 200){
			
			 var _defaultModule:Balise = new Div(0,0,500,this.htmlHeight);
			 var _defaultMainModule:Balise = new Div(0,0,500,this.htmlHeight);
			 var _defaultHeader:Balise = new Div(0,0,30,this.htmlHeight);
			 var _defaultFooter:Balise = new Div(0,0,30,this.htmlHeight);
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton("See More") ;
			 var _defaultArrowSlide:ArrowSlide = new ArrowSlide() ;
			 var _defaultSuperListe:SuperListe = new SuperListe() ;
		
			Copy.baliseCopy(_defaultModule,this,true,false,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			
			Copy.iconeBaliseCopy(_defaultIcone,icone,true,true,true);
			Copy.iconeTexteCopy(_defaulTitre,titre,true,true,true,true);
			Copy.paragraphCopy(_defaulTexte,texte,true,true,true,true);
			Copy.boutonCopy(_defaultBouton,bouton,true,true,true);
			
			Copy.baliseCopy(_defaultArrowSlide,arrowSlide,true,true,true,true);
			Copy.baliseCopy(_defaultSuperListe,superListe,true,true,true,true);
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grille,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			//-----------------Visible---------------------
			arrowSlide.visible = true;
			superListe.visible = true;
			titre.visible = false;
			texte.visible = false;
			mainModule.visible = false;
			header.visible = false;
			footer.visible = false;
			bouton.visible = false;
			icone.visible = false;
			
			titre.texte.fontSize = 24;
			titre.htmlWidth = 200;
			
			titre.positionTypeX = 4;
			titre.positionTypeY = 4;
			
			texte.positionTypeX = 4 ;
			texte.positionTypeY = 6;
			texte.texteWidthType = 3;
			texte.row = 3;
			texte.numRow = 3;
			
			
				
			superListe.listeImg();
			superListe.superListeTab[1].background.backgroundImage = "http://localhost/shenron/1.jpg";
			Ki.baliseChange(superListe.superListeTab[1]);
			
			superListe.positionTypeX = 4;
			superListe.positionTypeY = 5;
				
			superListe.widthType = 0;
			superListe.fixedWidth = superListe.htmlWidth;
			superListe.heightType = 0;
			superListe.fixedHeight = superListe.htmlHeight;
			
			arrowSlide.positionTypeX = 4;
			arrowSlide.positionTypeY = 4;
				
			arrowSlide.widthType = 0;
			arrowSlide.fixedWidth = arrowSlide.htmlWidth;
			arrowSlide.heightType = 0;
			arrowSlide.fixedHeight = arrowSlide.htmlHeight;
			
		//	arrowSlide.resizeBalise();
	
			this.background.backgroundImage = "http://localhost/shenron/image.jpg";
			Ki.slideChange(this);
			

			
		}
		
		public function slide2(grid:Grid,column:uint = 10,debutCol:int=2,height:Number = 150,y:Number = 0, x:Number = 0,width:Number = 200){
		slideDefault(grid,column,debutCol,height,y, x,width);
			Ki.slideChange(this);
		}
	

	}
	
}
