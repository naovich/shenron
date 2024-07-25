package com.nao.Components {
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	import com.nao.Images.IconeBalise;
	import com.nao.Basic.Position;
	
	public class ArrowSlide extends Balise {
		
		private var _right:IconeBalise = new IconeBalise ("",0,0,0,30);
		private var _left:IconeBalise = new IconeBalise ("",0,0,0,30);

		public function ArrowSlide(x:Number = 0,y:Number = 0,width:Number = 800,height:Number = 40) {
			// constructor code
			super(x,y,width,height);
			
			
			Position.normalXYRightCenter(_right,this);
			Position.normalXYLeftCenter(_left,this);
			
			this.background.backgroundImage = "trasparent";
			/*this.background.backgroundImage ="color";
			this.background.backgroundColor = 0x785263;
			
			right.background.backgroundImage ="color";
			right.background.backgroundColor = 0x159263;
			
			left.background.backgroundImage ="color";
			left.background.backgroundColor = 0x159263;
	*/
			this.addBalise(right);
			this.addBalise(left);
			
			Ki.texteChange(right.label);
			Ki.texteChange(left.label);
			Ki.baliseChange(right);
			Ki.baliseChange(left);
			Ki.baliseChange(this);
		}
		
		
		//---------------------
		public function set right(right: IconeBalise) {
			_right = right;
		}
		
		public function get right():IconeBalise {
			return _right;
		}
		
		//---------------------
		public function set left(left: IconeBalise) {
			_left = left;
		}
		
		public function get left():IconeBalise {
			return _left;
		}

	}
	
}
