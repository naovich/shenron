package com.nao.Components {
	import com.nao.Textes.IconeTexte;
	import com.nao.Power.Ki;
	
	public class Price extends IconeTexte {

		private var _currency:String = "$";
		
		public function Price (label:String = "24", icone:String = "$", positionIcone:uint = 1, x:Number = 0, y:Number = 0, width:Number = 200, height:Number = 20, iconSize:uint = 20 ) {

		super(label, icone, positionIcone, x, y, width, height, iconSize);
		this.icone.fontFamily = this.texte.fontFamily ;
		this.fontSize = 14;
		//this.icone.marginRight = 2;
		if(currency == "$"){
			
			this.positionIcone = 1;
			this.icone.marginRight = 2;
			this.icone.marginLeft = 0;
		}else{
			this.positionIcone = 3;
			this.icone.marginRight = 0;
			this.icone.marginLeft = 2;
		}
		Ki.iconeTexteChange(this);
		}
		
		
		//---------------------
		public function set currency(currency: String) {
			_currency = currency;
			this.iconeLabel = currency;
			
			if(currency == "$"){
			
			this.positionIcone = 1;
			this.icone.marginRight = 2;
			this.icone.marginLeft = 0;
		
		}else{
			this.positionIcone = 3;
			this.icone.marginRight = 0;
			this.icone.marginLeft = 2;
		}
			Ki.iconeTexteChange(this);
		
		}
		
		public function get currency():String {
			return _currency;
		}
		

	}
	
}
