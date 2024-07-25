package com.nao.Modules {
	
	import com.nao.Listes.SuperListe ;
	import com.nao.Textes.*;
	import com.nao.Components.Telephone;
	import com.nao.Components.Adress;
	import com.nao.Components.SocialIcon;
	import com.nao.Power.Ki;
	
	
	public class Social extends SuperListe {

		public function Social(x: Number = 0, y: Number = 0, rowLimit:uint = 5, vertical:Boolean = true) {
			// constructor code
			
			super(x, y, rowLimit, vertical);
			this.padding = 0;
			
				var support:IconeTexte = new IconeTexte("Follow us");
				support.fontFamily = "Patua One";
				support.color = 0xFFFFFF;
				support.fontSize = 16;
			
				
				//var espace:Texte = new Texte("");
				
				
				var fb:IconeTexte = new IconeTexte("Facebook","",1);
				fb.fontFamily = "Open sans";
				fb.color = 0xFFFFFF;
				fb.marginTop = 20;
			
				var twitter:IconeTexte = new IconeTexte("Twitter","",1);
				twitter.fontFamily = "Open sans";
				twitter.color = 0xFFFFFF;
			
				
				var gp:IconeTexte = new IconeTexte("Google +","",1);
				gp.fontFamily = "Open sans";
				gp.color = 0xFFFFFF;
			
			
			
			
				this.background.backgroundImage = "transparent";
				//this.paddingRight = 0;
				//this.paddingLeft = 0;
				//this.paddingTop = 0;
				//this.paddingBottom = 0;
				//this.padding = 0;

				this.pushItem(support);
				//this.pushItem(espace);
				this.pushItem(fb);
				this.pushItem(twitter);
				this.pushItem(gp);
				
				
				
				Ki.baliseChange(this);
			
		
			//this.cVertical();
		}

	}
	
}
