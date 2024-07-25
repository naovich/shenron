package  com.nao.Modules {
	import com.nao.Images.Image;
	import com.nao.Textes.IconeTexte;
	import com.nao.Textes.Paragraph;
	import com.nao.Containers.Balise;
	import com.nao.Modules.Service;
	import com.nao.Images.IconeBalise;
	import com.nao.Components.Bouton;
	import com.nao.Components.Price;
	import com.nao.Components.AddToCart;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	import flash.geom.Rectangle;
	import com.nao.Pages.Grid;
	import com.nao.General.L;
	import flash.geom.Point;
	
	public class Buy extends Service {
		
		
		var _price:Price = new Price() ;
		var _addToCart:AddToCart = new AddToCart() ;
		
		
		public function Buy(grid:Grid, titre:String = "Title", x:Number = 0, y:Number = 0, column:uint = 2, height:Number = 200 ) {

		// constructor code
			super(grid, titre, column,debutCol,height,y,x,width );
			
			this.titre.label = titre ;
			this.column = column;
			
			this.addBalise(_price);
			this.addBalise(_addToCart);
			
			buyDefault(grid,column,debutCol,height,y, x,width);
			
	

			
		}
		
		public function buyDefault(grid:Grid,column:uint,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			
			 var _defaultModule:Balise = new Balise(0,0,176,this.htmlHeight);
			 var _defaultMainModule:Balise = new Balise(0,0,176,200);
			 var _defaultHeader:Balise = new Balise(0,0,176,40);
			 var _defaultFooter:Balise = new Balise(0,0,176,40);
			 var _defaultImage:Image = new Image();
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaulTitre:IconeTexte = new IconeTexte(this.titre.label,"",0,0,0,110);
			 var _defaulTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton("View more") ;
			 var _defaultPrice:Price = new Price() ;
			 var _defaultAddToCart:AddToCart = new AddToCart() ;
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.y = y;
			xw = modify(grid,column,debutCol, x,width);
			this.x = xw.x;
			this.htmlWidth = xw.y;
			
			//-----------------Visible---------------------
			
			this.titre.visible = true;
			this.price.visible = true;
			this.addToCart.visible = true;
			this.image.visible = true;
				
			this.mainModule.visible = false;
			this.texte.visible = false;
			this.header.visible = false;
			this.footer.visible = false;
			this.bouton.visible = false;
			this.icone.visible = false;
			
			_defaultModule.padding = this.padding ;
			 Ki.equalizeMain(this,_defaultModule);
			 Ki.equalize(this.mainModule,_defaultMainModule);
			 Ki.equalize(this.header,_defaultHeader);
			 Ki.equalize(this.footer,_defaultFooter);
			 Ki.equalize(this.image,_defaultImage);
			 Ki.equalize(this.icone,_defaultIcone);
			 Ki.equalize(this.titre,_defaulTitre);
			 Ki.equalize(this.texte,_defaulTexte);
			 Ki.equalize(this.bouton,_defaultBouton);
			 Ki.equalize(this.price,_defaultPrice);
			 Ki.equalize(this.addToCart,_defaultAddToCart);
			
			
			
			this.mainModule == _defaultMainModule
			this.header == _defaultHeader ;
			this.footer == _defaultFooter;
			//this.image == _defaultImage;
			this.icone == _defaultIcone;
			this.titre == _defaulTitre;
			this.texte == _defaulTexte;
			this.bouton == _defaultBouton ;
			this.price == _defaultPrice ;
			this.addToCart == _defaultAddToCart ;
			
			
			/*this.mainModule.padding = 5;
			this.header.padding = 5;
			this.footer.padding = 5;
			this.padding = 5;*/
			
		
			image.positionTypeX = 4;
			image.positionTypeY = 6;
			image.positionArray[0] = titre;
			image.marginTop = 20;
			image.widthType = 2;
			image.scale.y = 1/2;
			
			price.positionTypeX = 4;
			price.positionTypeY = 6;
			price.positionArray[0] = image;
			price.marginTop = 5;
			
			addToCart.positionTypeX = 4;
			addToCart.positionTypeY = 5;
	
			this.border.borderStyle = "solid";
			this.border.borderWidth = 1;
	
			image.background.backgroundImage = "http://localhost/shenron/image.jpg";
			
			Ki.buyChange(this);
			

			
		}
		
		public function get price(): Price {
			return _price;
		}
		
		public function set price(price: Price) {

			_price = price;
		}
		////---------------------	
		public function get addToCart(): AddToCart {
			return _addToCart;
		}

		public function set addToCart(addToCart: AddToCart) {

			_addToCart = addToCart;
		}
		

		
		

	}
	
}
