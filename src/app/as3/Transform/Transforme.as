package  com.nao.Transform {
	
	
	import flash.geom.Point;
	
	public class Transforme {
		
		private var _rotate:uint = 0;
		private var _skew:Point = new Point(0,0);

		public function Transforme() {
			// constructor code
		}
		
		
		
		
		
		
		
		
		//---------------------------------------------------------------------------------
		
		public function get rotate(): uint {
			return _rotate;
		}
		
		public function set rotate(rotate: uint) {
			_rotate = rotate;
		}
		
		
		
		//---------------------------------------------------------------------------------
		
		public function get skew(): Point {
			return _skew;
		}
		
		public function set skew(skew: Point) {
			_skew = skew;
		}

	}
	
}
