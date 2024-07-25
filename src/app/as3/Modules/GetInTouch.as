package com.nao.Modules {
	
	import com.nao.Listes.SuperListe ;
	import com.nao.Textes.*;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Components.SocialIcon;
	import com.nao.Components.Email;
	import com.nao.Power.Ki;
	
	
	public class GetInTouch extends SuperListe {

		public function GetInTouch(x: Number = 0, y: Number = 0, rowLimit:uint = 5, vertical:Boolean = true) {
			// constructor code
			
			super(x, y, rowLimit, vertical);
			this.padding = 0;
				/*this.paddingHorizontal = 0;
				this.paddingVertical = 0 ;*/
			
				var support:IconeTexte = new IconeTexte("Get in Touch");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontSize = 16;
				support.marginBottom = 20;
				
				
				//var espace:Texte = new Texte("");
				
				
				var phone:Telephone = new Telephone();
				phone.fontFamily = "Open sans";
				phone.color = 0xFFFFFF;
				phone.marginTop = 20;
			
				var adress:Adress = new Adress();
				adress.fontFamily = "Open sans";
				adress.color = 0xFFFFFF;
			
				
				var email:Email = new Email();
				email.fontFamily = "Open sans";
				email.color = 0xFFFFFF;
			
			
			
			
				this.background.backgroundImage = "transparent";
				this.paddingRight = 0;
				this.paddingLeft = 0;

				this.pushItem(support);
				//this.pushItem(espace);
				this.pushItem(phone);
				this.pushItem(adress);
				this.pushItem(email);
				
				Ki.baliseChange(this);
			
		
			//this.cVertical();
		}

	}
	
}
