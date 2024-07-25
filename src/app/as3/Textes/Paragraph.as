package  com.nao.Textes {
	
	import com.nao.Containers.Balise;
	import com.nao.Textes.Texte;
	import com.nao.Power.Ki;

	
	public class Paragraph extends Texte{
		
		private var _textIndent:uint = 0 ; //0
		private var _row:uint = 5;
		private var _numRow:int = 1 ;
		private var _texteWidthType:int = 0;
		private var _texteWidth:int = 100;
		
		

		public function Paragraph(x:Number = 0, y:Number = 0,width:Number = 100,row:uint = 5, color:uint = 0x000000, fontSize:uint = 14, fontFamily:String = "Open Sans", fontWeight:Boolean = false, fontStyle:String = "normal", fontVariant:Boolean = false,label:String = "Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue.Suspen disse dui purus, scele risque at, vulpu tate vitae, pretium mattis, nunc. Mauris eget neque at sem vene natis eleifend. Ut nonummy. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue.Suspen disse dui purus, scele risque at, vulpu tate vitae, pretium mattis, nunc. Mauris eget neque at sem vene natis eleifend. Ut nonummy. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue.Suspen disse dui purus, scele risque at, vulpu tate vitae, pretium mattis, nunc. Mauris eget neque at sem vene natis eleifend. Ut nonummy. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue.Suspen disse dui purus, scele risque at, vulpu tate vitae, pretium mattis, nunc. Mauris eget neque at sem vene natis eleifend. Ut nonummy. Lorem ipsum dolor sit amet, consec tetuer adipi scing elit. Maec enas port titor congue massa. Fusce posuere, magna sed pulv inar ultr icies, purus lectus males uada libero, sit amet comm odo magna eros quis urna.Nunc viverra imper diet enim. Fusce est. Vivamus a tel lus.Pellen tesque habitant morbi tris tique sene ctus et netus et male suada fames ac turpis ege stas. Proin pha retra non ummy pede. Mauris et orci.Aen ean nec lorem. In port titor. Donec lao reet nonu mmy augue.") {
			// constructor code
		_row = row;
		super(label,x,y,color,fontSize,fontFamily,fontWeight,fontStyle,fontVariant,width,40);
			super.htmlWidth = width;
			super.lineHeight = 18;
			super.htmlHeight = super.lineHeight * row + row; //(super.fontSize - super.lineHeight );//+ super.fontSize/2;
		
			super.codeHTML = <p>{label}</p>;
			
			Ki.paragraphChange(this);

		}

		public function longeur(width: uint) {
			super.htmlWidth = width;
			Ki.paragraphChange(this);
		}
		
		public function allWidth(balise:Balise) {
		 longeur(this.positionArray[1].htmlWidth - this.positionArray[1].paddingRight - this.positionArray[1].paddingLeft - this.positionArray[1].border.borderLeftWidth - this.positionArray[1].border.borderRightWidth);
		 Ki.paragraphChange(this);
		}
		
		public function allHeight(balise:Balise) {
			//row =  Math.floor(Math.abs((balise.htmlHeight - this.y + balise.y - this.marginBottom )) / (this.lineHeight + 1));
			this.row =  Math.floor(Math.abs((balise.htmlHeight -  this.y - balise.marginBottom )) / (this.lineHeight + 1));
		
			Ki.paragraphChange(this);
		}
		
		public function hitObjectX (balise:Balise) {
			longeur(this.positionArray[1].htmlWidth - this.positionArray[1].paddingRight - this.positionArray[1].paddingLeft - this.positionArray[1].border.borderLeftWidth - this.positionArray[1].border.borderRightWidth -(balise.htmlWidth));
			this.x = 0;
			Ki.paragraphChange(this);
		}
		
		public function hitObjectY (balise:Balise) {
			row =  Math.floor(Math.abs((  balise.y  - this.y - this.marginBottom  - balise.marginTop)) / (this.lineHeight + 1));
			Ki.paragraphChange(this);
		}
		
		
		
		//public override function set fontFamily(fontFamily: String) {

		//	super.fontFamily = fontFamily;
		//	//this.resize();
		//	Ki.paragraphChange(this);
		//}
		
		
		
		
		

		
		//--------------------	
		public function get textIndent(): uint {
			return _textIndent;
		}
		
		public function set textIndent(textIndent: uint) {

			_textIndent = textIndent;
		}
		
		//--------------------	
		public function get row(): uint {
			return _row;
		}
		
		public function set row(row: uint) {

			_row = row;
			this.htmlHeight = this.lineHeight * row + row; 
			Ki.paragraphChange(this);
		}
		
		
		
		public function get numRow(): uint {
			return _numRow;
		}
		
		public function set numRow(numRow: uint) {
			_numRow = numRow;
			Ki.paragraphChange(this);
		}
		
		public function get texteWidthType(): uint {
			return _texteWidthType;
		}
		
		public function set texteWidthType(texteWidthType: uint) {
			_texteWidthType = texteWidthType;
			Ki.paragraphChange(this);
		}
		
		public function get texteWidth(): uint {
			return _texteWidth;
		}
		
		public function set texteWidth(texteWidth: uint) {
			_texteWidth = texteWidth;
			Ki.paragraphChange(this);
		}
		
		
		
	}
	
	
	
}
