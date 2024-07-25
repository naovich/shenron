package com.nao.Power {

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.display.GradientType;
	import flash.html.HTMLLoader;
	import flash.geom.Point;
	
	import com.nao.Basic.*;
	import com.nao.Containers.* ;
	import com.nao.Textes.*;
	import com.nao.Components.* ;
	import com.nao.Effects.* ;
	import com.nao.Listes.*;
	import com.nao.Transform.*;
	import com.nao.Images.*;
	import com.nao.Modules.*;
	import com.nao.General.Selection;
	import com.nao.Blocks.*;
	import com.nao.Forms.*;
	
	
	
	


	public class Ki {

		public static var HTMLtab: Array;
		public static var style:String = "";
		public function Ki() {
			// constructor code
		}
		
	//----------------------------------------------------------------------PRIVATE FUNCTION------------------------------------------------	
	//--------------------------------------------------------------------------------------------------------------------------------------	

		private static function changeBalise(balise:Object)
		{
			
			style = "";
			if (balise.opacity != 1) {
				style += "opacity:" + balise.opacity.toString() + ";";
			}

			style += "x:" + balise.x.toString() + ";";
			style += "y:" + balise.y.toString() + ";";

			
			if(balise is Balise)
			{
				size(balise.htmlLoad)
				
			}else{
				size(balise);
			}
				
			
			function size(obj:Object)
			{
				
			
			
			if (balise.border.borderSame == false) {
				style += "width:" + (obj.width - balise.border.borderLeftWidth - balise.border.borderRightWidth - balise.background.shadow.hShadow).toString() + ";";
				style += "height:" + (obj.height - balise.border.borderTopWidth - balise.border.borderBottomWidth - balise.background.shadow.vShadow).toString() + ";";
			} else {
				style += "width:" + (obj.width - (balise.border.borderTopWidth * 2)).toString() + ";";
				style += "height:" + (obj.height - (balise.border.borderTopWidth * 2)).toString() + ";";
			}

			if (balise.visibility == false) {
				style += "visibility:none;";
			}
			
			}
			
		}
		
		private static function colorHexa(color:uint):String{
			
			var colorString:String;
			
			if( color > 0x0FFFFF){
					colorString = color.toString(16);
				
			}else if( color <= 0x0FFFFF && color > 0x00FFFF){
				colorString = "0" + color.toString(16);
					
			}else if (color <= 0x00FFFF && color > 0x000FFF ) {
				colorString = "00" + color.toString(16);
			}else if (color <= 0x000FFF && color > 0x0000FF) {
				colorString =  "000" + color.toString(16);
			}else if (color <= 0x0000FF && color > 0x00000F) {
				colorString =  "0000" + color.toString(16) ;
			}else if (color <= 0x00000F && color > 0x000000) {
				colorString =  "00000" + color.toString(16);
			}else if (color == 0) {
				colorString =  "000000";
			}
			
			return colorString;		
		}
		
		private static function changeBackground(obj:Object){
			
			if(obj.background.backgroundImage != "transparent") {
		
			
					if (obj.background.backgroundImage == "color") {
					
						style += "background-color:#" + colorHexa(obj.background.backgroundColor) + ";";
					

					} else if (obj.background.backgroundImage == "gradient") {
						
						//style += "background-image: -webkit-gradient(linear,center top, center bottom, from(#CC5896),to(#AAAC86));";
						style += "background-image: -webkit-gradient(" + obj.background.backgroundGradiant.type + "," + obj.background.backgroundGradiant.from + "," + obj.background.backgroundGradiant.to + ",from(#"+  colorHexa(obj.background.backgroundGradiant.color2) + "),color-stop(" + obj.background.backgroundGradiant.colorStop1.toString() + "%,#" +  colorHexa(obj.background.backgroundGradiant.color2) + "),to(#" +  colorHexa(obj.background.backgroundGradiant.color1) + "),color-stop(" + obj.background.backgroundGradiant.colorStop2.toString() + "%,#" +  colorHexa(obj.background.backgroundGradiant.color1) + "));";

					} else if (obj.background.backgroundImage == "default") {
							

					}else{
						
						style += "background-image:url(" + obj.background.backgroundImage + ");";
						var point:Point = new Point(0,0);
						if (obj.background.backgroundPosition.x != 0 && obj.background.backgroundPosition.y != 0) style += "background-position:" + obj.background.backgroundPosition.x.toString() + "px " + obj.background.backgroundPosition.y.toString() + "px " + ";";
						if (obj.background.backgroundRepeat != "repeat") style += "background-repeat:" + obj.background.backgroundRepeat + ";";
						if (obj.background.backgroundAttachment != "scroll") style += "background-attachment:" + obj.background.backgroundAttachment.toString() + ";";
						if (obj.background.backgroundSizeCover == "cover") style += "background-size:cover;";

					}
					
				}else{
					style += "background-color:transparent;" ;
					
				}
		}
		
		//------------------------------------------------------------------------------------------------------------------
		
		private static function changeBorder(obj:Border){
			
			

						var borderStyle: String = "";
						if (obj.borderSame == true) {
							
							borderStyle += "border-style:" + obj.borderTopStyle.toString() + ";";
						if (obj.borderTopWidth > 0) {

								borderStyle += "border-width:" + obj.borderTopWidth.toString() + ";";
								borderStyle += "border-color:#" + colorHexa(obj.borderTopColor) + ";";
						}

						if (obj.borderTopLeftRadius > 0) {
								borderStyle += "border-radius:" + obj.borderTopLeftRadius.toString() + ";";
							}


				} else {

					//--------------------------TOP-------------------------
					if (obj.borderTopWidth > 0) {
					borderStyle += "border-top-style:" + obj.borderTopStyle.toString() + ";";
					borderStyle += "border-top-width:" + obj.borderTopWidth.toString() + ";";
					borderStyle += "border-top-color:#" + colorHexa(obj.borderTopColor) + ";";
					}
					
					if (obj.borderTopLeftRadius > 0) {
						borderStyle += "border-top-left-radius:" + obj.borderTopLeftRadius.toString() + ";";
					}
					
					if (obj.borderTopRightRadius > 0) {
						borderStyle += "border-top-right-radius:" + obj.borderTopRightRadius.toString() + ";";
					}
					
					
					//--------------------------BOTTOM-------------------------
					if (obj.borderBottomWidth > 0) {
						borderStyle += "border-bottom-style:" + obj.borderBottomStyle.toString() + ";";
						borderStyle += "border-bottom-width:" + obj.borderBottomWidth.toString() + ";";
						borderStyle += "border-bottom-color:#" + colorHexa(obj.borderBottomColor) + ";";
					}
					if (obj.borderBottomLeftRadius > 0) {
						borderStyle += "border-bottom-left-radius:" + obj.borderBottomLeftRadius.toString() + ";";
				
					}
					if (obj.borderBottomRightRadius > 0) {
						borderStyle += "border-bottom-right-radius:" + obj.borderBottomRightRadius.toString() + ";";
				
					}

					
					//--------------------------LEFT-------------------------
					if (obj.borderLeftWidth > 0) {
						borderStyle += "border-left-style:" + obj.borderLeftStyle.toString() + ";";
						borderStyle += "border-left-width:" + obj.borderLeftWidth.toString() + ";";
						borderStyle += "border-left-color:#" + colorHexa(obj.borderLeftColor) + ";";
					}
					
					//--------------------------RIGHT-------------------------
					if (obj.borderRightWidth > 0) {
						borderStyle += "border-right-style:" + obj.borderRightStyle.toString() + ";";
						borderStyle += "border-right-width:" + obj.borderRightWidth.toString() + ";";
						borderStyle += "border-right-color:#" + colorHexa(obj.borderRightColor) + ";";
				
					}


				}

				style += borderStyle;
			
		}
		
		private static function changeTransforme(obj:Object){
			
			var trans:String = "-webkit-transform:";
			if (obj.transforme.rotate != 0) trans += "rotate(" + obj.transforme.rotate.toString() + "deg)";
			if (obj.transforme.skew.x != 0 || obj.transforme.skew.y != 0 ) trans += "skew(" + obj.transforme.skew.x.toString() + "deg," + obj.transforme.skew.y.toString() + "deg)";
			if ((obj.transforme.skew.x != 0 || obj.transforme.skew.y != 0) || obj.transforme.rotate != 0  ) style += trans +";";
			
		}
	
		
		private static function changeTexte(obj:Object){
			
			var textStyle: String = "";
			if (obj.color != 0x000000) textStyle += "color:#" + obj.color.toString(16) + ";";
			if (obj.letterSpacing != 0) textStyle += "letter-spacing:" + (obj.letterSpacing/10).toString() + "em " + ";";
			if (obj.whiteSpace != "normal") textStyle += "white-space:" + obj.whiteSpace.toString() + ";";
			if (obj.wordSpacing != 0) textStyle += "word-spacing: " + (obj.wordSpacing/10).toString() + "em " + ";";
			if (obj.textTransform != "none") textStyle += "text-transform:" + obj.textTransform.toString() + ";";
			if (obj.textDecoration != "none") textStyle += "text-decoration:" + obj.textDecoration.toString() + ";";
			if (obj.fontFamily != "none") textStyle += "font-family:" + obj.fontFamily.toString() + ";";
			if (obj.fontStyle != "normal") textStyle += "font-style:" + obj.fontStyle.toString() + ";";
			if (obj.fontWeight == true) textStyle += "font-weight:bold;";
			if (obj.fontVariant == true) textStyle += "font-variant:small-caps;";
			
			textStyle += "text-align:" + obj.textAlign.toString() + ";";
			textStyle += "text-align-last:" + obj.textAlignLast.toString() + ";";
			//if (obj.padding != 0) textStyle += "padding:" + obj.padding.toString() + "px;";
			if (obj.lineHeight != 18) style += "line-height:" + obj.lineHeight.toString() + "px;";

		

			textStyle += "font-size: " + obj.fontSize.toString() + ";";
			style += textStyle;
			
			/*if (obj.shadow.shadowBol == true) {
				var shadowStyle: String = "text-shadow: " + obj.shadow.hShadow + "px " + obj.shadow.vShadow + "px " + obj.shadow.blur + "px " + obj.shadow.color.toString(16) + ";";
				style += shadowStyle;
			}*/
		}
		
		
	//----------------------------------------------------------------------PUBLIC FUNCTION------------------------------------------------	
	//--------------------------------------------------------------------------------------------------------------------------------------	

		public static function baliseChange(balise: Balise): String {
			
			//if(balise.satTab.length != 0)
			//	{
			//	
			//	Position.dispositionChange(balise);
			//	
			//	//trace("ok");
			//	}
		
			//-------------------------------------------------Balise------------------------------------------ 
			changeBalise(balise);
			//-------------------------------------------------Background------------------------------------------ 

			if(balise.background.backgroundImage != "transparent") changeBackground(balise);
			
			//-------------------------------------------------Transforme------------------------------------------ 
			
			changeTransforme(balise);

			//-------------------------------------------------Bordure------------------------------------------ 
			if(balise.border.borderStyle != "none") changeBorder(balise.border);
		
			//-------------------------------------------------shadow------------------------------------------ 
			

			if (balise.background.shadow.shadowBol == true) {
				var shadowStyle: String = "-webkit-box-shadow:" + balise.background.shadow.hShadow + "px " + balise.background.shadow.vShadow + "px " + balise.background.shadow.blur + "px #" + colorHexa(balise.background.shadow.color) + ";";
				style += shadowStyle;
			}

			balise.codeHTML.@style = style;
			balise.htmlLoad.loadString(balise.codeHTML.toXMLString());
			
	
			return balise.codeHTML.toXMLString();
			
			
		

		/*	if(Selection.activeBaliseType == "ImageBalise")
			{
				Selection.sImageBalise.refreshImageInit();
			}*/
			
			

		}
		
		/*public static function radioChange(radio:Radio):String{
			
			baliseChange(radio);
		}*/
		
		public static function imageChange(img:ImageBalise){
			
			//baliseChange(img);
			img.refreshImageInit();
		
			
			
			
		}


		public static function texteChange(texte: Object): String {


			style = "";
			//-------------------------------------------------Balise------------------------------------------ 

			changeBalise(texte);

			//-------------------------------------------------TEXT ET ESPACE------------------------------------------ 

			changeTexte(texte);
			
			//-------------------------------------------------Bordure------------------------------------------ 
			if(texte.border.borderStyle != "none") changeBorder(texte.border);

			//-------------------------------------------------Background------------------------------------------ 
			//if(texte.background.backgroundImage != "transparent") 
			changeBackground(texte);

			texte.codeHTML.@style = style;
			texte.htmlLoad.loadString(texte.codeHTML.toXMLString());
			return texte.codeHTML.toXMLString();

		}

		public static function paragraphChange (paragraphe: Object):String {
			texteChange(paragraphe);
			if (paragraphe.textIndent != 0) style += "text-indent:" + paragraphe.textIndent.toString() + ";";
			/*style += "text-align:" + paragraphe.textAlign.toString() + ";";
			style += "text-align-last:" + paragraphe.textAlignLast.toString() + ";";*/
			//if (balise.lineHeight > 0) style += "line-height:" + balise.lineHeight.toString() + "px;";

			paragraphe.codeHTML.@style = style;
			//var st:String = paragraphe.codeHTML.toXMLString();
			paragraphe.htmlLoad.loadString(paragraphe.codeHTML.toXMLString());
			return paragraphe.codeHTML.toXMLString();
			
		
		}
		
		public static function boutonChange(bouton: Bouton):String{
			
			texteChange(bouton);
			//changeTexte(bouton);
			//style = "";
			//changeBalise(bouton);
		//	changeTexte(bouton);
			
			if(bouton.disabled == true) bouton.codeHTML.@disabled = true;
			if(bouton.type != "button") bouton.codeHTML.@type = bouton.type;

			bouton.htmlLoad.loadString(bouton.codeHTML.toXMLString());
			return bouton.codeHTML.toXMLString();
		}

		
		public static function liChange(balise: Li): String {
			style = "";
			changeBalise(balise);
			changeTexte(balise);
			
			
			//-------------------------------------------------Bordure------------------------------------------ 
			if(balise.border.borderStyle != "none") changeBorder(balise.border);

			//-------------------------------------------------Background------------------------------------------ 
			if(balise.background.backgroundImage != "transparent") changeBackground(balise);
			
			//-------------------------------------------------Balise------------------------------------------ 
			//texteChange(balise);
			//var padding:uint = (balise.height * 38)/100;
			//var padding:uint = 0;
			if (balise.textIndent != 0) style += "text-indent:" + balise.textIndent.toString() + ";";
			if (balise.textAlign != "justify" ) style += "text-align:" + balise.textAlign.toString() + ";";
			if (balise.textAlignLast != "start") style += "text-align-last:" + balise.textAlignLast.toString() + ";";
			//style += "padding-top:" + padding + "px;";
			style += "list-style-type: none;";
			balise.codeHTML.@style = style;
			balise.loadString(balise.codeHTML.toXMLString());
			return balise.codeHTML.toXMLString();
			
		

		}
		
	
		public static function balisePosition (balise:Balise){
				
			if(balise.visible == true)
			{
				
				Position.generalScale(balise);
			
				if(balise.satTab.length != 0)
				{
				
				//Position.dispositionChange(balise);
				
				baliseDisposition(balise);
				}
				Position.generalPosition(balise);
				Ki.baliseChange(balise);
			}
			
			
			//Repositionnement des enfants 
				if(balise.numChildren != 0)
				{
					
				for(var j:int=1;j<= balise.numChildren -1;j++){
					
					
					
					var sbC = balise.getChildAt(j) as Balise;
					
					try{
						if(sbC.visible == true)
						{
						
							balisePositionNoKi(sbC);
						}
					}catch(e:Error){
						
					}
					
					}
				}
				
				
				
				
		}
		
	
		public static function balisePositionNoKi (balise:Balise){
				
			if(balise.visible == true)
			{
				
				Position.generalScale(balise);
			
				if(balise.satTab.length != 0)
				{
			
				baliseDispositionNoKi(balise);
				}
				Position.generalPosition(balise);
				//Ki.baliseChange(balise);
				
				
				//Repositionnement des enfants 
				if(balise.numChildren != 0)
				{
					
				for(var j:int=1;j<= balise.numChildren -1;j++){
					
					var sbC = balise.getChildAt(j) as Balise;
					
					
					if(sbC.visible == true)
					{
					balisePositionNoKi(sbC);
				
					}
					
					
					}
				}
				
				//Repositionnement des suiveurs en cas de modification de la balise
				
				
				for(j=1;j<= balise.parent.numChildren -1;j++){
					
				var sbPC = balise.parent.getChildAt(j) as Balise;
					
					
				if(sbPC.positionArray[0] == balise || sbPC.positionArray[5] == balise)
				{
					
				balisePosition(sbPC);
				
					
				//trace(sbPC.name);

				}
					
					
			}
				
				
			}
				
		}
		
		
			public static function baliseDispositionNoKi (balise:Balise){
				
				if(balise.satTab.length != 0)
				{
				
				Position.dispositionChange(balise);
				var lastChild:uint = balise.satTab.length - 1;
				
				for(var i:uint = 0; i<=lastChild; i++){
				
					Position.generalPosition(balise.satTab[i]);
					
				}	
					
			
				}
				
				
				
				
	}
		
		public static function positionChangeXY(balise:Balise){
			//trace("fol:" + balise.followersTab.length);
			if( balise.visible == true)
			{
			Position.generalPosition(balise);
			Position.generalScale(balise);
			Selection.baliseBoxDraw(balise);

			if(balise.followersTab.length != 0)
				{
				
				var lastChild:uint = balise.followersTab.length - 1;
				
					for(var i:uint = 0; i<=lastChild; i++){
					
						//Position.generalPosition(balise.followersTab[i]);
						//trace(balise.followersTab[i].name);
						positionChangeXY(balise.followersTab[i]);
						
					}	
				}
				
				
			}
		}
		

		
		public static function positionChangeWH(balise:Balise){
			
		if( balise.visible == true)
			
			{
				Position.generalScale(balise);
				Selection.baliseBoxDraw(balise);

				if(balise.followersTab.length != 0)
				{
					if(balise.disposition < 0)
					{
						Position.generalScale(balise);
					}else{
						
						var lastChild:uint = balise.followersTab.length - 1;
						for(var i:uint = 0; i<=lastChild; i++){
						
							//Position.generalPosition(balise.followersTab[i]);
							positionChangeXY(balise.followersTab[i]);
						}	
							
						
					}
					
				
				}
				
				if(balise.childTab.length != 0)
				{
					var lastChildV:uint = balise.childTab.length - 1;
					for(var j:uint = 0; j<=lastChild; j++){
						
						if(balise.childTab[j] as Paragraph)
							{
								Position.texteScale(balise.childTab[j]);
							}
							
							
						}	
				}
				
			}
		
			
			
	}
		
		
		public static function changeActiveBalise(){
			
			
			if(Selection.activeBaliseType == "Service")
			{
					Ki.serviceChange(Selection.sService);

			}else if(Selection.activeBaliseType == "ImageBalise")
			{
				Selection.sImageBalise.refreshImageInit();
			}
			
		}
		
		
		public static function baliseDisposition (balise:Balise){
				
				if(balise.satTab.length != 0)
				{
				
				Position.dispositionChange(balise);
				var lastChild:uint = balise.satTab.length - 1;
				
				for(var i:uint = 0; i<=lastChild; i++){
					
				
					Position.generalPosition(balise.satTab[i]);
					
				}	
					
			
				}
				
				Ki.baliseChange(balise);
				
			
				
			
	}
				
		
		
		
		private static function textePosition (balise:Texte){
				
			if(balise.visible == true)
			{
				Position.generalPosition(balise);
				Ki.texteChange(balise);
			}
				
		}
		
		public static function paragraphPosition (balise:Paragraph){
				
			if(balise.visible == true)
			{
				Position.generalPosition(balise);
				Ki.paragraphChange(balise);
			}
				
		}
		
		private static function iconePosition (balise:Balise){
				
			if(balise.visible == true)
			{
				Position.generalPosition(balise);
				Ki.baliseChange(balise);
			}
				
		}
		
		private static function boutonPosition (balise:Bouton){
				
			if(balise.visible == true)
			{
				Position.generalPosition(balise);
				Ki.boutonChange(balise);
			}
				
		}
		
		private static function iconeTextePosition (balise:IconeTexte){
				
			if(balise.visible == true)
			{
				Position.generalPosition(balise);
				Ki.iconeTexteChange(balise);
			}
				
		
			}
			
		private static function texteInputPosition (balise:TexteInput){
			
		if(balise.visible == true)
		{
			Position.generalPosition(balise);
			Ki.texteInputChange(balise);
		}
			
	
		}
		
		private static function selectInputPosition (balise:SelectInput){
			
		if(balise.visible == true)
		{
			Position.generalPosition(balise);
			Ki.selectInputChange(balise);
		}
			
	
		}
		
		
		private static function contactPosition (balise:Contact){
			
		if(balise.visible == true)
		{
			Position.generalPosition(balise);
			Ki.contactChange(balise);
		}
			
	
		}
		
		private static function postPosition (balise:Post){
			
		if(balise.visible == true)
		{
			Position.generalPosition(balise);
			Ki.postChange(balise);
		}
			
	
		}
		//--------------------------------------------CHANGE------------------------------------
		
		
		
		//public static function htmlRender(balise:Balise){
		//	
		//	switch(balise){
		//		
		//		case "[object BlankModule]":
		//		balise = balise as BlankModule;
		//		blankModuleChange(balise);
		//		break;
		//		/*case "[object Service]":
		//		serviceChange(balise);
		//		break;
		//		case "[object Menu]":
		//		menuChange(balise);
		//		break;
		//		case "[object Post]":
		//		postChange(balise);
		//		break;
		//		case "[object Cover]":
		//		coverChange(balise);
		//		break;
		//		case "[object Balise]":
		//		baliseChange(balise);
		//		break;*/
		//		
		//	}
		//	
		//}
		
		
		
		
		public static function moduleChange(balise: Module) {
			
			baliseDisposition(balise);
			
			if(balise is ImageBalise){
				
				trace("ImageBalise Ki______________");
				imageChange(balise as ImageBalise);
			}
	
		}
		
		public static function blankModuleChange(balise: BlankModule) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			//balisePosition(balise.image);
			baliseDisposition(balise);
			
	
		}
		
		public static function newsletterChange(balise: NewsletterBlock) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			texteInputPosition(balise.newsletter);
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			//balise.resizeBalise();
		}
		
		public static function serviceChange(balise: Service) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			balisePosition(balise.image);
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			//balise.resizeBalise();
		}
		
		public static function buyChange(balise: Buy) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			balisePosition(balise.image);
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			
			iconeTextePosition(balise.price);
			
			iconeTextePosition(balise.addToCart);
			baliseDisposition(balise);
			
			Position.texteScale(balise.texte);
			
		}
		
		public static function menuChange(balise: Menu) {
			
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			iconePosition(balise.icone);
			balisePosition(balise.liste);
			
			balisePosition(balise.socialIcon);
			balisePosition(balise.login);
			balisePosition(balise.logo);
			//textePosition(balise.telephone);
			iconeTextePosition(balise.telephone);
			//textePosition(balise.adress);
			iconeTextePosition(balise.adress);
			baliseDisposition(balise);
		}
		
		public static function coverChange(balise: Cover) {
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			Ki.baliseChange(balise);
			
			iconePosition(balise.icone);
			//textePosition(balise.titre);
			iconeTextePosition(balise.titre);
		//	paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			
			Position.texteScale(balise.texte);
			//Position.texteScale(balise.titre.texte);
				paragraphPosition(balise.texte);
			baliseDisposition(balise);
		}
		
		public static function slideChange(balise: Slide) {
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			balisePosition(balise.arrowSlide);
			balisePosition(balise.superListe);
			
			
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			
					
		}
		
		public static function teamChange(balise: Team) {
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			balisePosition(balise.arrowSlide);
			balisePosition(balise.superListe);
			
			
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			baliseDisposition(balise);
			
			Position.texteScale(balise.texte);
			
					
		}
		
		public static function callToActionChange(balise: CallToAction) {
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			iconePosition(balise.icone);
			balisePosition(balise.liste);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			baliseDisposition(balise);
			
		}
		
		public static function postChange(balise: Post) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			
			balisePosition(balise.footer);
			balisePosition(balise.image);
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			iconeTextePosition(balise.author);
			iconeTextePosition(balise.datePost);
			iconeTextePosition(balise.comment);
			iconeTextePosition(balise.heart);
			paragraphPosition(balise.texte);
			boutonPosition(balise.bouton);
			
			
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			
		}
		
		
		public static function profilChange(balise:Profil){
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			
			balisePosition(balise.footer);
			balisePosition(balise.image);
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			
			paragraphPosition(balise.texte);
			paragraphPosition(balise.sousTitre);
			boutonPosition(balise.bouton);
			
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			Position.texteScale(balise.sousTitre);
			
		}
		
		
		public static function loginChange(balise: Login) {
			
			iconeTextePosition(balise.boutonRegister);
			iconeTextePosition(balise.boutonLogin);
			
			baliseDisposition(balise);
		//	Position.texteScale(balise.texte);
			
		}
		
		public static function contactChange(balise: Contact) {
			
			switch(balise.positionTexteInput){
				
				case 0:
				balise.firstname.position = 0;
				balise.lastname.position = 0;
				balise.email.position = 0;
				balise.subject.position = 0;
				balise.country.position = 0;
				balise.birthDate.position = 0;
				balise.city.position = 0;
				balise.location.position = 0;
				balise.phone.position = 0;
				positionTexte02();
				break;
				
				case 1:
				balise.firstname.position = 1;
				balise.lastname.position = 1;
				balise.email.position = 1;
				balise.subject.position = 1;
				balise.country.position = 1;
				balise.birthDate.position = 1;
				balise.city.position = 1;
				balise.location.position = 1;
				balise.phone.position = 1;
				
				
				positionTexte1();
				
				break;
				
				case 2:
				balise.firstname.position = 2;
				balise.lastname.position = 2;
				balise.email.position = 2;
				balise.subject.position = 2;
				balise.country.position = 2;
				balise.birthDate.position = 2;
				balise.city.position = 2;
				balise.location.position = 2;
				balise.phone.position = 2;
				positionTexte02();
				break;
				
				
			}
			
			
		function positionTexte1():void{
			
			var posExtremeX:uint = 0;
			for (var i:int = 0;i< balise.positionTab.length ; i++)
				{
						if(balise.positionTab[i].iconeTexte.htmlWidth	> posExtremeX && balise.positionTab[i].visible == true) {
							posExtremeX = balise.positionTab[i].iconeTexte.htmlWidth;
					}
				}
			balise.firstname.inputText.marginLeft =  posExtremeX - balise.firstname.iconeTexte.htmlWidth;
			balise.lastname.inputText.marginLeft =  posExtremeX - balise.lastname.iconeTexte.htmlWidth;
			balise.email.inputText.marginLeft =  posExtremeX - balise.email.iconeTexte.htmlWidth;
			balise.subject.inputText.marginLeft =  posExtremeX - balise.subject.iconeTexte.htmlWidth;
			balise.birthDate.inputText.marginLeft =  posExtremeX - balise.birthDate.iconeTexte.htmlWidth;
			balise.country.combobox.marginLeft =  posExtremeX - balise.country.combobox.htmlWidth;
			balise.city.inputText.marginLeft =  posExtremeX - balise.city.iconeTexte.htmlWidth;
			balise.location.inputText.marginLeft =  posExtremeX - balise.location.iconeTexte.htmlWidth;
			balise.message.inputText.inputWidth = balise.firstname.inputText.htmlWidth + posExtremeX;
				
			
			balise.firstname.inputText.y = 0;
			balise.lastname.inputText.y = 0;
			balise.email.inputText.y = 0;
			balise.subject.inputText.y = 0;
			balise.birthDate.inputText.y = 0;
			balise.country.combobox.y = 0;
			balise.city.inputText.y = 0;
			balise.location.inputText.y = 0;
			
		}
		
		function positionTexte02():void{
			
			balise.firstname.inputText.marginLeft = 5;
			balise.lastname.inputText.marginLeft =  5;
			balise.email.inputText.marginLeft =  5;
			balise.subject.inputText.marginLeft =  5;
			balise.message.inputText.marginLeft =  5;
			balise.birthDate.inputText.marginLeft = 5;
			balise.country.combobox.marginLeft =  5;
			balise.city.inputText.marginLeft =  5;
			balise.location.inputText.marginLeft =  5;
			balise.message.inputText.inputWidth = balise.firstname.inputText.inputWidth;
		}
	
			
			
			
			/*balise.departureDate.margin = 0;
			balise.arrivalDate.margin = 0;*/
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			iconePosition(balise.icone);
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			texteInputPosition(balise.firstname);
			texteInputPosition(balise.secondname);
			texteInputPosition(balise.lastname);
			texteInputPosition(balise.birthDate);
			texteInputPosition(balise.phone);
			
			paragraphPosition(balise.sousTitre);
			iconeTextePosition(balise.telephone);
			iconeTextePosition(balise.adress);
			balisePosition(balise.logo);
			balisePosition(balise.socialIcon);
			
			selectInputPosition(balise.country);
			texteInputPosition(balise.location);
			texteInputPosition(balise.email);
			texteInputPosition(balise.subject);
			texteInputPosition(balise.message);
			
			balisePosition(balise.map);
			
			texteInputPosition(balise.city);
			texteInputPosition(balise.departureDate);
			texteInputPosition(balise.arrivalDate);
			texteInputPosition(balise.maxPrice);
			texteInputPosition(balise.minPrice);
			selectInputPosition(balise.adult);
		    selectInputPosition(balise.children);
			selectInputPosition(balise.night);
			selectInputPosition(balise.property);
			
			selectInputPosition(balise.bedroom);
			selectInputPosition(balise.bathroom);
			boutonPosition(balise.bouton);
			selectInputPosition(balise.minSquareFootage);
			
			
			balise.resizeBalise();
			iconeTextePosition(balise.titre);
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			
	
			
			
			
			
			
		}
		
		public static function footerChange(balise: Footer) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			
			balisePosition(balise.compagny);
			balisePosition(balise.footer);
			balisePosition(balise.social);
			balisePosition(balise.getInTouch);
			balisePosition(balise.stayInTouch);
			balisePosition(balise.payment);
			//contactPosition(balise.form);
			postPosition(balise.aboutUs);
			
			//iconeTextePosition(balise.titre);
			//paragraphPosition(balise.texte);
			balisePosition(balise.liste);
			balisePosition(balise.socialIcon);
			balisePosition(balise.logo);
			iconeTextePosition(balise.telephone);
			iconeTextePosition(balise.adress);
			iconeTextePosition(balise.email);
			iconeTextePosition(balise.copyright);
		//	balise.resizeBaliseHeight();
			baliseDisposition(balise);
			//Position.texteScale(balise.texte);
			
			
		}
		
		
		public static function serviceBlockChange(balise: ServiceBlock) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			balisePosition(balise.image);
			
			
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
			balisePosition(balise.liste);
			balise.superListe.fixedHeight = balise.superListe.htmlHeight
		//	balise.superListe.
			balisePosition(balise.superListe);
		//	baliseDisposition(balise.superListe);
			boutonPosition(balise.bouton);
			//balise.resizeBaliseHeight();
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			
			
		}
		
		public static function sponsorsBlockChange(balise: SponsorsBlock) {
			
			
			balisePosition(balise.header);
			balisePosition(balise.mainModule);
			balisePosition(balise.footer);
			
			
			
			iconeTextePosition(balise.titre);
			paragraphPosition(balise.texte);
		
			balise.superListe.fixedHeight = balise.superListe.htmlHeight
			balisePosition(balise.superListe);
			boutonPosition(balise.bouton);
			//balise.resizeBaliseHeight();
			baliseDisposition(balise);
			Position.texteScale(balise.texte);
			
			
		}
		
		
		public static function iconeTexteChange(ic:IconeTexte){
			 
			 var htmHeight:Number;
			 ic.padding = 0;
			
			
		//	if(ic.texte.fontStyle == "italic") ic.texte.htmlWidth += 4;

				
			switch(ic.positionIcone)
			{
				case 0: 
				ic.icone.visible = false;
				
				Position.normalXYLeftCenter(ic.texte,ic);
				//ic.texte.x = 0;
				ic.htmlHeight = ic.texte.htmlHeight + ic.marginTop + ic.marginBottom;
				ic.htmlWidth =  ic.texte.htmlWidth + ic.paddingLeft + ic.paddingRight;
				break;
				
				case 1: 
				
				ic.icone.visible = true;
				ic.htmlWidth = ic.icone.htmlWidth + ic.texte.htmlWidth + ic.paddingLeft + ic.paddingRight + ic.icone.marginRight ;
				
				if(ic.icone.htmlHeight > ic.texte.htmlHeight)
				{
					ic.htmlHeight = ic.icone.htmlHeight + ic.marginTop + ic.marginBottom;
				}else{
					ic.htmlHeight = ic.texte.htmlHeight + ic.marginTop + ic.marginBottom;
				}
				
				Position.normalXYLeftCenter(ic.icone,ic);
				Position.normalYCenter(ic.texte,ic);
				
				Position.afterX(ic.texte,ic.icone);
				
				
				break;
				
				case 2:
				ic.icone.visible = true;
				if(ic.icone.htmlWidth > ic.texte.htmlWidth)
				{
					ic.htmlWidth = ic.icone.htmlWidth + ic.paddingLeft + ic.paddingRight ;
				}else{
					ic.htmlWidth = ic.texte.htmlWidth + ic.paddingLeft + ic.paddingRight ;
				}
				
				
				ic.htmlHeight = ic.icone.htmlHeight + ic.icone.marginBottom + ic.texte.htmlHeight + ic.paddingTop + ic.paddingBottom ;
				Position.normalXYCenterTop(ic.icone,ic);
				Position.normalXCenter(ic.texte,ic);
				Position.afterY(ic.texte,ic.icone);
			    
				break;
				
				case 3:
				ic.icone.visible = true;
				
				ic.htmlWidth = ic.icone.htmlWidth + ic.texte.htmlWidth + ic.paddingLeft + ic.paddingRight + ic.icone.marginRight ;
				if(ic.icone.htmlHeight > ic.texte.htmlHeight)
				{
					ic.htmlHeight = ic.icone.htmlHeight + ic.marginTop + ic.marginBottom;
				}else{
					ic.htmlHeight = ic.texte.htmlHeight + ic.marginTop + ic.marginBottom;
				}
			
				ic.htmlWidth = ic.icone.htmlWidth + ic.texte.htmlWidth + ic.paddingLeft + ic.paddingRight + ic.icone.marginRight ;
				Position.normalXYLeftCenter(ic.texte,ic);
				Position.normalYCenter(ic.icone,ic);
				Position.afterX(ic.icone,ic.texte);
				break;
				
				case 4:
				ic.icone.visible = true;
				if(ic.icone.htmlWidth > ic.texte.htmlWidth)
				{
					ic.htmlWidth = ic.icone.htmlWidth + ic.paddingLeft + ic.paddingRight ;
				}else{
					ic.htmlWidth = ic.texte.htmlWidth + ic.paddingLeft + ic.paddingRight ;
				}
		
				
				ic.htmlHeight = ic.icone.htmlHeight + ic.icone.marginTop + ic.texte.htmlHeight + ic.paddingTop + ic.paddingBottom ;
				Position.normalXYCenterTop(ic.texte,ic);
				Position.normalXCenter(ic.icone,ic);
				Position.afterY(ic.icone,ic.texte);
				
				break;
			
			}
			 ic.texte.resize();
			 ic.icone.resize();
			ic.resizeBalise();
			Ki.baliseChange(ic);	
			Ki.texteChange(ic.texte);
			Ki.texteChange(ic.icone);

		}
		
	//---------------------------------------------------------FORMS----------------------------------------------------------	
	//------------------------------------------------------------------------------------------------------------------------
		public static function texteInputChange(texteInput:TexteInput){
			 
			
			changeBalise(texteInput);
			// texteInput.iconeTexte.texte.resize();
			// texteInput.iconeTexte.icone.resize();
		
				
			switch(texteInput.position)
			{
				case 0: 
				texteInput.iconeTexte.visible = false;
				texteInput.htmlHeight = texteInput.inputText.htmlHeight;
				texteInput.htmlWidth =  texteInput.inputText.htmlWidth;
				texteInput.inputText.x = 0;
				texteInput.inputText.y = 0;
				texteInput.inputText.value = texteInput.iconeTexte.texte.label;
				break;
				
				case 1: 
				
				texteInput.iconeTexte.visible = true;
				texteInput.inputText.value = "";
				texteInput.iconeTexte.x = 0;
				texteInput.iconeTexte.y = 0;
				Position.afterX(texteInput.inputText,texteInput.iconeTexte.texte);
				texteInput.htmlHeight = texteInput.inputText.htmlHeight;
				texteInput.htmlWidth = texteInput.iconeTexte.htmlWidth + texteInput.inputText.htmlWidth + texteInput.paddingLeft + texteInput.paddingRight + texteInput.iconeTexte.icone.marginRight;
				break;
				
				case 2:
				texteInput.iconeTexte.visible = true;
				texteInput.inputText.value = "";
				texteInput.iconeTexte.x = 0;
				texteInput.iconeTexte.y = 0;
				texteInput.inputText.x = 5;
				Position.afterY(texteInput.inputText,texteInput.iconeTexte);

				break;
				
				case 3: 
				texteInput.iconeTexte.visible = true;
				texteInput.label = "";
				texteInput.label = "";
				
				texteInput.iconeTexte.x = 0;
				texteInput.iconeTexte.y = 0;
				Position.afterX(texteInput.inputText,texteInput.iconeTexte.texte);
				texteInput.htmlHeight = texteInput.inputText.htmlHeight;
				texteInput.htmlWidth = texteInput.iconeTexte.htmlWidth + texteInput.inputText.htmlWidth + texteInput.paddingLeft + texteInput.paddingRight + texteInput.iconeTexte.icone.marginRight;
				break;
				
				case 4: 
				texteInput.iconeTexte.visible = true;
				/*texteInput.label = "";
				texteInput.label = "";*/
				
				texteInput.inputText.x = 0;
				texteInput.inputText.y = 0;
				texteInput.iconeTexte.x = texteInput.inputText.htmlWidth - texteInput.iconeTexte.htmlWidth + 4;
				texteInput.iconeTexte.y = texteInput.inputText.y + 2 ;
				texteInput.htmlWidth -= 20;
				
				texteInput.htmlHeight = texteInput.inputText.htmlHeight;
				texteInput.htmlWidth = texteInput.iconeTexte.htmlWidth + texteInput.inputText.htmlWidth + texteInput.paddingLeft + texteInput.paddingRight + texteInput.iconeTexte.icone.marginRight;;
				//texteInput.padding =0;
			
			
				
				break;
				
			}
	
		
		
		texteInput.iconeTexte.padding =2;
		texteInput.resizeBalise();
		Ki.iconeTexteChange(texteInput.iconeTexte);
		Ki.baliseChange(texteInput.inputText);
		
			
			

		}
		
		
		public static function selectInputChange(selectInput:SelectInput){
			 
			// var htmHeight:Number;
			 selectInput.iconeTexte.texte.resize();
			 selectInput.iconeTexte.icone.resize();
				selectInput.margin = 0;
			

				
			switch(selectInput.position)
			{
				case 0: 
				selectInput.iconeTexte.visible = false;
				selectInput.htmlHeight = selectInput.combobox.htmlHeight;
				selectInput.htmlWidth =  selectInput.combobox.htmlWidth;
				selectInput.combobox.x = 0;
				selectInput.combobox.y = 0;
				selectInput.combobox.value = selectInput.iconeTexte.texte.label;
				break;
				
				case 1: 
				
				selectInput.iconeTexte.visible = true;
				selectInput.iconeTexte.texte.visible = true;
				selectInput.combobox.value = "";
				selectInput.iconeTexte.x = 0;
				selectInput.iconeTexte.y = 0;
				Position.afterX(selectInput.combobox,selectInput.iconeTexte.texte);
				selectInput.htmlHeight = selectInput.combobox.htmlHeight;
				selectInput.htmlWidth = selectInput.iconeTexte.htmlWidth + selectInput.combobox.htmlWidth + selectInput.paddingLeft + selectInput.paddingRight + selectInput.iconeTexte.icone.marginRight;
				break;
				
				case 2:
				selectInput.iconeTexte.visible = true;
				selectInput.iconeTexte.texte.visible = true;
				selectInput.iconeTexte.x = 0;
				selectInput.iconeTexte.y = 0;
				selectInput.combobox.x = 5;
				Position.afterY(selectInput.combobox,selectInput.iconeTexte);

				break;
				
				/*case 3:
				selectInput.iconeTexte.visible = true;
				selectInput.iconeTexte.texte.visible = true;
				selectInput.combobox.value = "";
				selectInput.iconeTexte.x = 0;
				selectInput.iconeTexte.y = 0;
				Position.afterX(selectInput.combobox,selectInput.iconeTexte.texte);
				selectInput.htmlHeight = selectInput.combobox.htmlHeight;
				selectInput.htmlWidth = selectInput.iconeTexte.htmlWidth + selectInput.combobox.htmlWidth + selectInput.paddingLeft + selectInput.paddingRight + selectInput.iconeTexte.icone.marginRight;
				break;*/
				
				
			}
		
		selectInput.resizeBalise();
			
		Ki.iconeTexteChange(selectInput.iconeTexte);
		Ki.baliseChange(selectInput.combobox);
		Ki.baliseChange(selectInput);

		}
		
	
		
		
	//----------------------------------------------------------------------EQUALIZER------------------------------------------------	
	//--------------------------------------------------------------------------------------------------------------------------------------
		
	public static function equalize(obj:Balise,original:Balise)
	{
			
		obj.x = original.x;
		obj.y = original.y ;
		obj.display = original.display ;
		obj.visibility = original.visibility;
		obj.zIndex = original.zIndex ;
		obj.htmlLoad.width = original.htmlLoad.width ;
		obj.htmlLoad.height = original.htmlLoad.height ;
		obj.codeHTML = original.codeHTML ;
		obj.background = original.background;
		obj.border = original.border;
		obj.transforme = original.transforme;
		obj.padding = original.padding;
		obj.paddingRight = original.paddingRight;
		obj.paddingRight = original.paddingRight;
		obj.paddingLeft = original.paddingLeft;
		obj.paddingBottom = original.paddingBottom;
		
		obj.scale = original.scale;
		
		obj.positionTypeX = original.positionTypeX;
		obj.positionTypeY = original.positionTypeY;
		obj.fixedPositionX = original.fixedPositionX;
		obj.fixedPositionY = original.fixedPositionY;
		obj.widthType = original.widthType;
		obj.heightType = original.heightType ;
		
		obj.fixedWidth = original.fixedWidth; 
		obj.fixedHeight = original.fixedHeight;
		
		obj.positionScale = original.positionScale;
		obj.positionArray = original.positionArray;
		obj.disposition = original.disposition;
	
			
	}
	
		public static function equalizeListe(obj:Liste,original:Liste)
	{
			
		equalize(obj,original);
		
		obj.tabLi = original.tabLi;
		obj.vertical = original.vertical;
		obj.marginRightLi = original.marginRightLi;
		obj.marginLeftLi = original.marginLeftLi;
		obj.marginTopLi = original.marginTopLi;
		obj.marginBottomLi = original.marginBottomLi;
		obj.liWidth = original.liWidth;
		obj.liHeight = original.liHeight;
		
		obj.textDecoration = original.textDecoration;
		obj.fontFamily = original.fontFamily;
		obj.fontSize = original.fontSize;
		obj.fontStyle = original.fontStyle;
		obj.fontWeight = original.fontWeight;
		obj.fontVariant = original.fontVariant;
		obj.letterSpacing = original.letterSpacing;
	
		
	}
	
	public static function equalizeSuperListe(obj:SuperListe,original:SuperListe)
	{
			
		equalize(obj,original);
		
		obj.superListeTab = original.superListeTab;
		obj.vertical = original.vertical;
		//obj.shadow = original.shadow;
		obj.liWidth = original.liWidth;
		obj.liHeight = original.liHeight;
		obj.rowLimit = original.rowLimit;
	
		
	}
	

	
	public static function equalizeMain(obj:Balise,original:Balise)
	{
			
		//obj.x = original.x;
		//obj.y = original.y ;
		obj.display = original.display ;
		obj.visibility = original.visibility;
		obj.zIndex = original.zIndex ;
		obj.htmlLoad.width = original.htmlLoad.width ;
		obj.htmlLoad.height = original.htmlLoad.height ;
		obj.codeHTML = original.codeHTML ;
		obj.background = original.background;
		obj.border = original.border;
		obj.transforme = original.transforme;
		obj.padding = original.padding;
		obj.paddingRight = original.paddingRight;
		obj.paddingRight = original.paddingRight;
		obj.paddingLeft = original.paddingLeft;
		obj.paddingBottom = original.paddingBottom;
		
		obj.scale = original.scale;
		obj.positionScale = original.positionScale;
		obj.positionArray = original.positionArray;
		
			
	}
	
	
		public static function equalizeNoSize(obj:Balise,original:Balise)
	{
			
		/*obj.x = original.x;
		obj.y = original.y ;*/
		obj.display = original.display ;
		obj.visibility = original.visibility;
		obj.zIndex = original.zIndex ;
		/*obj.htmlLoad.width = original.htmlLoad.width ;
		obj.htmlLoad.height = original.htmlLoad.height ;*/
		obj.codeHTML = original.codeHTML ;
		obj.background = original.background;
		obj.border = original.border;
		obj.transforme = original.transforme;
		obj.padding = original.padding;
		obj.paddingRight = original.paddingRight;
		obj.paddingRight = original.paddingRight;
		obj.paddingLeft = original.paddingLeft;
		obj.paddingBottom = original.paddingBottom;
		
		obj.scale = original.scale;
		obj.positionScale = original.positionScale;
		obj.positionArray = original.positionArray;
	
		
		
			
	}
	
	
	public static function equalizeContact(obj:Contact,original:Contact)
	{
			
		/*obj.x = original.x;
		obj.y = original.y ;*/
	//	obj.display = original.display ;
	//	obj.visibility = original.visibility;
	//	obj.zIndex = original.zIndex ;
	//	/*obj.htmlLoad.width = original.htmlLoad.width ;
	//	obj.htmlLoad.height = original.htmlLoad.height ;*/
	//	obj.codeHTML = original.codeHTML ;
	//	obj.background = original.background;
	//	obj.border = original.border;
	//	obj.transforme = original.transforme;
	//	obj.padding = original.padding;
	//	obj.paddingRight = original.paddingRight;
	//	obj.paddingRight = original.paddingRight;
	//	obj.paddingLeft = original.paddingLeft;
	//	obj.paddingBottom = original.paddingBottom;
	//	
	//	obj.scale = original.scale;
	//	obj.positionScale = original.positionScale;
	//	obj.positionArray = original.positionArray;
	//

	//	
	//	
	//	obj.mainModule = original.mainModule;
	//	obj.header = original.header;
	//	obj.footer = original.footer;
	//	//obj.icone = original.icone:
	//	obj.titre = original.titre;
	//	obj.sousTitre = original.sousTitre;
	//	obj.texte = original.texte;
	//	
	//	obj.telephone = original.telephone;
	//	obj.adress = original.adress;
	//	obj.logo = original.logo;
	//	obj.map = original.map;
	//	obj.socialIcon = original.socialIcon;
	//	
		obj.firstname = original.firstname;
		obj.secondname = original.secondname;
		obj.lastname = original.lastname;
		/*obj.birthDate = original.birthDate;
		obj.country = original.country;
		obj.city = original.city;
		obj.location = original.location;
		obj.email = original.email;
		obj.subject = original.subject;
		obj.phone = original.phone;*/
		obj.message = original.message;
		obj.bouton = original.bouton ;
		
	/*	obj.departureDate = original.departureDate; 

		obj.arrivalDate = original.arrivalDate; 
		obj.maxPrice = original.maxPrice; 
		obj.minPrice = original.minPrice; 
		obj.adult = original.adult; 
		obj.children = original.children; 
		obj.night = original.night; 
		
		obj.property = original.property;  
		obj.bedroom = original.bedroom; 
		obj.bathroom = original.bathroom; 
		obj.minSquareFootage = original.minSquareFootage;  
		
		
		
		obj.positionTexteInput = original.positionTexteInput;
		obj.positionTab = original.positionTab;
		obj.formType = original.formType;*/
			
	}
	

	}

}