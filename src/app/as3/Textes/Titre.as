package com.nao.Textes  {
	
	import com.nao.Textes.IconeTexte;
	
	public class Titre extends Texte extends IconeTexte{
		
		private var _hType;
		
		
		

	public function Titre (label:String = "Mon Titre", hType = 3, icone:String = "", positionIcone:uint = 0, x:Number = 0, y:Number = 0, width:Number = 200, height:Number = 20, iconSize:uint = 20  ) {

			// constructor code
			super(label,x, y, width,height);
			_hType = hType;
			
			switch(_hType){
				
				case 1:
				super.codeHTML = <h1>{label}</h1>;
				break;
				
				case 2:
				super.codeHTML = <h2>{label}</h2>;
				break;
				
				case 3:
				super.codeHTML = <h3>{label}</h3>;
				break;
				
				case 4:
				super.codeHTML = <h4>{label}</h4>;
				break;
				
				case 5:
				super.codeHTML = <h5>{label}</h5>;
				break;
				
				case 6:
				super.codeHTML = <h6>{label}</h6>;
				break;
				
				
				}
			
		}

		
		

		
		
	}
	
	
	
}
