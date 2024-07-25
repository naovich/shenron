package  com.nao.Forms{
	import com.nao.Containers.Balise;
	import com.nao.Textes.IconeTexte;
	import com.nao.Forms.InputText;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	
	
	public class TexteInput extends Balise {

		private var _iconeTexte:IconeTexte = new IconeTexte();
		private var _inputText:InputText = new InputText();
		private var _position:uint = 0;
		public var texteLabel:String;
		public var inputValue:String;
	
		
		public function TexteInput(label:String = "Name",x:Number=0, y:Number=0, width:Number = 250, height:Number = 30, icone:String = "", position:uint = 0) {
			// constructor code
			super(x,y,width,height);
			_position = position;
			iconeTexte.texte.label = label;
			iconeTexte.icone.label = icone;
			//iconeTexte.texte.resize();
			//this.padding = 5;
			this.padding = 0;
			
			var it:InputText = new InputText(x,y,width,height);
			inputText = it;
		
			texteLabel = label;
			inputValue = inputText.value;
			this.addBalise(inputText);
			this.addBalise(iconeTexte);
			
			//inputText.visible = false;
			
			//inputText.codeHTML = <input width={width} height={height} type='text' placeholder={label} />
			//Ki.baliseChange(inputText);
			this.background.backgroundImage ="transparent";
		
	
			iconeTexte.texte.marginRight = 5;
			//Position.afterX(inputText,iconeTexte.texte);
			
			Ki.texteInputChange(this);
			//Ki.baliseChange(this);

		}
		
		//--------------------	
		public function get iconeTexte(): IconeTexte {
			return _iconeTexte;
		}
		
		public function set iconeTexte(iconeTexte: IconeTexte) {
			_iconeTexte = iconeTexte;
			
		}
		
		//--------------------	
		public function get inputText(): InputText {
			return _inputText;
		}
		
		public function set inputText(inputText: InputText) {
			_inputText = inputText;
			
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
		//	Ki.texteInputChange(this);
			Ki.iconeTexteChange(iconeTexte);
			Ki.baliseChange(inputText);
			this.resizeBalise();
			
		}
		
		//--------------------	
		public function get value(): String {
			return this.inputText.value;
		}
		
		public function set value(value: String) {
			this.inputText.value = value;
			//Ki.texteInputChange(this);
			
		}
		

	}
	
}
