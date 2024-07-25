package com.nao.Pages {

	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.Shape;
	import com.nao.General.Selection;

	public class Grid extends Sprite {


		private var _numcolumn: uint;
		private var _gutterWidth: uint;
		private var _marginTop: uint;
		private var _marginBottom: uint;
		private var _marginLeft: uint;
		private var _marginRight: uint;
		private var _columnArray: Array = new Array();

		private var _columnWidth: Number;
		private var _debutClipPageX: uint = 0;
		private var _debutClipPageY: uint = 0;
		private var _page: Page;
		private var _gridColor:uint= 0x4AFFFF;
		private var  _colSize:uint;
		private var _widthColArray:Array = new Array();
	
		
		

		public function Grid(page: Page, marginTop: uint, marginBottom: uint, marginLeft: uint, marginRight: uint, numcolumn: uint, gutterWidth: uint) {
			// constructor code

			_page = page;
			_numcolumn = numcolumn;
			_gutterWidth = gutterWidth;
			_marginTop = marginTop;
			_marginBottom = marginBottom;
			_marginLeft = marginLeft;
			_marginRight = marginRight;
			page.grid = this;
			
			page.paddingTop = marginTop;
			page.paddingBottom = marginBottom;
			page.paddingLeft = marginLeft;
			page.paddingRight = marginRight;

			remplirColonneTab();
			tracerGrille();
			
			_colSize = Math.abs(columnArray[1].x - columnArray[0].x);
			
			for( var i=1;i<=columnArray.length;i++){
				
				
				_widthColArray.push(_colSize * i);
				
			}
			
			Selection.sGrid = this;
		}

		

		public function showGrid(): void

		{
			if (this.visible == true) {
				this.visible = false;
			} else {
				this.visible = true;
			}


		}
		

public function changeGrid(page: Page, marginTop: uint, marginBottom: uint, marginLeft: uint, marginRight: uint, numcolumn: uint, gutterWidth: uint) {
			// constructor code

			
			_page = page;
			_numcolumn = numcolumn;
			_gutterWidth = gutterWidth;
			_marginTop = marginTop;
			_marginBottom = marginBottom;
			_marginLeft = marginLeft;
			_marginRight = marginRight;
			
			while(_columnArray.length > 0 )_columnArray.pop();
	
			this.graphics.clear();
			remplirColonneTab();
			tracerGrille();
	
			page.paddingRight = marginRight;
			page.paddingBottom = marginBottom;
			page.paddingLeft = marginLeft;
			page.paddingRight = marginRight;

	
	
			_widthColArray = [];
			_colSize = columnArray[1].x - columnArray[0].x;
			
			for( var i=1;i<=columnArray.length;i++){
				
				
				_widthColArray.push(_colSize * i);
				
			}
	
	
		}

		private function remplirColonneTab(): void {


			_columnWidth = (_page.htmlWidth - _marginLeft - _marginRight - ((_numcolumn - 1) * _gutterWidth)) / _numcolumn;
		//	_columnWidth = ((_page.htmlWidth - _marginLeft - _marginRight )/numcolumn) - _gutterWidth;

			var p: Point = new Point(_marginLeft, _marginLeft + _columnWidth);
			_columnArray[0] = p;
			var dernierPoint: Number = _marginLeft + _columnWidth;

			for (var i: uint = 1; i < _numcolumn; i++) {
				var p2: Point = new Point();
				p2.x = dernierPoint + _gutterWidth;
				dernierPoint = p2.x;

				p2.y = dernierPoint + _columnWidth;
				dernierPoint = p2.y;
				_columnArray[i] = p2;

			}
			
		
			}



		private function tracerGrille()

		{


			this.graphics.lineStyle(1, _gridColor, 1, false, LineScaleMode.NONE, CapsStyle.NONE, JointStyle.MITER, 10);


			this.graphics.moveTo(_marginLeft, _marginTop);
			this.graphics.lineTo(_page.htmlWidth - _marginRight, _marginTop);

			this.graphics.moveTo(_marginLeft, _page.htmlHeight - _marginBottom);
			this.graphics.lineTo(_page.htmlWidth - _marginRight, _page.htmlHeight - _marginBottom);

			for (var i: uint = 0; i < _columnArray.length; i++) {
				this.graphics.moveTo(_columnArray[i].x, _marginTop);
				this.graphics.lineTo(_columnArray[i].x, _page.htmlHeight - _marginBottom);

				this.graphics.moveTo(_columnArray[i].y, _marginTop);
				this.graphics.lineTo(_columnArray[i].y, _page.htmlHeight - _marginBottom);

			}






		}


		
	public function colWidth(nbCol:uint):Number{
	
		if(nbCol != 0)
		{
		//var largeurColonne:Number = (nbCol * this.columnWidth) + (nbCol - 1) * this.gutterWidth;
		var largeurColonne:Number = ((this.columnWidth + gutterWidth ) * nbCol) - gutterWidth ; 
	//	var largeurColonne:Number = (((this.columnWidth + ((this.columnWidth *0)/100)) + gutterWidth   ) * nbCol) - gutterWidth;

		}else{
			
			largeurColonne = page.htmlWidth;
			
		}
		
		return largeurColonne;
		
	}
		
		
	public function colNear(posX:int):int{
		
		var distance:int = posX;
		var positionX:int = 0; 
		
		if(posX < columnArray[0].x){
			
			
			if(Math.abs(posX - columnArray[0].x) <= distance){
				
				positionX = 0 ;
				
			}else{
				positionX = - 1 ;
			}
			
		}else{
			for( var i:uint=0; i<=columnArray.length - 1; i++)
		{
			
			if(Math.abs(posX - columnArray[i].x) < distance){
				
				distance = Math.abs(posX - columnArray[i].x);
				positionX = i;
			}
			
		}
		}
		
		
		return positionX + 1 ;
		//trace("positionX:" + positionX);
	}
		
		
		
	public function colSizeNear(posX:int):int{
		
		var distance:int = Math.abs(_colSize - posX);
		var positionX:int = 0; 
		
		if(posX < _colSize){
			
			positionX =  0;
			

		}else{
			for( var i:uint=0; i<= _widthColArray.length - 1; i++)
		{
			
			if(Math.abs(posX - _widthColArray[i]) < distance){
				
				distance = Math.abs(posX -_widthColArray[i]);
				positionX = i;
				
			}
			
		}
		}
		
		
		return positionX + 1 ;
		
	}
		
		
		
		
		
		//---------------------	
		public function get numcolumn(): uint {
			return _numcolumn;
		}

		public function set numcolumn(numcolumn: uint) {

			_numcolumn = numcolumn;
		}
		
		
		
		//---------------------	
		public function get gutterWidth(): uint {
			return _gutterWidth;
		}

		public function set gutterWidth(gutterWidth: uint) {

			_gutterWidth = gutterWidth;
		}
		//---------------------	
		public function get marginTop(): uint {
			return _marginTop;
		}

		public function set marginTop(marginTop: uint) {

			_marginTop = marginTop;
		}
		
		//---------------------	
		public function get marginBottom(): uint {
			return _marginBottom;
		}

		public function set marginBottom(marginBottom: uint) {

			_marginBottom = marginBottom;
		}
		
		//---------------------	
		public function get marginLeft(): uint {
			return _marginLeft;
		}

		public function set marginLeft(marginLeft: uint) {
			_marginLeft = marginLeft;
		}
		
		//---------------------	
		public function get marginRight(): uint {
			return _marginRight;
		}

		public function set marginRight(marginRight: uint) {

			_marginRight = marginRight;
		}
		
		//---------------------	
		public function get columnWidth(): uint {
			return _columnWidth;
		}

		public function set columnWidth(columnWidth: uint) {

			_columnWidth = columnWidth;
		}
		
		//---------------------	
		public function get page(): Page {
			return _page;
		}

		public function set page(page: Page) {

			_page = page;
		}
		
		//---------------------	
		public function get gridColor(): uint {
			return _gridColor;
		}

		public function set gridColor(gridColor: uint) {

			_gridColor = gridColor;
		}
		
		//---------------------	
		public function get columnArray(): Array {
			return _columnArray;
		}

		public function set columnArray(columnArray: Array) {

			_columnArray = columnArray;
		}

		
		
		
		
		
		

		

	}

}