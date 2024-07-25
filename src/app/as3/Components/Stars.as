package com.nao.Components {
	import com.nao.Textes.Texte;
	import com.nao.Power.Ki;
	
	public class Stars extends Texte{

		
		public function Stars(label:String = "",x:Number = 0, y:Number = 0, width:Number = 100, height:Number = 20) {
			// constructor code
			super(label,x, y, width, height);
			super.fontFamily = "fontAwesome";
			super.fontSize = 14;
			super.color = 0xF6DB0C;
			Ki.texteChange(this);
			
		}

	}
	
}
