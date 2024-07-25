package  com.nao.Blocks{
	
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Modules.CallToAction;
	import com.nao.Power.Ki;
	import com.nao.Modules.Service;
	import com.nao.Pages.Grid;
	import com.nao.Images.IconeBalise;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Components.Bouton;
	import com.nao.Basic.Copy;
	import flash.geom.Point;
	import com.nao.General.L;
	
	public class Cover extends Service {

		
		
		
		
		public function Cover(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 400,y:Number = 0,x:Number = 0,width:Number = 200 ){
			// constructor code
			//(grid:Grid, titre:String = "Services", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
			super(grid,titre,column ,debutCol,height,y,x,width );
			this.background.backgroundColor = 0x444444;
			this.column = column;
			this.debutCol = debutCol;

		
			coverDefault(grid,column,debutCol,height,y, x,width);
			
			
		}
		
		
		
		public function coverDefault(grille:Grid,column:uint = 0,debutCol:int=-1,height:Number = 400,y:Number = 0, x:Number = 0,width:Number = 200){
			
			 var _defaultModule:Div = new Div(0,0,500,this.htmlHeight);
			 var _defaultMainModule:Div = new Div(0,0,500,this.htmlHeight);
			 var _defaultHeader:Div = new Div(0,0,30,this.htmlHeight);
			 var _defaultFooter:Div = new Div(0,0,30,this.htmlHeight);
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton(L.seeMore) ;
			
			
			Copy.baliseCopy(_defaultModule,this,true,false,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			Copy.iconeBaliseCopy(_defaultIcone,icone,true,true,true);
			Copy.iconeTexteCopy(_defaulTitre,titre,true,true,true,true);
			Copy.paragraphCopy(_defaulTexte,texte,true,true,true,true);
			Copy.boutonCopy(_defaultBouton,bouton,true,true,true);
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grille,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			titre.visible = true;
			texte.visible = true;
			mainModule.visible = false;
			header.visible = false;
			footer.visible = false;
			bouton.visible = false;
			icone.visible = false;
		
			
			//--------------------Positionnement par default -----------------------------------
			
			titre.texte.fontSize = 24;
			titre.htmlWidth = 200;
			titre.positionTypeX = 4;
			titre.positionTypeY = 4;
			
			texte.positionTypeX = 4 ;
			texte.positionTypeY = 6;
			texte.texteWidthType = 4;
			texte.texteWidth = 500;
			texte.row = 1;
			texte.numRow = 3;
			
			bouton.positionArray[0] = texte;
			bouton.positionTypeX = 4 ;
			bouton.positionTypeY = 6;
			
			bouton.background.backgroundImage = "color";
		
			
		
	
			this.background.backgroundImage = "http://localhost/shenron/image.jpg";
			Ki.coverChange(this);
			

			
		}
		
		public function cover2(grid:Grid,column:uint = 0,debutCol:int=-1,height:Number = 400,y:Number = 0, x:Number = 0,width:Number = 200){
			coverDefault(grid,column,debutCol,height,y, x,width);
		 this.bouton.visible = true;
			Ki.coverChange(this);
		}
	

	}
	
}
