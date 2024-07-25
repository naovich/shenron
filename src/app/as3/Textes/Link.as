package  com.nao.Textes {
	
	import com.nao.Textes.IconeTexte;
	
	public class Link extends IconeTexte {

		
		public function Link (label:String,icone:String = "", positionIcone:uint = 0, x:Number =0, y:Number = 0, width:Number= 100, height:Number= 20, , iconSize:uint = 20 ) {
			// constructor code
		
			super(label, icone, positionIcone, x, y, width, height, iconSize) {
			// constructor code
		
			super.codeHTML = <a href='#'>{label}</a>;
			
			
		}
		
	}
	
}
