package  com.nao.Containers{
	
	import com.nao.Containers.Div;
	import com.nao.Listes.Liste;
	import com.nao.Power.Ki;
	
	public class Tab extends Div {

		private var _liste:Liste = new Liste(0,0,100,30);
		private var _balise:Balise = new Balise(0,50,500,300);
		
		public function Tab(x:Number = 0, y:Number = 0, width:Number = 500, height:Number = 300) {
			// constructor code
		_liste.padding = 2;
		_liste.marginLeft = 0;
		_liste.marginRight = 0;
		_liste.marginTop = 0;
		_liste.marginBottom = 0;
		super(x,y,width,height);
		
		this.addBalise(_liste);
		this.addBalise(_balise);
		//this._liste.cVertical();
		Ki.baliseChange(this._liste);
		Ki.baliseChange(this);
		}
		
		
		//-----------------------------

		public function get liste(): Liste {
			return _liste ;
		}

		public function set liste(liste: Liste) {

			_liste = liste;
		}
		
		//-----------------------------

		public function get balise(): Balise {
			return _balise ;
		}

		public function set balise(balise: Balise) {
			_balise = balise;
		}

	}
	
}
