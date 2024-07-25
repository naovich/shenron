
package  com.nao.Images {
	
	import com.nao.Containers.Balise;
	import com.nao.Power.Ki;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import fl.containers.UILoader;
	import com.nao.Modules.BlankModule;
	
	
	
	import com.nao.Basic.Position;
	import flash.geom.Rectangle;
	import com.nao.Pages.Grid;
	import com.nao.Basic.Copy;
	import com.nao.General.L;
	import flash.geom.Point;
	import com.nao.Basic.Copy;
	import com.nao.General.Selection;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import com.nao.Containers.Div;
	import flash.display.MovieClip;
	
	import flash.filesystem.File;
    import flash.net.FileFilter;

	
	public class ImageBalise extends Balise {
		
		private var _url:String = "";
		//public var request:URLRequest();
		public var loader:Loader = new Loader();
		private var _originalWidth:Number;
		private var _originalHeigth:Number;
		private var _originalRatio:Number;
		
		private var _canvasRatio: Number;
		private var _maskBalise:Sprite = new Sprite();
		private var _imageSizeState:int;
		private var _lockScale:Boolean = true;
		
		
		
		//private var _maskPosition:Point =  new Point(0,0):
		
		
		
		
		
		
		
		
		//public var _mask:Div = new Div(0,0,10,10);
		
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
		
		
		/*
		
		
		
		1) L'image prend la totalité de la largeur et reste
		
		
		
		
		*/
		
		
		
		
		
		
		
		
		
		
		
		

		public function ImageBalise(x:Number = 0,y:Number = 0,width:Number = 200, height:Number = 200, url:String = "images/photo.jpg" ) {
			// constructor code
			
		
		super(x,y ,width,height,0 );
			
			this.addChild(loader);
			this.addChild(_maskBalise);
			//this.addChild(_mask);
			this.background.backgroundImage = "transparent";
			this.name ="ImageBalise";
			
		
			_url = url;
			_canvasRatio = width/height;
	
			//Ki.baliseChange(_mask);
			
			//super.background.backgroundSizeCover = "cover";
			Ki.baliseChange(this);
			loadImage(url);
			
		}
		
		
		
		public function loadImage(url:String, px:Number =0, py:Number = 0, sx:Number = 1, sy:Number = 1 ){
			
			_url = url;
			
			var widthTemp:Number = this.htmlWidth;
			var heightTemp:Number = this.htmlHeight;
			
			var posX:Number = this.border.borderLeftWidth;
			var posY:Number = this.border.borderTopWidth;
			
			var widthImage = widthTemp - posX - this.border.borderRightWidth ;
			var heightImage = heightTemp - posY - this.border.borderBottomWidth;
			
			
			var rq:URLRequest = new URLRequest(url);
			
			
			_maskBalise.graphics.beginFill(0xFFFFFF);
			_maskBalise.graphics.drawRoundRect(posX,posY,widthImage,heightImage,this.border.borderTopRightRadius * 1.9 ,this.border.borderBottomLeftRadius * 1.9);
	
			var loader2:Loader = new Loader();
			
			loader.load(rq);
			_url = url;
			

			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(){
				
				loader.content.scaleX = 1;
				loader.content.scaleY = 1;
				
				
				_originalWidth = loader.content.width;
				_originalHeigth =  loader.content.height;
				_originalRatio = _originalWidth/_originalHeigth;
			
				
				
				loader.content.mask = _maskBalise;
				
				refreshImageInitFirst();
				trace("_originalWidth:"+_originalWidth);
				loader.content.x = px;
				loader.content.y = py;
				
				if(sx != 1){
					loader.content.scaleX = sx;
				}
				
				if(sy != 1){
					loader.content.scaleY = sy;
				}
				
				
				
			});
			
			Ki.baliseChange(this);
			
			
		
		}
		
		
	public function openImage(){
			
			var fileToOpen:File = new File();
			var imgFilter:FileFilter = new FileFilter("Image", "*.jpg;*.jpeg;*.png;*.bmp;*.svg");

			try 
			{
				fileToOpen.browseForOpen("Open", [imgFilter]);
				fileToOpen.addEventListener(Event.SELECT, fileSelected);
			}
			catch (error:Error)
			{
				trace("Failed:", error.message);
			}

			function fileSelected(event:Event):void 
			{
				
				loadImage(event.target.url);

			}
	
	
	}
	
	
		public function resizeOrigin(){
		loader.content.x = 0;
		loader.content.y = 0
		
		refreshImageInitFirst();
		
		}	
		
		
		public function refreshImage(){
			
		loadImage(url,loader.content.x,loader.content.y,loader.content.scaleX,loader.content.scaleY );

		}
		
		
		public function expendCanvasToImage(){
			
		
			
			if( canvasRatio < originalRatio)
				{
			
					if(this.name!= "bg"){
						this.fixedWidth = this.htmlHeight * originalRatio;
					}else{
						
						Selection.sBalise.fixedWidth = this.htmlHeight * originalRatio
					}
			 
				}else{

					if(this.name!= "bg"){
					
					this.fixedHeight = this.htmlWidth / originalRatio;
					}else{
					
						Selection.sBalise.fixedHeight = this.htmlWidth / originalRatio;
					}
				}
				
				
			

		}
		
		
		
		public function refreshImageInitFirst(){
			

			var posX:Number = this.border.borderLeftWidth //+ this.background.shadow.vShadow;
			var posY:Number = this.border.borderTopWidth //+ this.background.shadow.hShadow;
			
			
			
			
			
			var widthImage:Number = this.htmlWidth - posX - this.border.borderRightWidth - this.background.shadow.hShadow  ;
			var heightImage:Number = this.htmlHeight - posY - this.border.borderBottomWidth - this.background.shadow.vShadow;
			
			_maskBalise.graphics.clear();
		
			_maskBalise.graphics.beginFill(0xFFFFFF);
			_maskBalise.graphics.drawRoundRect(posX,posY,widthImage,heightImage,this.border.borderTopRightRadius * 1.9 ,this.border.borderBottomLeftRadius * 1.9);
	
			
			_canvasRatio = (this.htmlWidth - loader.content.x)/(this.htmlHeight - loader.content.y);
			
			if( canvasRatio < originalRatio)
				{
					loader.content.height = this.htmlHeight - loader.content.y - this.background.shadow.vShadow;;
			        loader.content.width = loader.content.height * _originalRatio ;
					
				}else{
					loader.content.width = this.htmlWidth - loader.content.x - this.background.shadow.hShadow ;
					loader.content.height = loader.content.width / _originalRatio; 
				}
				
				
				;
				
				
			//image_mc
			
		}
		
			public function refreshImageInit(){
			
			
			var posX:Number = this.border.borderLeftWidth //+ this.background.shadow.vShadow;
			var posY:Number = this.border.borderTopWidth //+ this.background.shadow.hShadow;
			
			var widthImage:Number = this.htmlWidth - posX - this.border.borderRightWidth - this.background.shadow.hShadow  ;
			var heightImage:Number = this.htmlHeight - posY - this.border.borderBottomWidth - this.background.shadow.vShadow;
			
			_maskBalise.graphics.clear();
		
			_maskBalise.graphics.beginFill(0xFFFFFF);
			_maskBalise.graphics.drawRoundRect(posX,posY,widthImage,heightImage,this.border.borderTopRightRadius * 1.9 ,this.border.borderBottomLeftRadius * 1.9);
	
			
			_canvasRatio = (this.htmlWidth - loader.content.x)/(this.htmlHeight - loader.content.y);
			
			
				if(this.htmlWidth > this.loader.content.width - loader.content.x || this.htmlHeight > this.loader.content.height - loader.content.y){//|| this.htmlHeight > this.loader.content.height - loader.content.y){
					
					
					
					if( canvasRatio < originalRatio)
					{
						coverAllHeightAndShowWidth();
					
					}else{
						coverAllWidthAndShowHeight();
						}
				
					
				}
				
			
		}
		
	
		
		private function coverAllWidthAndMaskHeight(){
			
			
		}
		
		
		private function coverAllHeightAndMaskWidth(){
			
			
		}
		
		
		public function coverAllWidthAndShowHeight(){
			
		/*	loader.content.width = this.htmlWidth;
			loader.content.height = this.htmlWidth / _originalRatio */
			
		
			var ratioNow:Number = loader.content.width/loader.content.height;
			
			loader.content.width = this.htmlWidth - loader.content.x - this.background.shadow.hShadow ;
			//loader.content.height = loader.content.width / _originalRatio; 
			loader.content.height = loader.content.width / ratioNow ; 
			
			//loader.content.x = this.border.borderLeftWidth //+ this.background.shadow.vShadow ;
			//loader.content.y = this.border.borderTopWidth //+ this.background.shadow.hShadow;
			
			
		}
		
		
		public function coverAllHeightAndShowWidth(){
			
			/*loader.content.height = this.htmlHeight ;
			loader.content.width = this.htmlHeight * _originalRatio */
			
		var ratioNow:Number = loader.content.width/loader.content.height;
			
			loader.content.height = this.htmlHeight - loader.content.y - this.background.shadow.vShadow;
			loader.content.width = loader.content.height * ratioNow ;
			
			//loader.content.width = loader.content.height * _originalRatio ;
			
			//loader.content.x = this.border.borderLeftWidth // + this.background.shadow.vShadow ;
			//loader.content.y = this.border.borderTopWidth //+ this.background.shadow.hShadow;
			
		}
		
		
	

		public function positionImageX(posX:Number){
			
			/*var maxX:Number = this.border.borderLeftWidth;
			var minX:Number = -((this.htmlWidth - loader.content.width) + this.border.borderRightWidth);
			
			if(posX > minX && posX < maxX)
			{
				loader.content.x = posX;
			}*/
			loader.content.x = posX;
			refreshImageInit();
		}	
		
		
		
		public function positionImageY(posY:Number){
			
			/*var maxX:Number = this.border.borderLeftWidth;
			var minX:Number = -((this.htmlWidth - loader.content.width) + this.border.borderRightWidth);
			
			if(posX > minX && posX < maxX)
			{
				loader.content.x = posX;
			}*/
			loader.content.y = posY;
			refreshImageInit();
		}	
			
		
		//public function scaleImageX(sX:Number){
		//	
		//
		//	loader.content.scaleX = sX/100;
		//	//refreshImageInit();
		//	
		//	
		//	
		//	
		//	if(loader.content.width < this.htmlWidth - loader.content.x){
		//		loader.content.width = this.htmlWidth - loader.content.x ;
		//		
		//	}
		//	
		//	
		//	
		//}
		
		
		
		public function scaleImageX(sX:Number){
			
		
		if( lockScale == false){
			
			if(originalWidth * sX/100 > this.htmlWidth - loader.content.x){
				loader.content.scaleX = sX/100;
				
			}else{
				loader.content.width =  this.htmlWidth - loader.content.x;
			}
		}else{
			
			if(originalWidth * sX/100 > this.htmlWidth - loader.content.x && originalHeight * sX/100 >= this.htmlHeight - loader.content.y){
				loader.content.scaleX = sX/100;
				loader.content.scaleY = sX/100;
				
				/*loader.content.width =  this.htmlWidth - loader.content.x;
				loader.content.height = loader.content.width /originalRatio;*/
				
			}else{
				
				/*loader.content.scaleX = sX/100;
				loader.content.scaleY = sX/100;*/
				
				/*loader.content.width =  this.htmlWidth - loader.content.x;
				loader.content.height = loader.content.width /originalRatio;*/
				
				/*loader.content.height = this.htmlHeight - loader.content.y ;
				loader.content.width = loader.content.height * originalRatio;*/
				
				if( canvasRatio < originalRatio)
				{
					loader.content.height = this.htmlHeight - loader.content.y - this.background.shadow.vShadow;;
			        loader.content.width = loader.content.height * _originalRatio ;
					
				}else{
					loader.content.width = this.htmlWidth - loader.content.x - this.background.shadow.hShadow ;
					loader.content.height = loader.content.width / _originalRatio; 
				}
			}
			
			
		}
			
		
		
	}
		
		
	public function scaleImageY(sY:Number){
			
			
	if( lockScale == false){
			
			if(originalHeight * sY/100 > this.htmlHeight - loader.content.y){
				
				loader.content.scaleY = sY/100;
				
			}else{
				loader.content.height = this.htmlHeight - loader.content.y ;
			}
			
		}else{
			
			
			if(originalWidth * sY/100 > this.htmlWidth - loader.content.x && originalHeight * sY/100 > this.htmlHeight - loader.content.y){
				loader.content.scaleX = sY/100;
				loader.content.scaleY = sY/100;
				
			}else{
				
				/*loader.content.height = this.htmlHeight - loader.content.y ;
				loader.content.width = loader.content.height * originalRatio;*/
				
				/*loader.content.width =  this.htmlWidth - loader.content.x;
				loader.content.height = loader.content.width /originalRatio;*/
				
				if( canvasRatio < originalRatio)
				{
					loader.content.height = this.htmlHeight - loader.content.y - this.background.shadow.vShadow;;
			        loader.content.width = loader.content.height * _originalRatio ;
					
				}else{
					loader.content.width = this.htmlWidth - loader.content.x - this.background.shadow.hShadow ;
					loader.content.height = loader.content.width / _originalRatio; 
				}
			}
			
			
		}
}
		




 public function alignImageTocanvas(n:uint){
	 
	 
	 
	 switch(n){
		 
		case 0:
		loader.content.x = 0;	
		loader.content.y = 0;
		break
		
		case 1:
		loader.content.x = (this.htmlWidth/2) - (loader.content.width/2);
		loader.content.y = 0;
		break;
		
		case 2:
		loader.content.x = this.htmlWidth - loader.content.width;
		loader.content.y = 0;
		break;
		
		case 3:
		loader.content.x = 0;
		loader.content.y = (this.htmlHeight/2) - (loader.content.height/2);
		break;
		
		case 4:
		loader.content.x = (this.htmlWidth/2) - (loader.content.width/2);
		loader.content.y = (this.htmlHeight/2) - (loader.content.height/2);
		break;
		
		case 5:
		loader.content.x = this.htmlWidth - loader.content.width;
		loader.content.y = (this.htmlHeight/2) - (loader.content.height/2);
		break;
		
		case 6:
		loader.content.x = 0;
		loader.content.y = this.htmlHeight - loader.content.height;
		break;
		
		case 7:
		loader.content.x = (this.htmlWidth/2) - (loader.content.width/2);;
		loader.content.y = this.htmlHeight - loader.content.height;
		break;
		
		case 8:
		loader.content.x = this.htmlWidth - loader.content.width;
		loader.content.y = this.htmlHeight - loader.content.height;
		break;
		
	
		 
	 }
 }


		
	/*	
		function customRectF(s:Sprite,rad:Number,x:Number,y:Number,w:Number,h:Number) {
    s.x=x;
    s.y=y;
    with (s.graphics) {
        lineStyle(1,0xff0000);
        moveTo(0,0);
        lineTo(w-rad,0);
        curveTo(w,0,w,rad);
        lineTo(w,h);
        lineTo(rad,h);
        curveTo(0,h,0,h-rad);
        lineTo(0,0);
    }
}*/
		
		
		
		
		
		
		
		//	public function loadImage(url:String){
		//	//myUILoader.autoLoad = false;
		//	//loader.scaleContent = false;

		//	loader.alpha = 0.8;
		//	_url = url;
		//	loader.source = url;
		//	//loader.setSize(this.htmlWidth,this.htmlHeight);
		//	//loader.content.alpha = 50;
		//	loader.width = this.htmlWidth;
		//	loader.height = this.htmlHeight;
		//	
		//	loader.setSize(loader.width,100);
		////	loader.maintainAspectRatio = false;
		//	loader.x = 0;
		//	loader.y = 0;
		////	loader.addEventListener(Event.COMPLETE, completeHandler);
		//	Ki.baliseChange(this);
		//
		//}
		
		
		//---------------------		
		public function get url(): String {
			return _url;
		}
		
		public function set url(url: String) {

			_url = url;
			super.background.backgroundImage = url;
			Ki.baliseChange(this);
			
			
		}
		
		
		//---------------------		
		public function get originalWidth(): Number {
			return _originalWidth;
		}
		
		//---------------------		
		public function get originalHeight(): Number {
			return _originalHeigth;
		}
		
		//---------------------		
		public function get originalRatio(): Number {
			return _originalRatio;
		}
		
		//---------------------		
		public function get maskBalise(): Sprite {
			return _maskBalise;
		}
		
		
		//---------------------		
		public function get canvasRatio(): Number {
			return _canvasRatio;
		}
		
		
		public function set canvasRatio(canvasRatio: Number ){
			_canvasRatio = canvasRatio;
		}
		
		//---------------------		
		public function get imageSizeState(): Number {
			return _imageSizeState;
		}
		
		public function set lockScale(lockScale: Boolean ){
			_lockScale = lockScale;
		}
		
		//---------------------		
		public function get lockScale(): Boolean {
			return _lockScale;
		}
		
		
		
		
		
		public function set imageSizeState(imageSizeState: Number ){
			_imageSizeState = imageSizeState ;
			
			switch(imageSizeState){
				
			case 0:
			break;
				
				
				
			}
			
		}
		
		
		
	
	}
	
}
