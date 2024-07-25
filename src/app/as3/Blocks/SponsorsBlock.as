package com.nao.Blocks{


	import com.nao.Blocks.ServiceBlock;
	import com.nao.Pages.Grid;
	import com.nao.Power.Ki;
	
	public class SponsorsBlock  extends ServiceBlock{

		public function SponsorsBlock(grid:Grid, titre:String = "", column:uint = 0 ,debutCol:int = -1,height:Number = 250,y:Number = 0,x:Number = 0,width:Number = 200) {
	
			super(grid, titre, column ,debutCol,height,y,x,width);
			Ki.serviceBlockChange(this);
		}

	}
	
}

