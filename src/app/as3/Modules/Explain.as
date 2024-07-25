package  com.nao.Modules {
	import com.nao.Containers.Balise;
	import com.nao.Modules.BalankModule;
	import com.nao.Textes.IconeTexte;
	import com.nao.Images.Image;
	import com.nao.Power.Ki;
	import com.nao.Images.Icone;
	import com.nao.Pages.Grid;
	
	public class Explain extends BalankModule {

		private var _titre:IconeTexte = new IconeTexte("Titre",10,10,200,20);
		private var _photo:Image = new Image();
		private var _texte:Texte = new Texte("Lorem ipsum",10,20,500,70);
		private var _icone:Icone = new Icone("");
		
		public function Explain(grid:Grid,  column:int = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
		 {
			// constructor code
			
			super(grid,column ,debutCol,height,y,x,width );
			this.addBalise(_titre);
			this.addBalise(_photo);
			this.addBalise(_texte);
			this.addBalise(_icone);

			
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
		public function get titre(): IconeTexte {
			return _titre;
		}

		public function set titre(titre: IconeTexte) {

			_titre = titre;
		}
		//---------------------	
		public function get icone(): Icone {
			return _icone;
		}

		public function set icone(icone: Icone) {

			_icone = icone;
		}


	}
	
}
