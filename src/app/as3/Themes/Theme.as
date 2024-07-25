package com.nao.Themes {
	
	import com.nao.Themes.Theme;
	import com.nao.Containers.Balise;
	import com.nao.Textes.Paragraph;
	
	public class Theme {
		
		private var _colors:Array = new Array(0x111111,0xFFFFFF);
		private var _fonts:Array = new Array("Open Sans","Patua One"); //mainFont, menuFont
	
		private var _styles:Array = new Array();
		
		

		public function Theme( color1:uint = 0x777777,color2:uint = 0x187DC2) {
			// constructor code
			_colors[2] = color1;
			_colors[3] = color2;
			
		}
		
		//
		
		
	/*	public static function changeColor(color1:uint){
			
			for(var i:uint = 0; i< _styles.length; i++){
				
				if( _styles[i].background.backgroundColor = color1)
				{
					_styles[i].background.backgroundColor = color2;
				}
				
				
				
			}
			
		}*/
		
			
		
		
		
		
		//---------------
		public function get colors(): Array {
			return _colors;
		}

		public function set colors(colors: Array) {
			_colors = colors;
		}
		
		//---------------
		public function get fonts(): Array {
			return _fonts;
		}

		public function set fonts(fonts: Array) {
			_fonts  = fonts;
		}
		
		//---------------
		public function get styles(): Array {
			return _styles;
		}

		public function set styles(styles: Array) {
			_styles  = styles;
		}

	}
	
}
