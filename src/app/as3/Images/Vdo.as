package  com.nao.Images {
	
	import com.nao.Containers.Balise;
	import com.nao.Images.Icone;
	import com.nao.Textes.Texte;
	import com.nao.Power.Ki;
	
	
	public class Vdo extends Balise {

		
		private var _footer:Balise = new Balise(0,400,500,400);
		private var _progess:Balise = new Balise(0,400,500,400);
		private var _left:Balise = new Balise(0,400,500,400);
		private var _witness:Icone = new Icone("");
		private var _play:Icone = new Icone("");
		private var _pause:Icone  = new Icone("");
		private var _sound:Icone  = new Icone("");
		private var _fullScreen:Icone  = new Icone("");
		private var _playCenter:Icone = new Icone("");
		private var _progressTime:Texte = new Texte("0:00/5:10");

		
		
		
		public function Vdo(x:uint = 0, y:uint= 0, width:uint = 480, height:uint = 270) {
			// constructor code
			super(x,y,width,height);
			
			this.addChild(_footer);
		/*	this.addChild(_progess);
			this.addChild(_left);
			this.addChild(_witness);*/
			this.addChild(_play);
			//this.addChild(_pause);
			//this.addChild(_sound);
			//this.addChild(_fullScreen);
			//this.addChild(_playCenter);
			//this.addChild(_progressTime);
			
			
			this.background.backgroundColor = 0x24AA55;
			this.background.backgroundImage = "color";
			
			_footer.x = 0;
			_footer.y =  40;
			_footer.width = 400;
			_footer.height = 40;
			_footer.background.backgroundColor = 0x999999;
			_footer.background.backgroundImage = "color";

			
			_progess.x = 80;
			_progess.y = this.height - 40;
			_progess.width = this.width/2 - 80;
			_progess.height = 10;
			_progess.background.backgroundColor = 0xBB7777;
			
			_left.x = _progess.x + _progess.width ;
			_left.y = _progess.y ;
			_left.width = _progess.width ;
			_left.height = _progess.height;
			_left.background.backgroundColor = 0x117777;
			
			_play.x = 10;
			_play.y = 40;
			
			
			Ki.baliseChange(this);
			Ki.baliseChange(_footer);
			/*Ki.baliseChange(_progess);
			Ki.baliseChange(_left);
			*/
			Ki.iconeChange(_play);
			
		}
		
		
		

	}
	
}
