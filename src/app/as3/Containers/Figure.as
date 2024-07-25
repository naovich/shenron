package com.nao.Containers {
	
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	
	public class Figure {

		public function Figure() {
			// constructor code
			
		}
		
		
		
		
		public static function rounded(balise:Balise, borderWidth:int = -1, borderColor:int = -1){
			
			if(borderWidth > 0)
			{
				balise.border.borderWidth = borderWidth;
				balise.border.borderColor = borderColor;
			}
			/*if(borderWidth > 0)
			{
				balise.border.borderColor = borderColor;
			}*/
			
			balise.border.borderStyle = "solid";
			balise.htmlHeight = 100;
			balise.border.borderRadius = balise.htmlWidth + balise.htmlHeight + 500;
			Ki.baliseChange(balise);
	
			
			
			
		}

	}
	
}
