package com.nao.Modules {
		

		import com.nao.Containers.Div;
		import com.nao.Power.Ki;
		import com.nao.Basic.Position;
		import flash.geom.Rectangle;
		import com.nao.Pages.Page;
		import com.nao.Pages.Grid;
		

		import flash.geom.Point;
		import com.nao.Basic.Copy;
		import com.nao.Images.ImageBalise;
		
		
	
	
	public class Module extends Div {
		
	
		
		private var _imageBg:ImageBalise = new ImageBalise();
		
		
		public function Module(x:Number, y:Number ,width:Number, height:Number){
			
			
			
			super(x, y,width, height);
			baliseType = "Module";
			baliseName ="Module";
			
			this.addChild(_imageBg);
			//this.swapChildren(htmlLoad, imageBg);
			_imageBg.name = "bg";
			
			_imageBg.visible = false;
			_imageBg.mouseEnabled = false;
			
		
			_imageBg.htmlWidth = width;
			_imageBg.htmlHeight = height;
		
			

		
			Ki.baliseChange(this);
			Ki.baliseChange(_imageBg);
			codeHTML = <div></div>;
		}
		
		
		
	
	
	
	public function  paddingModule (paddingx: uint) {
			this.padding = paddingx;
			this.paddingRight = paddingx;
			this.paddingLeft = paddingx;
			this.paddingTop = paddingx;
			this.paddingBottom =  paddingx;
			
		}
		
		
		
		override public function set htmlWidth(htmlWidth: Number) {
			htmlLoad.width = htmlWidth;
			imageBg.htmlWidth = htmlWidth;
			
			Ki.baliseChange(this);
		}
		
		
		override public function set htmlHeight(htmlHeight: Number) {
			htmlLoad.height = htmlHeight;
			imageBg.htmlLoad.height = htmlHeight;

			Ki.baliseChange(this);
		}
		
	
		//---------------------	
		public function get imageBg(): ImageBalise {
			return _imageBg;
		}

		public function set imageBg(imageBalise: ImageBalise) {
			_imageBg = imageBg;
		}
		


	}
	
}
