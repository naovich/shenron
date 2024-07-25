package com.nao.General  {
	
	import flash.events.Event;
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Pages.Page;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.nao.Power.Ki;
	
	public class activeDisplay {
		
		private var _selBalise:Balise;
		private var _selDiv:Div;
		private var _selPage:Page;

		public function activeDisplay() {
			// constructor code
		}
		
		
		//---------------

		public function get selBalise(): Balise {
			return _selBalise;
		}

		public function set selBalise(selBalise: Balise) {
			_selBalise = selBalise;

		}


		public function get selDiv(): Div {
			return _selDiv;
		}

		public function set selDiv(selDiv: Div) {
			_selDiv = selDiv;

		}


		public function get selPage(): Page {
			return _selPage;
		}

		public function set selPage(selPage: Page) {
			_selPage = selPage;

		}

	}
	
}
