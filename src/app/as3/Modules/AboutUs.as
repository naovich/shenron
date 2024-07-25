package com.nao.Modules {
	
	import com.nao.Modules.Post;
	import com.nao.Pages.Grid;
	import com.nao.Power.Ki;
	import com.nao.General.L;
	
	public class AboutUs extends Post {

		public function AboutUs(grid:Grid, titre:String = "null", x:Number = 0, y:Number = 0, column:uint = 2, height:Number = 200) {
			// constructor code
			
			
			
			super(grid, titre, column,debutCol,height,y,x,width );
			super.datePost.visible = false;
			//super.datePost = null ;
			//this.titre.label = titre;
			if(titre != "null"){
				this.titre.label = titre;
			}else{
				this.titre.label = L.aboutUs;
			}
			
			this.texte.positionArray[0] = this.titre;
			this.texte.positionTypeY = 6;
			
			
			Ki.postChange(this);
		}

	}
	
}
