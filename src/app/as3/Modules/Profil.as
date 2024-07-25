package  com.nao.Modules {
	import com.nao.Images.Image;
	import com.nao.Images.ImageBalise;

	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Containers.Balise;
	import com.nao.Modules.Service;
	import com.nao.Images.IconeBalise;
	import com.nao.Components.Bouton;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	import flash.geom.Rectangle;
	import com.nao.Pages.Grid;
	import com.nao.Components.SocialIcon;
	import com.nao.Containers.Figure;
	import com.nao.General.L;
	import flash.geom.Point;
	
	public class Profil extends Service {
		
	var _sousTitre:Paragraph = new Paragraph(0,50,130,4);
	var _socialIcon:SocialIcon = new SocialIcon();
		
		public function Profil(grid:Grid, titre:String = "Firstname Lastname", x:Number = 0, y:Number = 0, column:uint = 2,debutCol:int = -1, height:Number = 200 ) {
		super(grid, titre, column,debutCol,height,y,x,width );
			
	
			this.titre.label = titre ;
			this.column = column;
			this.padding = 10 ;
			profilDefault(grid,column,debutCol,height,y, x,width);
			
	
			
		}
		
		private function profilDefault(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			
			 var _defaultModule:Balise = new Balise(0,0,176,this.htmlHeight);
			 var _defaultMainModule:Balise = new Balise(0,0,176,200);
			 var _defaultHeader:Balise = new Balise(0,0,176,40);
			 var _defaultFooter:Balise = new Balise(0,0,176,40);
			 var _defaultImage:ImageBalise = new ImageBalise(0,0,300,500);
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaultTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaultSousTitre:Paragraph = new Paragraph(0,50,130,4);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton("View more") ;
			 var _defaultSocialIcon:SocialIcon = new SocialIcon();
			
			
			
			this.titre.visible = true;
			this.image.visible = true;
			
			this.texte.visible = false;
			this.sousTitre.visible = false;
			this.mainModule.visible = true;
			this.header.visible = false;
			this.footer.visible = false;
			this.bouton.visible = false;
			this.icone.visible = false;
			this.socialIcon.visible = false;
			
			_defaultModule.padding = this.padding ;
			 Ki.equalizeMain(this,_defaultModule);
			 Ki.equalize(this.mainModule,_defaultMainModule);
			 Ki.equalize(this.header,_defaultHeader);
			 Ki.equalize(this.footer,_defaultFooter);
			 Ki.equalize(this.image,_defaultImage);
			 Ki.equalize(this.icone,_defaultIcone);
			 Ki.equalize(this.titre,_defaultTitre);
			  Ki.equalize(this.sousTitre,_defaultSousTitre);
			 Ki.equalize(this.texte,_defaulTexte);
			 Ki.equalize(this.bouton,_defaultBouton);
			Ki.equalize(socialIcon,_defaultSocialIcon);
			
			
			
			this.mainModule == _defaultMainModule
			this.header == _defaultHeader ;
			this.footer == _defaultFooter;
			this.image == _defaultImage;
			this.icone == _defaultIcone;
			this.titre == _defaultTitre;
			this.sousTitre == _defaultSousTitre;
			this.texte == _defaulTexte;
			this.bouton == _defaultBouton ;
			this.socialIcon == _defaultSocialIcon;
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			//-----------------------------------------------
			
			texte.numRow = 3;
			texte.positionTypeX = 4 ;
			texte.positionTypeY = 6;
			
			texte.row = 1 ;
			texte.texteWidthType = 0;
			texte.positionArray[0] = titre;
			
			titre.fontWeight = true;
	
			image.positionArray[0] = titre;
			image.positionTypeX = 4;
			image.positionTypeY = 6;
			
			image.widthType =  2;
			image.heightType = 0;
			image.margin = 5;
			
			sousTitre.positionArray[0] = image;
			sousTitre.positionTypeX = 4;
			sousTitre.positionTypeY = 6;
			
			mainModule.border.borderStyle = "solid";
			mainModule.border.borderWidth = 1;
			image.url = "http://nadhoir.com/nadhoir.jpg";
	
			//this.titre.margin = 10;
			Ki.profilChange(this);
			

			
		}
		
	
	public function profilRounded(grid:Grid,column:uint):void{
		//profilDefault(nbCol);
		profilDefault(grid,column,this.debutCol,this.htmlHeight,this.y, this.x,this.htmlWidth);
		image.heightType = 0;
		image.fixedHeight = this.htmlWidth - this.paddingRight - this.paddingLeft;
		Figure.rounded(image,5);
		Figure.rounded(image);
		Ki.profilChange(this);
		
		
	}
	
	
	//--------------------	
		public function get sousTitre(): Paragraph {
			return _sousTitre;
		}
		
		public function set sousTitre(sousTitre: Paragraph) {

			_sousTitre = sousTitre;
		}
		
		public function get socialIcon(): SocialIcon {
			return _socialIcon;
		}

		public function set socialIcon(socialIcon: SocialIcon) {
			_socialIcon = socialIcon;
		}
		

	}
	
}
