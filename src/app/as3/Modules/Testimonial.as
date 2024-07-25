package  com.nao.Modules {
	import com.nao.Containers.Balise;
	import com.nao.Modules.BlankModule;
	import com.nao.Textes.Texte;
	import com.nao.Images.Image;
	import com.nao.Power.Ki;
	
	public class Testimonial extends BlankModule{

		private var _texte:Texte = new Texte("text",50,10,300,80);
		private var _photo:Image = new Image();
		private var _name:Texte = new Texte("Firstname Lastname",50,90,150,20);
		private var _fonction:Texte =new Texte("Fonction",50,100,150,20);
		
		public function Testimonial(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 400 ) {
			// constructor code
			super(grid,column ,debutCol,height,y,x,width );
	
			addBalise(_texte);
			addBalise(_photo);
			addBalise(_name);
			addBalise(_fonction);

			
		}
		
		
		//---------------------	
		public function get texte(): Texte {
			return _texte;
		}

		public function set texte(texte: Texte) {

			_texte = texte;
		}
		
		//---------------------	
		public function get photo(): Image {
			return _photo;
		}

		public function set photo(photo: Image) {

			_photo = photo;
		}
		//---------------------	
		public function get name(): Texte {
			return _name;
		}

		public function set name(name: Texte) {

			_name = name;
		}


	}
	
}
