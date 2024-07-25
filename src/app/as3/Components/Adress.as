package  com.nao.Components {
	
	import com.nao.Textes.IconeTexte ;
	import com.nao.General.L;
	public class Adress extends IconeTexte {

		
		public function Adress (label:String = "null", icone:String = "",positionIcone:uint = 1,  x:Number = 0, y:Number = 0, width:Number = 150, height:Number = 20, iconSize:uint = 20  ) {
			// constructor code
			
		
		
		super(label,icone,positionIcone,x,y,width,height,iconSize);
		
		if(label != "null"){
				this.label = label;
			}else{
				this.label = L.address;	
			}
			this.icone.marginRight = 10;
			
		}
		
	}
	
}
