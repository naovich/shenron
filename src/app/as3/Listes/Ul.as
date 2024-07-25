package  com.nao.Listes {
		
	import com.nao.Containers.Balise ;
	
	
	public class Ul extends Balise {
		
		//private var li:Texte;
		private var tabLi:Array = new Array();
		
		
		public function Ul(x:Number, y:Number, width:Number, height:Number){
			super(x, y, width, height);
			_codeHTML = <ul></ul>;
		}
		
	

	}
	
}
