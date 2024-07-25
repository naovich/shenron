package com.nao.Blocks {
	
	import com.nao.Blocks.Slide;
	import com.nao.Power.Ki;
	import com.nao.Pages.Grid;
	
	
	public class Gallery extends Slide{

		public function Gallery(grid:Grid,column:uint = 0 ,debutCol:int = -1,height:Number = 400,y:Number = 0,x:Number = 0,width:Number = 200) {
			// constructor code
			super(grid,column:,debutCol,height,y,x,width);
		Ki.slideChange(this);
		}

	}
	
}
