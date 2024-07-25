package com.nao.Forms {
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	
	public class Combobox extends Balise {
		
		private var _value:String = "";

		public function Combobox(x:Number = 0,y:Number = 0,width:Number = 200,height:Number = 25) {
			// constructor code
			super(x,y,width,height);
			codeHTML = <select width={width} height={height} ><option>{value}</option></select>;
			Ki.baliseChange(this);
		}
		
		
		//---------------------
		public function set value(value: String) {
			_value = value;
			codeHTML = <select width={width} height={height} ><option>{value}</option></select>;
			Ki.baliseChange(this);
		}
		
		public function get value():String {
			return _value;
		}
		
		public function get inputWidth(): uint {
			return this.htmlWidth;
		}

		public function set inputWidth(width: uint) {
			this.htmlWidth = width;
			codeHTML = <select width={width} height={height} ><option>{value}</option></select>;
			Ki.baliseChange(this);
			
		}
		
		//---------------------	
		public function get inputHeight(): uint {
			return this.htmlHeight;
		}

		public function set inputHeight(height: uint) {
			this.htmlHeight = height;
			codeHTML = <select width={width} height={height} ><option>{value}</option></select>;
			Ki.baliseChange(this);
		}	

	}
	
}
