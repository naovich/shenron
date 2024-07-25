package com.nao.Components {
	import com.nao.Textes.IconeTexte;
	import com.nao.Power.Ki;
	import com.nao.General.L;
	
	public class AddToCart extends IconeTexte {

		public function AddToCart(label:String = "null", icone:String = "", positionIcone:uint = 1, x:Number = 0, y:Number = 0, width:Number = 200, height:Number = 20, iconSize:uint = 20 ) {
			// constructor code
		super(label, icone, positionIcone, x, y, width, height, iconSize);
		
		if(label != "null"){
		this.label = label;
		}else{
		this.label = L.addToCart;	
		}
		this.fontSize = 14;
		this.icone.marginRight = 5;
		this.border.borderStyle = "solid";
		this.border.borderWidth = 1 ;
		this.padding = 5;
		
	
		Ki.iconeTexteChange(this);
		}

	}
	
}
