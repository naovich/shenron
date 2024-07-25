package com.nao.Modules {
	
	import com.nao.Listes.SuperListe ;
	import com.nao.Textes.*;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Components.PaymentIcon;
	import com.nao.Components.Email;
	import com.nao.Power.Ki;
	
	
	public class Payment extends SuperListe {

		public function Payment(x: Number = 0, y: Number = 0, rowLimit:uint = 5, vertical:Boolean = true) {
			// constructor code
			
			super(x, y, rowLimit, vertical);
			
				var support:IconeTexte = new IconeTexte("Payment");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontSize = 16;
				
				//
				//var espace:Texte = new Texte("");
				
				
				var paymentIcon:PaymentIcon = new PaymentIcon();
				//paymentIcon.fontFamily = "fontAwesome";
				paymentIcon.color = 0xFFFFFF;
				paymentIcon.marginTop = 20;
				Ki.texteChange(paymentIcon);
				
			
				this.background.backgroundImage = "transparent";
				this.paddingRight = 0;
				this.paddingLeft = 0;

				this.pushItem(support);
				//this.pushItem(espace);
				this.pushItem(paymentIcon);
			
				
				Ki.baliseChange(this);
			
		
			//this.cVertical();
		}

	}
	
}
