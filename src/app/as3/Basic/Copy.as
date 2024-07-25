package  com.nao.Basic{
	
	import com.nao.Basic.*;
	import com.nao.Pages.Page;
	import com.nao.Effects.*;
	import com.nao.Transform.Transforme;
	import com.nao.Containers.*;
	import com.nao.Components.*;
	import com.nao.Textes.*;
	import com.nao.Power.Ki;
	import com.nao.Images.*;
	import com.nao.Forms.*;
	import com.nao.Listes.SuperListe;
	import com.nao.Blocks.Menu;
	
	
	public class Copy {

		public function Copy() {
			// constructor code
		}
		
		public static function pageCopy(original:Page, copy:Page)
			{

			Copy.baliseCopy(original,copy,true,false,true,true);
	
				
			Ki.baliseChange(copy);

		}
		
		
		
		//Balise--------------------
		public static function baliseCopy(original:Balise, copy:Balise, sizeBol:Boolean = false, positionBol:Boolean = false, backgroundBol:Boolean = true,killSatBol:Boolean = false, paddingBol:Boolean = true, marginBol:Boolean = true, borderBol:Boolean = true, transformeBol:Boolean = true, visibilityBol:Boolean = true, dispositionBol:Boolean = true, copyChildrenBol:Boolean = false)
		{
			
			
			if(visibilityBol == true){
			
			copy.opacity = original.opacity;
			copy.display = original.display ;
			copy.visibility = original.visibility ;
			copy.visible = original.visible ;
			copy.alpha = original.alpha;
			//copy.zIndex = original.zIndex;
			}
			
			
			if(sizeBol == true){
				
			copy.column = original.column ;
			copy.htmlWidth = original.htmlWidth ;
			copy.htmlHeight = original.htmlHeight;
				
			copy.widthType = original.widthType;
			copy.heightType = original.heightType;
			
			copy.fixedWidth = original.fixedWidth;
			copy.fixedHeight = original.fixedHeight;
				
			copy.scale = original.scale
			copy.positionScale = original.positionScale;
			
			}
			
			if(paddingBol == true){
			copy.padding = original.padding ;
			copy.paddingRight = original.paddingRight
			copy.paddingLeft = original.paddingLeft;
			copy.paddingTop = original.paddingTop;
			copy.paddingBottom = original.paddingBottom
			}
		
			if(marginBol == true){
				copy.margin = original.margin;
				copy.marginRight = original.marginRight;
				copy.marginLeft = original.marginLeft;
				copy.marginTop = original.marginTop;
				copy.marginBottom = original.marginBottom;
			}
			
			if(positionBol == true){
				copy.x = original.x;
				copy.y = original.y;
				copy.gridPosition = original.gridPosition;
				copy.positionTypeX = original.positionTypeX
				copy.positionTypeY = original.positionTypeY 
				copy.fixedPositionX = original.fixedPositionX;
				copy.fixedPositionY = original.fixedPositionY;
				copy.positionArray = original.positionArray;
			}
			
		
			
			if(dispositionBol == true){
			copy.disposition = original.disposition;
			}
			
			if(backgroundBol == true){
				backgroundCopy(original.background,copy.background);
			}
			
			if(borderBol == true)
			{
				borderCopy(original.border,copy.border);
			}
			
			if(transformeBol == true)
			{
				transformeCopy(original.transforme,copy.transforme);
			}
			//------------ Les enfants --------------
			if( copyChildrenBol == true)
			{
				
			}
			
			if(killSatBol == true)
			{
				copy.satTab = [];
			}
			
			
			Ki.baliseChange(copy);
			
		}
		
		//---------------------------------Background--------------------------------------
		
		
		public static function backgroundCopy(original:Background, copy:Background, gradiantBol:Boolean = true,shadowBol:Boolean = true)
			{
			
			copy.backgroundAttachment = original.backgroundAttachment ;
			copy.backgroundPosition = original.backgroundPosition ;
			copy.backgroundSize = original.backgroundSize;
			copy.backgroundSizeCover = original.backgroundSizeCover;
			copy.backgroundColorTransparent = original.backgroundColorTransparent;
			copy.backgroundColor = original.backgroundColor;
			copy.backgroundImage = original.backgroundImage;
			copy.backgroundRepeat = original.backgroundRepeat;
			
			if(gradiantBol == true)
			{
				gradiantCopy(original.backgroundGradiant, copy.backgroundGradiant);
			}
			
			if(shadowBol == true)
			{
				shadowCopy(original.shadow, copy.shadow)
			}
		
			
			
		}
		
		
		//---------------------------------Border--------------------------------------
		
			public static function borderCopy(original:Border, copy:Border)
			{
			
			
			copy.borderStyle = original.borderStyle;
			
			copy.borderBottomColor = original.borderBottomColor;
			copy.borderBottomWidth = original.borderBottomWidth;
			copy.borderBottomLeftRadius = original.borderBottomLeftRadius;
			copy.borderBottomRightRadius = original.borderBottomRightRadius;
			copy.borderBottomStyle = original.borderBottomStyle;
				
			copy.borderTopColor = original.borderTopColor;
			copy.borderTopWidth = original.borderTopWidth;
			copy.borderTopLeftRadius = original.borderTopLeftRadius;
			copy.borderTopRightRadius = original.borderTopRightRadius;
			copy.borderTopStyle = original.borderTopStyle;
				
			copy.borderLeftColor = original.borderLeftColor;
			copy.borderLeftWidth = original.borderLeftWidth;
			copy.borderLeftStyle = original.borderLeftStyle;
				
			copy.borderRightColor = original.borderRightColor;
			copy.borderRightWidth = original.borderRightWidth;
			copy.borderRightStyle = original.borderRightStyle;
			
		}
		
	//---------------------------------Gradient-------------------------------------
		
		public static function gradiantCopy(original:Gradiant, copy:Gradiant)
		{
			
			copy.color1 = original.color1 ;
			copy.color2 = original.color2 ;
			copy.type = original.type;
			copy.to = original.to;
			copy.from = original.from;
			copy.colorStop1 = original.colorStop1;
			copy.colorStop2 = original.colorStop2;
			
		}
	//---------------------------------Shadow-------------------------------------	
	
		public static function shadowCopy(original:Shadow, copy:Shadow)
		{
			
			copy.hShadow = original.hShadow ;
			copy.vShadow = original.vShadow ;
			copy.blur = original.blur;
			copy.color = original.color;
			copy.shadowBol = original.shadowBol;
			
		}
		
		//---------------------------------Transforme-------------------------------------		
		
		public static function transformeCopy(original:Transforme, copy:Transforme)
			{
			
			copy.rotate = original.rotate ;
			copy.skew = original.skew ;
			
		}
		
		//---------------------------------Image-------------------------------------
		
		public static function imageCopy(original:ImageBalise, copy:Image,urlBol:Boolean = true,positionBol:Boolean = false, backgroundBol:Boolean = true,killSatBol:Boolean = false, paddingBol:Boolean = true, marginBol:Boolean = true, borderBol:Boolean = true, transformeBol:Boolean = true, visibilityBol:Boolean = true)
		{
			
			if(backgroundBol == true){
			baliseCopy(original, copy,urlBol,positionBol,backgroundBol,false,false);
			}

			if(urlBol == true){
			copy.url = original.url ;
			}
			
			Ki.baliseChange(copy);
			
		}
		
		

	//---------------------------------------------------------------------------------------------------------
	//------------------------------------------TEXTE----------------------------------------------------------
	//---------------------------------------------------------------------------------------------------------
		
	
		public static function texteCopy(original:Texte, copy:Texte,  labelBol:Boolean = false, positionBol:Boolean = false, sizeBol:Boolean = false, backgroundBol:Boolean = true, colorBol:Boolean = true, styleBol:Boolean = true )
			{
			

		
			baliseCopy(original, copy,sizeBol,positionBol,backgroundBol,false, styleBol,styleBol,styleBol,styleBol );
			
			
			if(colorBol == true){
			copy.color = original.color ;
			}
			
			if(styleBol == true){
			copy.letterSpacing = original.letterSpacing ;
			copy.lineHeight = original.lineHeight;
			copy.textTransform = original.textTransform;
			copy.whiteSpace = original.whiteSpace;
			copy.wordSpacing = original.wordSpacing ;
			copy.textDecoration = original.textDecoration ;
			copy.lineHeight = original.lineHeight;
			copy.textDecoration = original.textDecoration;
			copy.fontFamily = original.fontFamily;
			copy.fontSize = original.fontSize ;
			copy.fontStyle = original.fontStyle;
			copy.fontWeight = original.fontWeight;
			copy.fontVariant = original.fontVariant;
			}
			if(labelBol == true){
				
				if(copy as Bouton)
				{
					
					
				}else{
					copy.label = original.label;
				}
				
				
			}
			
			Ki.texteChange(copy);
			
		}
		
		
		public static function paragraphCopy(original:Paragraph, copy:Paragraph,  labelBol:Boolean = false, positionBol:Boolean = false, sizeBol:Boolean = false, backgroundBol:Boolean = true, colorBol:Boolean = true, styleBol:Boolean = true )
			{
			
			texteCopy(original, copy,  labelBol,positionBol,sizeBol,backgroundBol, colorBol, styleBol);
			copy.textIndent = original.textIndent;
			copy.textAlign = original.textAlign;
			copy.textAlignLast = original.textAlignLast ;
			copy.row = original.row;
			copy.numRow = original.numRow;
			copy.numRow = original.numRow;
			Ki.paragraphChange(copy);	
			
		}
		
		
		public static function iconeTexteCopy(original:IconeTexte, copy:IconeTexte,texteBol:Boolean = false,  sizeBol:Boolean = false, positionBol:Boolean = false, backgroundBol:Boolean = true, colorBol:Boolean = true, styleBol = true)
			{
			
		
			if(backgroundBol == true){	

				baliseCopy(original, copy,sizeBol,positionBol,backgroundBol,false, styleBol,styleBol,styleBol,styleBol );
			}
				
			if(texteBol == true){
				texteCopy(original.texte, copy.texte, texteBol,false,false, backgroundBol, colorBol, styleBol);
				texteCopy(original.icone, copy.icone,  texteBol,false,false, backgroundBol, colorBol, styleBol);

			}

			/*if(original.ornementVisible == true)
			{
				imageCopy(original.ornement, copy.ornement);
			}
			*/
			copy.positionIcone = original.positionIcone;
			copy.ornementVisible = original.ornementVisible;
			
			Ki.iconeTexteChange(copy);	
			
			
		}
		
		
		public static function iconeBaliseCopy(original:IconeBalise, copy:IconeBalise, texteBol:Boolean = false,  sizeBol:Boolean = false, positionBol:Boolean = false, backgroundBol:Boolean = true, colorBol:Boolean = true, styleBol = true)
			{
			
		
			baliseCopy(original, copy,sizeBol,positionBol,backgroundBol,false, styleBol,styleBol,styleBol,styleBol );

			if(texteBol == true){
				texteCopy(original.label, copy.label, texteBol,false,false, backgroundBol, colorBol, styleBol);
			}
			
			Ki.texteChange(copy.label);
			Ki.baliseChange(copy);	
			
			
		}
		
		//-----------------------------------------------------------------------------------------------------
	//------------------------------------------COMPONENT------------------------------------------------------
	//---------------------------------------------------------------------------------------------------------

		
		public static function boutonCopy(original:Bouton, copy:Bouton,  labelBol:Boolean = false, positionBol:Boolean = false, sizeBol:Boolean = false, backgroundBol:Boolean = true, colorBol:Boolean = true, styleBol:Boolean = true )
			{
	
				copy.disabled = copy.disabled; 
		
				

				texteCopy(original, copy,  labelBol,positionBol,sizeBol,backgroundBol, colorBol, styleBol);

				if(styleBol == true){
					copy.positionIcone = original.positionIcone;
					copy.fontIconFamilly = original.fontIconFamilly; 
					copy.iconColor = original.iconColor; 
					copy.iconMarginTop = original.iconMarginTop;
					copy.iconMarginBottom = original.iconMarginBottom; 
					copy.iconField = original.iconField; 
					copy.value = original.value;
					
					
				}
				
				if(sizeBol == true){
				
					copy.htmlHeight = original.htmlHeight;
					copy.htmlWidth = original.htmlWidth;
				}
			
			Ki.boutonChange(copy);
			
			}
		
		
		//-----------------------------------------------------------------------------------------------------
	//------------------------------------------Forms------------------------------------------------------
	//---------------------------------------------------------------------------------------------------------
		
		public static function inputTextCopy(original:InputText, copy:InputText,  valueBol:Boolean = true, positionBol:Boolean = false)
			{
			
			baliseCopy(original, copy,true,positionBol,true,false, false,true,true,true,true );
			

			if(valueBol == true)
			{
				copy.value = original.value;
			}
			
			Ki.baliseChange(copy);

		}
		
		public static function comboboxCopy(original:Combobox, copy:Combobox,  valueBol:Boolean = true, positionBol:Boolean = false)
			{
			
			baliseCopy(original, copy,true,positionBol,true,false, false,true,true,true,true );
			

			if(valueBol == true)
			{
				copy.value = original.value;
			}
			
			Ki.baliseChange(copy);
		}
		
		public static function inputCheckBoxCopy(original:InputCheckBox, copy:InputCheckBox,  valueBol:Boolean = false, positionBol:Boolean = false)
			{
			
			baliseCopy(original, copy,true,positionBol,true,false, false,true,true,true,true );
			

			if(valueBol == true)
			{
				copy.value = original.value;
				copy.checked = original.checked;
			}
			
			Ki.baliseChange(copy);
		}
		
		public static function inputRadioCopy(original:InputRadio, copy:InputRadio,  valueBol:Boolean = false, positionBol:Boolean = false)
			{
			
			baliseCopy(original, copy,true,positionBol,true,false, false,true,true,true,true );
			

			if(valueBol == true)
			{
				copy.value = original.value;
				copy.checked = original.checked;
			}
			
			Ki.baliseChange(copy);
		}
		
		
		public static function texteInputCopy(original:TexteInput, copy:TexteInput,  valueBol:Boolean = false, positionBol:Boolean = false)
			{

			baliseCopy(original, copy,true,positionBol,true,false, false,true,true,true,true );
			inputTextCopy(original.inputText, copy.inputText,  valueBol, positionBol);
			iconeTexteCopy(original.iconeTexte, copy.iconeTexte, valueBol,valueBol,positionBol, true, true, true);
			copy.position = original.position;
			copy.texteLabel = original.texteLabel;
			copy.inputValue = original.inputValue;
				
			Ki.texteInputChange(copy);
		}
		
		
		
		
		public static function selectInputCopy(original:SelectInput, copy:SelectInput,  valueBol:Boolean = false, positionBol:Boolean = false)
			{

			baliseCopy(original, copy,true,positionBol,true,false, false,true,true,true,true );
			comboboxCopy(original.combobox, copy.combobox,  valueBol, positionBol);
			iconeTexteCopy(original.iconeTexte, copy.iconeTexte, valueBol,valueBol,positionBol, true, true, true);
			copy.position = original.position;
				
			Ki.selectInputChange(copy);

		}
		
		
		

		//-----------------------------------------------------------------------------------------------------
	//-----------------------------------------SUperListe------------------------------------------------------
	//---------------------------------------------------------------------------------------------------------
		
		
		public static function superListeCopy(original:SuperListe, copy:SuperListe,sizeBol:Boolean = false,  backgroundBol:Boolean = true, positionBol:Boolean = false)
			{

			
			copy.vertical = original.vertical;
			copy.liWidth = original.liWidth;
			copy.liHeight = original.liHeight;
			copy.paddingHorizontal = original.paddingHorizontal;
			copy.paddingVertical = original.paddingVertical;
			
			
			
			//copy.emptyTab();
			copy.addTab(original);
			
			baliseCopy(original, copy,sizeBol,positionBol,backgroundBol,false, true,true,true,true,true );
			//copy.superListeTab = original.superListeTab;
		//	copy.listeVertivalContact();
			Ki.baliseChange(copy);
				
		

		}
			
	
			
			
			
			
			
			
			
			
			
			
			
			
			public static function ArrowSlideCopy(original:ArrowSlide, copy:ArrowSlide, labelBol:Boolean = false)
			{
			
		
			baliseCopy(original, copy,false,true,false,false);
			
			if(labelBol == true){
				iconeBaliseCopy(original.right,copy.right, true,false,true);
				iconeBaliseCopy(original.left,copy.left,true,false,true);
			}	
				
			
			Ki.texteChange(copy.right.label);
			Ki.texteChange(copy.left.label);
			Ki.baliseChange(copy.right);
			Ki.baliseChange(copy.left);
			Ki.baliseChange(copy);
		
			
			
		}
		
		
		
		
				//-----------------------------------------------------------------------------------------------------
	//------------------------------------------Réinitialisation------------------------------------------------------
	//--------------------------------------------Menu------------------------------------------------------
		
			

		
		
		
		
		
		}
	
}
