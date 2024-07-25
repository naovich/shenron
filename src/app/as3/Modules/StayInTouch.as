package com.nao.Modules {
	
	import com.nao.Listes.SuperListe ;
	import com.nao.Textes.*;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Components.SocialIcon;
	import com.nao.Components.Email;
	import com.nao.Power.Ki;
	import com.nao.Components.Newsletter;
	
	
	public class StayInTouch extends SuperListe {

		public function StayInTouch(x: Number = 0, y: Number = 0, rowLimit:uint = 5, vertical:Boolean = true) {
			// constructor code
			
			super(x, y, rowLimit, vertical);
				this.padding = 0;
				var support:IconeTexte = new IconeTexte("Stay in Touch");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontSize = 16;
				
				
			//	var espace:Texte = new Texte("");
				
				
				var nl:Newsletter = new Newsletter();
					nl.marginTop = 20;
			
			
				this.background.backgroundImage = "transparent";
				this.paddingRight = 0;
				this.paddingLeft = 0;

				this.pushItem(support);
				//this.pushItem(espace);
				this.pushItem(nl);
				
				
				Ki.baliseChange(this);
			
		
			//this.cVertical();
		}

	}
	
}
