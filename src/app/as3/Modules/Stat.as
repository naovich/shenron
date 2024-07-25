package  com.nao.Modules{
	
	import com.nao.Modules.Service;
	
	public class Stat extends Service{

		public function Stat(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
			// constructor code
			super(grid, titre, column,debutCol,height,y,x,width );
		}

	}
	
}
