package  com.nao.Components {
	
	import flash.html.HTMLLoader;
	import com.nao.Textes.Texte;
	
	public class Radio extends Texte {

	private var _disabled:Boolean = false;
	


		
		public function Radio(x:Number = 0, y:Number = 0, width:Number = 50, height:Number = 20,) {
			// constructor code
		
			super(x,y,width,height,label);
			_codeHTML = <input type='radio' value='Radio'/>;
			this.background.backgroundImage = "default";
			
		}
		
		override public function  set label(label: String) {
			_codeHTML = <input type='radio' value='Radio'/>;
			_label = label;
		}

		
	//---------------------	
		public function get disabled(): Boolean {
			return _disabled;
		}
		
		public function set disabled(disabled: Boolean) {

			_disabled = disabled;
		}
		
	
		
		
	}
	
}
