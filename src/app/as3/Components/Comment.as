package com.nao.Components {
	import com.nao.Textes.IconeTexte;
	import com.nao.Power.Ki;
	
	public class Comment extends IconeTexte {

		public function Comment(label:String = "24", icone:String = "", positionIcone:uint = 1, x:Number = 0, y:Number = 0, width:Number = 200, height:Number = 20, iconSize:uint = 20 ) {
			// constructor code
		super(label, icone, positionIcone, x, y, width, height, iconSize);
		
		this.fontSize = 14;
		this.icone.marginRight = 5;
		Ki.iconeTexteChange(this);
		}

	}
	
}
