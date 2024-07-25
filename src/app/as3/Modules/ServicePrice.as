package  com.nao.Modules {
	
	
	import com.nao.Modules.Service;
	import com.nao.Listes.Liste;
	import com.nao.Components.Stars;
	import com.nao.Textes.Texte;
	import com.nao.Components.Heart;

	public class ServicePrice extends Service {
		
		private var _price:Texte = new Texte("$50");
		private var _devise:String;
		private var _stars:Stars = new Stars();
		private var _heart:Heart = new Heart()
	
		
		

		public function ServicePrice(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
		
			super(grid,column ,debutCol,height,y,x,width );
			
			this.addChild(price);
			this.addChild(stars);
			this.addChild(heart);
			stars.visible = false;
			heart.visible = false;
			
		}
		
		
		//---------------
		public function get devise(): String {
			return _devise;
		}

		public function set devise(devise: String) {
			_devise = devise;
		}
		
		//---------------
		public function get price(): Texte {
			return _price;
		}

		public function set price(price: Texte) {
			_price = price;
		}
		
		//---------------
		public function get stars(): Stars {
			return _stars;
		}

		public function set stars(stars: Stars) {
			_stars = stars;
		}
		
		//---------------
		public function get heart(): Heart {
			return _heart;
		}

		public function set heart(stars: Heart) {
			_heart = heart;
		}
		

	}
	
}
