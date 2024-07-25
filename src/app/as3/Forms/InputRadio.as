package com.nao.Forms {
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	
	public class InputRadio extends Balise {
		
		private var _value:String = "Radio";
		private var _checked:Boolean;

		public function InputRadio(label:String = "Radio", x:Number = 0,y:Number = 0,width:Number = 200,height:Number = 25, checked:Boolean = false) {
			// constructor code
			super(x,y,width,height);
			_value = label;
			_checked = checked;
			if(checked == true){
				codeHTML = <span>{value}<input type='radio' checked="checked"/></span>;
			}else{
				codeHTML = <span>{value}<input type='radio'/></span>;
			}
			this.background.backgroundImage ="transparent";
			Ki.baliseChange(this);
		}
		
		
		//---------------------
		public function set value(value: String) {
			_value = value;
			
			if(checked == true){
				codeHTML = <span>{value}<input type='radio' checked="checked"/></span>;
			}else{
				codeHTML = <span>{value}<input type='radio'/></span>;
			}
			Ki.baliseChange(this);
		}
		
		public function get value():String {
			return _value;
		}
		
		public function set checked(checked: Boolean) {
			_checked = checked;
			if(checked == true){
				codeHTML = <span>{value}<input type='radio' checked="checked"/></span>;
			}else{
				codeHTML = <span>{value}<input type='radio'/></span>;
			}
			Ki.baliseChange(this);
			
		}
		
		public function get checked():Boolean {
			return _checked;
		}

	}
	
}
