package com.nao.Images  {
	
	import com.nao.Containers.Balise;
	import com.nao.Containers.Element;
	import com.nao.Textes.Texte;
	import com.nao.Power.Ki;
	import flash.text.TextFormat;
	import flash.geom.Point;
	
	public class IconeBalise extends Element {

		private var _label:Texte = new Texte("");
		
		
		
		public function IconeBalise(label:String,x:Number = 0, y:Number = 0,color:uint = 0x000000, fontSize:uint = 20, fontFamily = "FontAwesome", fontWeight:Boolean = false, fontStyle:String = "normal", fontVariant:Boolean = false,width:Number = 40,height:Number = 40 )  {
			
			
		
			_label.label = label;
			_label.color = color;
			_label.fontSize = fontSize;
		    
			_label.fontFamily = fontFamily;
			_label.fontWeight = fontWeight;
		    _label.fontStyle = fontStyle;
			_label.fontVariant = fontVariant;
		 
			
			
			//_label.htmlWidth = fontSize  + 20;
			//_label.textField.defaultTextFormat = new TextFormat(fontFamily,fontSize);
			//_label.htmlWidth = fontSize ; //_label.textField.textWidth ; // fontSize ;
			//_label.htmlHeight = fontSize + 5  ;//+ (fontSize/10) ;
			
			
			
			
			//var baliseSize:Number = _label.htmlHeight + fontSize/4	;
			
			var xy:Point = new Point();
			xy = _label.resize();
			super(x, y, xy.x, xy.y);
			this.background.backgroundImage = "transparent";
			
		/*	_label.x = this.htmlWidth/2 - (_label.htmlWidth ) /2;
			_label.y = this.htmlHeight/2 - (_label.htmlHeight - 5)/2;*/
			
			
			
			
			this.addChild(_label);
			this.mouseChildren = false;
			Ki.texteChange(_label);
			Ki.baliseChange(this);
			
		}
		
		public function get label(): Texte {
			return _label;
		}
		
		public function set label(label: Texte) {
			
			_label = label;
			_label.textField.defaultTextFormat = new TextFormat(_label.fontFamily,_label.fontSize);
			_label.htmlWidth = _label.fontSize  ; //_label.textField.textWidth ; // fontSize ;
			_label.htmlHeight = _label.fontSize ;//+ (fontSize/10) ;
			
			
			
			
			var baliseSize:Number = _label.htmlHeight + _label.fontSize/2	;	
			this.width = baliseSize;
			this.height = baliseSize;
			
			_label.x = this.htmlWidth/2 - (_label.htmlWidth ) /2;
			_label.y = this.htmlHeight/2 - _label.htmlHeight/2;
		
			
			
			
			Ki.texteChange(_label);
			Ki.baliseChange(this);
			
		}
		
		public function changeIcone(fontSize:uint, label:String )
		{
			_label.label = label;
			_label.fontSize = fontSize;
			_label.textField.defaultTextFormat = new TextFormat(_label.fontFamily,fontSize);
			_label.htmlWidth = fontSize  ; //_label.textField.textWidth ; // fontSize ;
			_label.htmlHeight = fontSize ;//+ (fontSize/10) ;
			
			
			
			
			var baliseSize:Number = _label.htmlHeight + fontSize/2	;	
			this.width = baliseSize;
			this.height = baliseSize;
			
			_label.x = this.htmlWidth/2 - (_label.htmlWidth ) /2;
			_label.y = this.htmlHeight/2 - _label.htmlHeight/2;
		
			
			
			
			Ki.texteChange(_label);
			Ki.baliseChange(this);
			
			
		}
		
		
	
		

	}
	
}
