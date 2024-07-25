package com.nao.Modules {
	
	import com.nao.Listes.SuperListe ;
	import com.nao.Textes.*;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Components.SocialIcon;
	import com.nao.Power.Ki;
	
	
	public class Compagny extends SuperListe {

		public function Compagny(x: Number = 0, y: Number = 0, rowLimit:uint = 5, vertical:Boolean = true) {
			// constructor code
			
			super(x, y, rowLimit, vertical);
				this.padding = 0;
				/*this.paddingHorizontal = 0;
				this.paddingVertical = 0 ;*/
				
			
				var support:IconeTexte = new IconeTexte("Compagny");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontSize = 16;
				
				
				var espace:Texte = new Texte("");
				
				
				var home:IconeTexte = new IconeTexte("Home");
				home.marginTop = 20;
				home.fontFamily = "Open sans";
				home.color = 0xFFFFFF;
			
				var about:IconeTexte = new IconeTexte("About us");
				about.fontFamily = "Open sans";
				about.color = 0xFFFFFF;
			
				
				var service:IconeTexte = new IconeTexte("Services");
				service.fontFamily = "Open sans";
				service.color = 0xFFFFFF;
				
				var contact:IconeTexte = new IconeTexte("Contact us");
				contact.fontFamily = "Open sans";
				contact.color = 0xFFFFFF;
			
			
			
			
				this.background.backgroundImage = "transparent";
				this.paddingRight = 0;
				this.paddingLeft = 0;
				
				//this.paddingTop = 0;
				//this.paddingBottom = 0;
				//this.padding = 0;
				
				

				this.pushItem(support);
				//this.pushItem(espace);
				this.pushItem(home);
				this.pushItem(about);
				this.pushItem(service);
				this.pushItem(contact);
				
				
				
				Ki.baliseChange(this);
			
		
			//this.cVertical();
		}

	}
	
}
