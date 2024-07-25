package com.nao.Components {
	
	import com.nao.Forms.TexteInput;
	import com.nao.Power.Ki;
	
	
	public class Newsletter extends TexteInput {
		



		public function Newsletter(label:String = "",x:Number=0, y:Number=0, width:Number = 250, height:Number = 30, icone:String = "", position:uint = 1) {
			
			
		super(label,x, y, width, height, icone, position);
		iconeTexte.positionIcone = 1;	
		iconeTexte.texte.marginRight = 0;
		//iconeTexte.x = 300;
		/*iconeTexte.background.backgroundImage = "color";
		iconeTexte.htmlHeight = 100;*/
		Ki.texteInputChange(this);
	
			
			
		}
		
		


	}
	
}
