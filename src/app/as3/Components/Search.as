package com.nao.Components {
	
	import com.nao.Components.InputText;
	import com.nao.Textes.IconeTexte;
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	
	
	public class Search extends Balise {
		
		
		private var _iconeTexte:IconeTexte  = new IconeTexte("Recherche","",1,2,3,130,20);
		private var _inpuText:InputText = new InputText("",134,2,150,20);

		public function Search(label:String = "", icon:String = "",x:Number = 0, y:Number = 0, width:Number = 295, height:Number = 25 ) {
			// constructor code
			this._iconeTexte.label = label;
			this._iconeTexte.icone.label = icon;
			
			
			super(x, y, width, height);
			
			
			
			this.addChild(_inpuText);
			this.addChild(_iconeTexte);
			
			this.background.backgroundImage = "transparent";
			Ki.texteChange(_iconeTexte);
			Ki.texteChange(_inpuText);
			Ki.baliseChange(this);
			
		}
		
	
		
		//---------------------	
		public function get inpuText(): InputText {
			return _inpuText;
		}
		
		public function set inpuText (inpuText: InputText) {

			_inpuText = inpuText;
		}
		
		
		//---------------------	
		public function get iconeTexte(): IconeTexte {
			return _iconeTexte;
		}
		
		public function set iconeTexte (iconeTexte: IconeTexte) {

			_iconeTexte = iconeTexte;
		}

	}
	
}
