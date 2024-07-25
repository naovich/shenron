package  com.nao.Modules {
	import com.nao.Images.Image;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Containers.Balise;
	import com.nao.Modules.Service;
	import com.nao.Images.IconeBalise;
	import com.nao.Components.Bouton;
	import com.nao.Components.Author;
	import com.nao.Components.DatePost;
	import com.nao.Components.Comment;
	import com.nao.Components.Heart;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	import flash.geom.Rectangle;
	import com.nao.Pages.Grid;
	import com.nao.General.L;
	import flash.geom.Point;
	
	public class Post extends Service {
		
		
		var _author:Author = new Author() ;
		var _datePost:DatePost = new DatePost() ;
		var _comment:Comment = new Comment() ;
		var _heart:Heart = new Heart() ;
		

		public function Post(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
		
		// constructor code
			super(grid, titre, column,debutCol,height,y,x,width );
			this.addBalise(_author);
			this.addBalise(_datePost);
			this.addBalise(_comment);
		
		
			this.titre.label = titre ;
			this.column = column;
			this.padding = 10 ;
			postDefault(grid,column,debutCol,height,y, x,width);
			
		}
		
		public function postDefault(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			 var _defaultModule:Balise = new Balise(0,0,176,this.htmlHeight);
			 var _defaultMainModule:Balise = new Balise(0,0,176,200);
			 var _defaultHeader:Balise = new Balise(0,0,176,40);
			 var _defaultFooter:Balise = new Balise(0,0,176,40);
			 var _defaultImage:Image = new Image();
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton("View more") ;
			var _defaultAuthor:Author = new Author() ;
			var _defaultDatePost:DatePost = new DatePost() ;
			var _defaultComment:Comment = new Comment() ;
			var _defaultHeart:Heart = new Heart() ;
			
			
			this.titre.visible = true;
			this.texte.visible = true;
			this.datePost.visible = true;
			
			this.mainModule.visible = false;
			this.header.visible = false;
			this.footer.visible = false;
			this.image.visible = false;
			this.bouton.visible = false;
			this.author.visible = false;
			this.comment.visible = false;
			this.heart.visible = false;
			
			_defaultModule.padding = this.padding ;
			 Ki.equalizeMain(this,_defaultModule);
			 Ki.equalize(mainModule,_defaultMainModule);
			 Ki.equalize(header,_defaultHeader);
			 Ki.equalize(footer,_defaultFooter);
			 Ki.equalize(image,_defaultImage);
			 Ki.equalize(icone,_defaultIcone);
			 Ki.equalize(titre,_defaulTitre);
			 Ki.equalize(texte,_defaulTexte);
			 Ki.equalize(bouton,_defaultBouton);
			 Ki.equalize(author,_defaultAuthor);
			 Ki.equalize(datePost,_defaultDatePost);
			 Ki.equalize(comment,_defaultComment);
			 Ki.equalize(heart,_defaultHeart);
			
			
			
			this.mainModule == _defaultMainModule
			this.header == _defaultHeader ;
			this.footer == _defaultFooter;
			//this.image == _defaultImage;
			this.icone == _defaultIcone;
			this.titre == _defaulTitre;
			this.texte == _defaulTexte;
			this.bouton == _defaultBouton ;
			this.author == _defaultAuthor ;
			this.datePost == _defaultDatePost ;
			this.comment == _defaultComment ;
			this.heart == _defaultHeart ;
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			//this.htmlWidth = grid.colWidth(nbCol);
			Ki.postChange(this);
			

			
		}
		
		
		//------------------------------------
		
		public function get datePost(): DatePost {
			return _datePost;
		}

		public function set datePost(datePost: DatePost) {

			_datePost = datePost;
		}
		//---------------------
		public function get author(): Author {
			return _author;
		}

		public function set author(author: Author) {
			_author = author;
		}
		
		//---------------------
		
		public function get heart(): Heart {
			return _heart;
		}

		public function set heart(heart: Heart) {

			_heart = heart;
		}
		
		//---------------------
		
		public function get comment(): Comment {
			return _comment;
		}

		public function set comment(comment: Comment) {

			_comment = comment;
		}
		
		//---------------------

		
		

	}
	
}
