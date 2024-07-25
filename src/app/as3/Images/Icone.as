package com.nao.Images  {
	
	import com.nao.Textes.Texte;
	import com.nao.Power.Ki;
	import flash.text.TextFormat;
	import flash.geom.Point;
	
	public class Icone extends Texte {

		
		
		
		public function Icone(label:String,x:Number = 0, y:Number = 0,color:uint = 0x000000, fontSize:uint = 20, fontFamily = "FontAwesome", fontWeight:Boolean = false, fontStyle:String = "normal", fontVariant:Boolean = false,width:Number = 40,height:Number = 40 )  {
			
			super(label,x, y, color, fontSize,fontFamily,fontWeight, fontStyle,fontVariant, width, height);
			Ki.texteChange(this);			
		}
		
		
		
		override public function resize():Point{
			var xy:Point = new Point();
			this.textField.defaultTextFormat = new TextFormat(this.fontFamily,this.fontSize);
			this.textField.text = this.label;
			this.htmlWidth = this.textField.textWidth;
			this.htmlHeight = this.textField.textHeight;
			
			xy.x = this.htmlWidth;
			xy.y = this.htmlHeight;
			
			return xy;
			
			
		}
		
		
	
		

	}
	
}
