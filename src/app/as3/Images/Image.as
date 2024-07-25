
package  com.nao.Images {
	
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	
	public class Image extends Balise {
		
		private var _url:String = "";
		//private var _sizeType:uint; //big, medium, small, thumbernail
		//private var _tag:Array;
		//private var _exterior:Boolean ;
		//private var _landscape:Boolean;
		//private var // eau plage, fleuve...
		//private var _sector:uint;
		//
		//private var _location; //city, forest, desert, nature
		//private var _color:Array;
		//private var _time:uint ; //1 aube 2 jour, 3 crépuscule,4 nuit
		//
		//private var _humanIn:Boolean;
		//private var _people:Array;
		//private var _couple:Boolean;
		//private var _crowd:Boolean;;
		//private var _race:Array;
		//private var _work:Array; //none, artisant
		//private var _activity:String;
		//
		//private var _transport:uint; //none, car...
		//
		//private var _rarity:uint;
		//private var _spectacular:uint;
		//private var _stars:uint;
		//private var realType:uint; //Real, art, 3D, scratch
		
		

		public function Image(x:Number = 0, y:Number = 0, width:Number = 100, height:Number = 80 ) {
			// constructor code
			super(x,y,width,height)
			super.background.backgroundSizeCover = "cover";
			Ki.baliseChange(this);
		}
		
		
		//---------------------		
		public function get url(): String {
			return _url;
		}
		
		public function set url(url: String) {

			_url = url;
			super.background.backgroundImage = url;
			trace(Ki.baliseChange(this));
			
			
		}

	}
	
}
