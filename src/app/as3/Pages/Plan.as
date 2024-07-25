package com.nao.Pages {

	import flash.display.Sprite;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import com.nao.Pages.Page;
	import flash.geom.Rectangle;



	public class Plan extends Sprite {

		private var _hauteurPlan: uint;
		private var _largeurPlan: uint;
		private var _couleurPlan: uint = 0x444444;
		private var _page: Page;
		private var _emplacement:Rectangle;

		private var _decalageHaut: uint = 50;
		private var _decalageBas: uint = 200;
		private var _decalageCote: uint = 200;

		public function Plan(page: Page,emplacement:Rectangle) {
			// constructor code

			_page = page;
			_emplacement = emplacement;
			_largeurPlan = emplacement.width ;//+ _decalageCote;
			_hauteurPlan = emplacement.height;// + _decalageHaut + _decalageBas ;
			creerPlan();


		}

		public function modifierPlan(page: Page,emplacement:Rectangle) {
			// constructor code

			_page = page;
			_emplacement = emplacement;
			_largeurPlan = emplacement.width + _decalageCote;
			_hauteurPlan = emplacement.height + _decalageHaut + _decalageBas ;
			creerPlan();
		}

		
		public function get page(): Page {
			return _page;
		}
		
		
		public function get hauteurPlan(): uint {
			return _hauteurPlan;
		}



		public function get largeurPlan(): uint {
			return _largeurPlan;
		}

		public function get couleurPlan(): uint {
			return _couleurPlan;
		}
		
		public function get decalageHaut(): uint {
			return _decalageHaut;
		}
		
		public function get decalageCote(): uint {
			return _decalageCote;
		}


		public function creerPlan(): void {

			//Création de la Plan
			this.graphics.clear();
			
			_largeurPlan = _emplacement.width + _decalageCote;
			_hauteurPlan = _emplacement.height + _decalageHaut + _decalageBas ;
			
			
			if(_page.htmlWidth > _largeurPlan)  
			{
				_largeurPlan = _page.htmlWidth + _decalageCote;
			}
			if(_page.htmlHeight > _hauteurPlan)
			{
				_hauteurPlan = _page.htmlHeight + _decalageHaut + _decalageBas;
			}

			this.graphics.beginFill(_couleurPlan);
			this.graphics.drawRect(0, 0, _largeurPlan, _hauteurPlan);
			this.graphics.endFill();

		}

	}

}