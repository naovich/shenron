package com.nao.Forms {
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	
	public class InputText extends Balise {
		
		private var _value:String = "";

		public function InputText(x:Number = 0,y:Number = 0,width:Number = 200,height:Number = 25) {
			// constructor code
			super(x,y,width,height);
			codeHTML = <input width={width} height={height} type='text' placeholder={value} />
			Ki.baliseChange(this);
		}
		
		
		//---------------------
		public function set value(value: String) {
			_value = value;
			codeHTML = <input width={width} height={height} type='text' placeholder={value} />
			Ki.baliseChange(this);
			
		}
		
		public function get value():String {
			return _value;
		}

		//---------------------	
		public function get inputWidth(): uint {
			return this.htmlWidth;
		}

		public function set inputWidth(width: uint) {
			this.htmlWidth = width;
			codeHTML = <input width={width} height={height} type='text' placeholder={value} />
			Ki.baliseChange(this);
			
		}
		
		//---------------------	
		public function get inputHeight(): uint {
			return this.htmlHeight;
		}

		public function set inputHeight(height: uint) {
			this.htmlHeight = height;
			codeHTML = <input width={width} height={height} type='text' placeholder={value} />
			Ki.baliseChange(this);
			
		}
		
		
	}
	
}
