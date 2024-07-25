package com.nao.Components {
	import com.nao.Textes.Texte;
	import com.nao.Power.Ki;
	
	public class ShareIcon extends Texte{

		
		public function ShareIcon(label:String = "",x:Number = 0, y:Number = 0, width:Number = 100, height:Number = 20) {
			// constructor code
			super(label,x, y, width, height);
			super.fontFamily = "fontAwesome";
			super.fontSize = 25;
			super.color = 0x111111;
			super.letterSpacing = 20;
			Ki.texteChange(this);
			
			
		}

	}
	
}
