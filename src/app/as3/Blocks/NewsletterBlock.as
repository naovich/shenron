package  com.nao.Blocks{
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Modules.Service;
	import com.nao.Textes.Paragraph;
	import com.nao.Components.Bouton;
	import com.nao.Power.Ki;
	import com.nao.Components.Newsletter;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Texte;
	import com.nao.Pages.Grid;
	import com.nao.General.L;
	import flash.geom.Point;
	import com.nao.Basic.Copy;
	
	public class NewsletterBlock extends Service {

	
		private var _newsletter:Newsletter = new Newsletter();
		
	
		public function NewsletterBlock(grid:Grid,column:uint = 0,  titre:String = "Newsletter",debutCol:int = -1,height:Number = 150,y:Number = 0,x:Number = 0,width:Number = 200) {
			// constructor code
			
			 super(grid, titre, column,debutCol,height,y,x,width);
		

				 
				 
			this.titre.label = titre ;
			this.column = column;
			newsletterDefault(grid,column,debutCol,height,y, x,width);
			this.debutCol = debutCol;
			Ki.baliseChange(this);
			
		}
		
		
		public function newsletterDefault(grille:Grid,column:uint,debutCol:int=-1,height:Number = 100,y:Number = 0, x:Number = 0,width:Number = 200){
			
			 var _defaultModule:Div = new Div(0,0,176,200);
			 var _defaultMainModule:Div = new Div(0,0,176,200);
			 var _defaultHeader:Div = new Div(0,0,176,40);
			 var _defaultFooter:Div = new Div(0,0,176,40);
			 var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton(L.viewMore) ;
			
			
			Copy.baliseCopy(_defaultModule,this,true,false,true,true);
			Copy.baliseCopy(_defaultMainModule,mainModule,true,true,true,true);
			Copy.baliseCopy(_defaultHeader,header,true,true,true,true);
			Copy.baliseCopy(_defaultFooter,footer,true,true,true,true);
			Copy.iconeTexteCopy(_defaulTitre,titre,true,true,true,true);
			Copy.paragraphCopy(_defaulTexte,texte,true,true,true,true);
			Copy.boutonCopy(_defaultBouton,bouton,true,true,true);
			
			
			//-------------------Nouvelle position et taille-------------------
		/*	var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grille,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;*/
			
			//-----------------Visible---------------------
			titre.visible = true;
			newsletter.visible = true;
			
			mainModule.visible = false;
			header.visible = false;
			footer.visible = false;
			bouton.visible = false;
			texte.visible = false;
			icone.visible = false;
			
			//-----------------Valeur par défaut---------------------
			this.titre.texte.fontFamily = "Patua One";
			this.texte.textAlign = "center";
			this.texte.textAlign ="justify";
			
			titre.positionTypeX = 4;
			titre.positionTypeY = 3;
			
			newsletter.positionTypeX = 4;
			newsletter.positionTypeY = 4;
			
	
			
			Ki.newsletterChange(this);
			

			
		}
	
		public function newsletter2(grid:Grid,column:uint = 8,debutCol:int=3,height:Number = 100,y:Number = 0, x:Number = 0,width:Number = 200){
			
		
	
			newsletterDefault(grid,column,debutCol,height,y, x,width);
			Ki.newsletterChange(this);
			

			
		}
		
		
		//---------------------	
		public function get newsletter(): Newsletter {
			return _newsletter;
		}

		public function set newsletter(newsletter: Newsletter) {
			_newsletter = newsletter;
		}

	}
	
}
