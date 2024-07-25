package  com.nao.Effects {
	
	public class Shadow {
		
		private var _hShadow:int;
		private var _vShadow:int;
		private var _blur:uint;
		private var _color:uint;
		private var _shadowBol:Boolean;




		public function Shadow(hShadow:int = 0, vShadow:int = 0, blur:uint = 0, color:uint = 0x888888 ) {
			// constructor code
			_hShadow = hShadow;
			_vShadow = vShadow;
			_blur = blur;
			_color = color;
		}
		//---------------------------------Fonction-------------------------------------------
		
		
		
		
		//---------------------------------GETTER/SETTER-------------------------------------------
		
		
		
		
		public function get hShadow(): int {
			return _hShadow;
		}
		
		public function set hShadow(hShadow: int) {
			_hShadow = hShadow;
			if(hShadow > 0 || vShadow > 0){
				shadowBol = true;
			}else{
				shadowBol = false;
			}
		}	
		
		
		public function get vShadow(): int {
			return _vShadow;
		}
		
		public function set vShadow(vShadow: int) {
			_vShadow = vShadow;
			
			if(hShadow > 0 || vShadow > 0){
				shadowBol = true;
			}else{
				shadowBol = false;
			}
		}
		
		
		public function get blur(): uint {
			return _blur;
		}
		
		public function set blur(blur: uint) {
			_blur = blur;
		}	
		
		
		public function get color(): uint {
			return _color;
		}
		
		public function set color(color: uint) {
			_color = color;
		}	

		public function get shadowBol(): Boolean {
			return _shadowBol;
		}
		
		public function set shadowBol(shadowBol: Boolean) {
			_shadowBol = shadowBol;
		}	
		
		
	}
	
}
