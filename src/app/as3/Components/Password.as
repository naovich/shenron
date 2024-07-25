package  com.nao.Components {
	
	import flash.html.HTMLLoader;
	import com.nao.Textes.Texte;
	
	public class Password extends Texte {

	private var _disabled:Boolean = false;
	


		
		public function Password(x:Number = 0, y:Number = 0, width:Number = 50, height:Number = 20,) {
			// constructor code
		
			super(x,y,width,height,label);
			_codeHTML = <input type='password' value='xxxxxxxxx' />;
			this.background.backgroundImage = "default";
			
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
