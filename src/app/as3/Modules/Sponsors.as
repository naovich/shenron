package  com.nao.Modules {
	
	import com.nao.Listes.SuperListe;
	
	
	public class Sponsors extends SuperListe {
		
		
	

		public function Sponsors( x: Number = 0, y: Number = 0, liWidth: Number = 150, liHeight: Number = 150, rowLimit:uint = 5) {
			// constructor code
			super(x,y,width,height);
			
		}
		
		//---------------------	
		public function get titre(): Texte {
			return _titre;
		}

		public function set titre(texte: Texte) {

			_titre = titre;
		}
		
		//---------------------	
		public function get texte(): Texte {
			return _texte;
		}

		public function set texte(texte: Texte) {

			_texte = texte;
		}
		
		//---------------------	
		public function get listeService(): SuperListe {
			return _listeService;
		}

		public function set listeService(listeService: SuperListe) {

			_listeService = listeService;
		}

	}
	
}
