package  com.nao.Forms{
	import com.nao.Containers.Balise;
	import com.nao.Textes.IconeTexte;
	import com.nao.Forms.SelectInput;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	
	
	public class SelectInput extends Balise {

		private var _iconeTexte:IconeTexte = new IconeTexte();
		private var _combobox:Combobox = new Combobox();
		private var _position:uint;
		
		public function SelectInput(label:String = "Name",x:Number=0, y:Number=0, width:Number = 250, height:Number = 30, icone:String = "", position:uint = 0) {
			// constructor code
			super(x,y,width,height);
			_position = position;
			iconeTexte.texte.label = label;
			iconeTexte.icone.label = icone;
			iconeTexte.texte.resize();
			this.padding = 0;
				
			this.addBalise(iconeTexte);
			this.addBalise(combobox);
			
			
			this.background.backgroundImage ="transparent";
		
		
			iconeTexte.texte.marginRight = 5;
			Position.afterX(combobox,iconeTexte.texte);
			
			
			Ki.selectInputChange(this);
			
		}
		
		//--------------------	
		public function get iconeTexte(): IconeTexte {
			return _iconeTexte;
		}
		
		public function set iconeTexte(iconeTexte: IconeTexte) {
			_iconeTexte = iconeTexte;
			
		}
		
		//--------------------	
		public function get combobox(): Combobox {
			return _combobox;
		}
		
		public function set combobox(combobox: Combobox) {
			_combobox = combobox;
			
		}
		
		//--------------------	
		public function get position(): uint {
			return _position;
		}
		
		public function set position(position: uint) {
			_position = position;
			
		}
		
			//--------------------	
		public function get label(): String {
			return this.iconeTexte.texte.label;
			
		}
		
		public function set label(label: String) {
			this.iconeTexte.label = label;
			this.combobox.value = label;
		//	Ki.texteInputChange(this);
			Ki.iconeTexteChange(iconeTexte);
			Ki.baliseChange(combobox);
			this.resizeBalise();
			
		}
		

	}
	
}
