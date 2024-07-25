package  com.nao.Modules {
	
	import com.nao.Containers.Balise;
	import com.nao.Images.Image;
	import com.nao.Containers.Div;
	import com.nao.Modules.Module;
	import com.nao.Pages.Grid;
	import flash.geom.Point;
	import com.nao.Power.Ki;
	
	
	public class BlankModule extends Module {
		
		public static var staticBlankModuleId: int = 0;
		
		
		private var _mainModule:Balise = new Div(0,0,176,200);
		private var _header:Balise = new Div(0,0,176,40);
		private var _footer:Balise = new Div(0,0,176,40);
	//	private var _image:Image = new Image();

		
		public function BlankModule(grid:Grid,  column:int = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
		
			
			this.column = column;
			this.debutCol = debutCol;
					
			super(0, 0, width,height);
		
			baliseType = "BlankModule";
			baliseName ="ModuleVide";
		
			this.addBalise(footer);
			this.addBalise(mainModule);
			this.addBalise(header);
			//this.addBalise(image);
			
		
			blankModuleDefault(grid,column,debutCol,height,y, x,width);
			
		
			staticBlankModuleId ++;
			this.name = baliseName + " " + staticBlankModuleId.toString();
		
		
			/*mainModule.positionArray[0] = this;
			header.positionArray[0] = this;
			footer.positionArray[0] = this;
			image.positionArray[0] = this;
			
			mainModule.positionArray[1] = this;
			header.positionArray[1] = this;
			footer.positionArray[1] = this;
			image.positionArray[1] = this;
			
			mainModule.positionArray[5] = this;
			header.positionArray[5] = this;
			footer.positionArray[5] = this;
			image.positionArray[5] = this;*/
			
			header.visible = false;
			footer.visible = false;
			mainModule.visible = false;
			//image.visible = false;
			
			mainModule.padding = 5;
			/*header.scale.x = 1;
			mainModule.scale.x = 1;
			footer.scale.x = 1;
			image.scale.x = 1;
			*/
		/*	header.positionTypeX = 2;
			header.positionTypeY = 2;
			
			mainModule.positionTypeX = 2;
			mainModule.positionTypeY = 2;
			
			footer.positionTypeX = 2;
			footer.positionTypeY = 2;
					
			image.positionTypeX = 2;
			image.positionTypeY = 2;*/
		

		}
		
		public function blankModuleDefault(grille:Grid,column:int,debutCol:int=-1,height:Number = 200,y:Number = 0, x:Number = 0,width:Number = 200){
			
			
			//-------------------Nouvelle position et taille-------------------
			var xw:Point = new Point();
			this.htmlHeight = height;
			this.column = column;
			this.debutCol = debutCol;
			
			this.y = y;
			xw = modify(grille,column,debutCol, x,width);
		
			
			this.positionTypeX = 2;
			this.positionTypeY = 2;
			
			this.fixedPositionX = xw.x;
			this.fixedPositionY = y;
			
			this.widthType = 0;
			this.heightType = 0;
			
			this.widthType = 0;
			this.heightType = 0;
			
			this.fixedHeight = height;
			this.fixedWidth = xw.y;
			
			
			
			
			
			
			Ki.balisePosition(this);
			//Ki.htmlRender(this);
			
			
		}
		
		
		
		
		//---------------
		public function get header(): Balise {
			return _header;
		}

		public function set header(header: Balise) {
			_header = header;
		}
		
		//--------------------	
		public function get mainModule(): Balise {
			return _mainModule;
		}
		
		public function set mainModule(mainModule: Balise) {

			_mainModule = mainModule;
		}
		public function get footer(): Balise {
			return _footer;
		}

		public function set footer(footer: Balise) {
			_footer = footer;
		}
		
		/*public function get image(): Image {
			return _image;
		}

		public function set image(image: Image) {
			_image = image;
		}*/
		
	
		
	
	
		

	}
	
}
