package com.nao.General {
	import flash.events.Event;
	import com.nao.Containers.Balise;
	import com.nao.Containers.Div;
	import com.nao.Pages.Page;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	//import flash.display.DisplayObject;
	import com.nao.Power.Ki;
	import com.nao.Pages.Grid;
	import com.nao.Modules.Module;
	import com.nao.Modules.Service;
	import flash.geom.Point;
	import fl.data.DataProvider;
	import com.nao.Modules.BlankModule;
	import com.nao.General.Project;
	import com.nao.General.Website;
	import com.nao.Modules.Profil;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.net.ServerSocket;
	import com.nao.Textes.Texte;
	import com.nao.Textes.Paragraph;
	import com.nao.Basic.Position;
	import com.nao.Images.Icone;
	import com.nao.Images.IconeBalise;
	import com.nao.Textes.IconeTexte;
	import com.nao.Images.ImageBalise;
	
	public class Selection {
		
		
		public static var sProject:Project;
		public static var sWebsite:Website;
		public static var sBalise:Balise;
		public static var sTexte:Texte;
		public static var sParagraph:Paragraph;
		public static var sIconeBalise:IconeBalise;
		public static var sIconeTexte:IconeTexte;
		public static var sImageBalise:ImageBalise;
		
		
		
		public static var sRender:Balise;
		public static var sDiv:Div;
		public static var sModule:Module;
		public static var sService:Service;
		public static var sProfil:Profil;
		public static var sMaster:Balise;
		public static var sSuiviL:Balise;
		public static var sSuiviH:Balise;
		
		public static var creationDiv:Div = new Div(0,0,100,100);
		public static var sPage:Page;
		public static var sGrid:Grid;
		public static var sContainerBox:Sprite = new Sprite();
		public static var activeBaliseType:String = "Aucune";
		public static var moduleIsSelected:Boolean = false;
		public static var reference:String = "null";




		public function Selection() {
			// constructor code
		}
		
//------------------------------------------------------------------Balise-----------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
		
		
		public static function selectBalise(e:Event,balise_mc:MovieClip){
			
			
			
	
			balise_mc.texte_mc.visible = false;
			balise_mc.iconeBalise_mc.visible = false;
			balise_mc.iconeTexte_mc.visible = false;
			balise_mc.image_mc.visible = false;
			
			trace("e.currentTarget:" + e.currentTarget);
			/*trace("e.currentTarget.parent:" + e.currentTarget.parent);
			trace(e.currentTarget.htmlWidth);
			trace(e.currentTarget.htmlHeight);*/
			baliseBoxDraw(e.currentTarget as Balise);
			//trace("Selection de Balise");
			if (e.currentTarget == '[object Page]'){
				moduleIsSelected = false;
				activeBaliseType = "Page";
			}else if(e.currentTarget == '[object Balise]'){
				

				sBalise  = e.currentTarget as Balise;
				activeBaliseType = "Balise";
				//baliseSelect(sBalise,balise_mc);
				moduleSelect(sBalise,balise_mc);
				trace( "if balise selected");
				
				
			}else if (e.currentTarget == '[object Div]'){
				
				sBalise = e.currentTarget as Balise;
				sDiv = e.currentTarget as Div;
				activeBaliseType = "Div";
				moduleIsSelected = false;
				baliseSelect(sDiv,balise_mc);
			}else if (e.currentTarget == '[object Service]' ){
				
				trace("Selection de Service");
				
				sBalise = e.currentTarget as Balise;
				sBalise.baliseType = "Service";
				sDiv = e.currentTarget as Div;
				sDiv.baliseType = "Service";
		
				sModule = e.currentTarget as Module;
				sModule.baliseType = "Module";
				
				sService = e.currentTarget as Service;
				sService.baliseType = "Service";
				activeBaliseType = "Service";
				serviceSelect(sService,balise_mc);
				//$$$
				
				Ki.serviceChange(sService);
			}else if (e.currentTarget == '[object BlankModule]' ){
				activeBaliseType = "BlankModule";

				sBalise = e.currentTarget as Balise;
				sDiv = e.currentTarget as Div;
				sModule = e.currentTarget as Module;
				moduleSelect(sModule,balise_mc);
			}else if (e.currentTarget == '[object ImageBalise]' ){
				
				
				balise_mc.image_mc.visible = true;
				//activeBaliseType = "ImageBalise";

				if(e.currentTarget.name != "bg"){
					sBalise = e.currentTarget as Balise;
					activeBaliseType = "ImageBalise";
				}else{
					sBalise = e.currentTarget.parent as Balise;
					activeBaliseType = "Balise";
				}
				
				sImageBalise = e.currentTarget as ImageBalise;
				//sDiv = e.currentTarget as Div;
				//sModule = e.currentTarget as Module;
				//moduleSelect(sModule,balise_mc);
				
				moduleSelect(sBalise,balise_mc);
				sImageBalise.refreshImageInit();
				
				imageSelect(sImageBalise,balise_mc);
				
			}else if (e.currentTarget == '[object Profil]' ){
				activeBaliseType = "Profil";

				sBalise = e.currentTarget as Balise;
				sDiv = e.currentTarget as Div;
				//sService = e.currentTarget as Service;
				sModule = e.currentTarget as Module;
				moduleSelect(sModule,balise_mc);
				sService = sModule as Service;
				sProfil = sModule as Profil;
					activeBaliseType = "Profil";
				//sService.service2(sGrid,sService.column,sService.debutCol,sService.htmlHeight,sService.y,sService.x,sService.htmlWidth);
				Ki.profilChange(sProfil);
			}else if (e.currentTarget == '[object OngletLatMC]' ){
				
			trace(e.currentTarget.tabNum);
			}else if(e.currentTarget == '[object IconeTexte]'){
				
				
				sBalise  = e.currentTarget.texte as Balise;
				activeBaliseType = "IconeTexte";
				
				sIconeTexte = e.currentTarget as IconeTexte;
				sTexte = sIconeTexte.texte;
				iconeTexteSelect(sIconeTexte,balise_mc);
				
				
				
			}else if(e.currentTarget == '[object IconeBalise]'){
				balise_mc.iconeBalise_mc.visible = true;
				balise_mc.iconeBalise_mc.x = balise_mc.texte_mc.x +30;
				
				trace("Selection de IconeBalise");
				sBalise  = e.currentTarget as Balise;
				sIconeBalise = e.currentTarget as IconeBalise;
				activeBaliseType = "IconeBalise";
				baliseSelect(sBalise,balise_mc);
				iconeBaliseSelect(sIconeBalise,balise_mc);
				
			}else if(e.currentTarget == '[object Paragraph]'){
				
				balise_mc.texte_mc.visible = true;
				trace("Selection de Paragraph");
				sBalise  = e.currentTarget as Balise;
				sTexte = e.currentTarget as Texte;
				sParagraph = e.currentTarget as Paragraph;
				activeBaliseType = "Paragraph";
				baliseSelect(sBalise,balise_mc);
				Ki.paragraphPosition(sParagraph);
				Position.texteScale(sParagraph);
				texteSelect(sTexte,balise_mc);
			    paragraphSelect(sParagraph,balise_mc);
			}
				

				
	}
		

	
			
public static function baliseSelect(sb:Balise,balise_mc:MovieClip)
{
	//sb = balise;
	initialisationBalise(sb,balise_mc);
	initialisationBackground(sb,balise_mc);
	initialisationBorder(sb,balise_mc);
	initialisationBorderColor(sb,balise_mc); 
	initialisationRadius(sb,balise_mc);
	initialisationBorderStyle(sb,balise_mc);
	initialisationEffectsMargins(sb,balise_mc);
	Ki.baliseChange(sb);
	//baliseBoxDraw(sb);
	
	trace("BaliseSelect");
	

}
//$$$
public static function serviceSelect(sb:Service,balise_mc:MovieClip){
	moduleSelect(sb,balise_mc);
	initialisationService(sb,balise_mc);
}

public static function moduleSelect(sb:Balise,balise_mc:MovieClip)
{
	//sb = balise;

	initialisationModule(sb,balise_mc);
	initialisationBalise(sb,balise_mc);
	initialisationBackground(sb,balise_mc);
	initialisationBorder(sb,balise_mc);
	initialisationBorderColor(sb,balise_mc); 
	initialisationRadius(sb,balise_mc);
	initialisationBorderStyle(sb,balise_mc);
	initialisationEffectsMargins(sb,balise_mc);
	moduleIsSelected = true;
	baliseBoxDraw(sb);

}


public static function iconeSelect(ic:Icone,balise_mc:MovieClip){
	
	balise_mc.iconeTexte_mc.fontSize_ns.value = ic.fontSize;
	balise_mc.iconeTexte_mc.fontColor_cp.selectedColor = ic.color;
	balise_mc.iconeTexte_mc.label_txt.text = ic.label;
	
	
		
	
	
}


public static function imageSelect(ib:ImageBalise ,balise_mc:MovieClip){
	
	balise_mc.image_mc.imageScaleX_ns.value = ib.loader.content.scaleX * 100;
	balise_mc.image_mc.imageScaleY_ns.value = ib.loader.content.scaleY * 100;
	
	balise_mc.image_mc.x_ns.value = ib.loader.content.x;
	balise_mc.image_mc.y_ns.value = ib.loader.content.y;
	
	balise_mc.image_mc.opacity_ns.value = ib.loader.content.alpha * 100;

	
	
	ib.refreshImageInit();
	
	balise_mc.image_mc.x_ns.minimum = -(ib.width - ib.htmlWidth) + ib.border.borderLeftWidth;
	balise_mc.image_mc.x_ns.maximum = ib.border.borderLeftWidth;
				

	balise_mc.image_mc.y_ns.minimum = -(ib.height - sImageBalise.htmlHeight) + ib.border.borderTopWidth;
	balise_mc.image_mc.y_ns.maximum = ib.border.borderTopWidth;
	
	

	
}



public static function iconeTexteSelect(it:IconeTexte,balise_mc){
	
	balise_mc.texte_mc.visible = true;
	balise_mc.iconeTexte_mc.visible = true;
				
	texteSelect(it.texte,balise_mc);			
	iconeSelect(it.icone,balise_mc);
	baliseSelect(it,balise_mc);
	
	//------------------------------- Icone position-----------------------
	switch(it.positionIcone){
		
		case 0:
		balise_mc.iconeTexte_mc.iconePosition_cb.selectedIndex = 0;
		break;
		
		case 1:
		balise_mc.iconeTexte_mc.iconePosition_cb.selectedIndex = 1;
		break;
		
		case 2:
		balise_mc.iconeTexte_mc.iconePosition_cb.selectedIndex = 2;
		break;
		
		case 3:
		balise_mc.iconeTexte_mc.iconePosition_cb.selectedIndex = 3;
		break;
		
		case 4:
		balise_mc.iconeTexte_mc.iconePosition_cb.selectedIndex = 4;
		break;
		
		
	}
	
	trace("it.positionIcone:" +it.positionIcone);
}
			
public static function texteSelect(tx:Texte,balise_mc:MovieClip){
	
		balise_mc.texte_mc.fontSize_ns.value = tx.fontSize;
		balise_mc.texte_mc.fontColor_cp.selectedColor = tx.color;
		balise_mc.texte_mc.label_txt.text = tx.label;
		balise_mc.texte_mc.letterSpacing_ns.value = tx.letterSpacing;
		balise_mc.texte_mc.wordSpacing_ns.value = tx.wordSpacing;
		balise_mc.texte_mc.lineHeight_ns.value = tx.lineHeight;
	
	
	//------------------------------- Texte Font-----------------------
	switch(tx.fontFamily){
		
		case "Open Sans":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 0;
		trace("exec Open sans");
		break;
		
		case "Roboto":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 1;
		break;
		
		case "Lato":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 2;
		break;
		
		case "Patua One":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 3;
		trace("exec Patua one");
		break;
		
		case "Roboto Slab":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 4;
		break;
		
		case "Domine":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 5;
		break;
		
		case "Lobster":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 6;
		trace("exec Lobster");
		break;
		
		case "Oleo Script":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 7;
		break;
		
		case "Dancing Script":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 8;
		break;
		case "FontAwesome":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 9;
		break;
		
	}
	
	
	
		//------------------------------- Texte Style-----------------------
	
	if(tx.fontStyle == "normal" && tx.fontWeight == false){
		
			balise_mc.texte_mc.fontStyle_cb.selectedIndex = 0;	
		
	}else if (tx.fontStyle == "normal" && tx.fontWeight == true){
			balise_mc.texte_mc.fontStyle_cb.selectedIndex = 1;	
		
	}else if (tx.fontStyle == "italic" && tx.fontWeight == false){
			balise_mc.texte_mc.fontStyle_cb.selectedIndex = 2;	
		
	}else if (tx.fontStyle == "italic" && tx.fontWeight == true){
			balise_mc.texte_mc.fontStyle_cb.selectedIndex = 3;	
		
	}
	
	
	
		//------------------------------- Texte transform-----------------------
	switch(tx.textTransform){
		
		case "none":
		balise_mc.texte_mc.textTransform_cb.selectedIndex = 0;
		break;
		
		case "capitalize":
		balise_mc.texte_mc.textTransform_cb.selectedIndex = 1;
		break;
		
		case "uppercase":
		balise_mc.texte_mc.textTransform_cb.selectedIndex = 2;
		break;
		
		case "lowercase":
		balise_mc.texte_mc.textTransform_cb.selectedIndex = 3;
		break;
		
		
	}
	
	
	
		//------------------------------- Texte Alignt-----------------------
	switch(tx.textAlign){
		
		case "justify":
		balise_mc.texte_mc.textAlign_cb.selectedIndex = 0;
		break;
		
		case "center":
		balise_mc.texte_mc.textAlign_cb.selectedIndex = 1;
		break;
		
		case "left":
		balise_mc.texte_mc.textAlign_cb.selectedIndex = 2;
		break;
		
		case "right":
		balise_mc.texte_mc.textAlign_cb.selectedIndex = 3;
		break;
		
		
	}
	
	
	//------------------------------- Texte decoration-----------------------
	switch(tx.textDecoration){
		
		case "none":
		balise_mc.texte_mc.textDecoration_cb.selectedIndex = 0; 
		break;
		
		case "underline":
		balise_mc.texte_mc.textDecoration_cb.selectedIndex= 1;
		break;
		
		case "overline":
		balise_mc.texte_mc.textDecoration_cb.selectedIndex = 2;
		break;
		
		case "line-through":
		balise_mc.texte_mc.textDecoration_cb.selectedIndex = 3;
		break;
		
	}
	
		//------------------------------- Texte decoration-----------------------
	switch(tx.fontVariant){
		
		case false:
		balise_mc.texte_mc.fontVariant_cb.selectedIndex = 0; 
		break;
		
		case true:
		balise_mc.texte_mc.fontVariant_cb.selectedIndex= 1;
		break;
		
		
	}
	
	
	
	//------------------------------- last text align-----------------------
	
	switch(tx.textAlignLast){
		
		case "start":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 0; 
		break;
		
		case "center":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex= 1;
		break;
		
		case "right":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 2;
		break;
		
		case "left":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 3;
		break;
		
		case "justify":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 4;
		break;
		
		case "end":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 5;
		break;
		
		case "auto":
		balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 6;
		break;
		
	}
	//------------------------------- Texte white space-----------------------
	switch(tx.whiteSpace){
		
		case "normal":
		balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 0; 
		break;
		
		case "nowrap":
		balise_mc.texte_mc.whiteSpace_cb.selectedIndex= 1;
		break;
		
		case "pre":
		balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 2;
		break;
		
		case "pre-line":
		balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 3;
		break;
		
		case "pre-wrap":
		balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 4;
		break;
		
	}
	
	
	
}
		
public static function paragraphSelect(tx:Paragraph,balise_mc:MovieClip){
	
	/*balise_mc.texte_mc.fontSize_ns.value = Selection.sParagraph.fontSize;
	balise_mc.texte_mc.fontColor_cp.selectedColor = Selection.sParagraph.color;
	balise_mc.texte_mc.label_txt.text = Selection.sParagraph.label;
	balise_mc.texte_mc.letterSpacing_ns.value = Selection.sParagraph.letterSpacing;
	balise_mc.texte_mc.wordSpacing_ns.value = Selection.sParagraph.wordSpacing;*/
	//balise_mc.texte_mc.lineHeight_ns.value = Selection.sParagraph.lineHeight;

	
	
		//------------------------------- Texte Font-----------------------
	/*switch(Selection.sParagraph.fontFamily){
		
		case "Open Sans":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 0;
		trace("exec Open sans");
		break;
		
		case "Roboto":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 1;
		break;
		
		case "Lato":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 2;
		break;
		
		case "Patua One":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 3;
		trace("exec Patua one");
		break;
		
		case "Roboto Slab":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 4;
		break;
		
		case "Domine":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 5;
		break;
		
		case "Lobster":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 6;
		trace("exec Lobster");
		break;
		
		case "Oleo Script":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 7;
		break;
		
		case "Dancing Script":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 8;
		break;
		case "Font Awesome":
		balise_mc.texte_mc.fontFamily_cb.selectedIndex = 9;
		break;
		
	}
	*/
	

	
	
	////------------------------------- Texte Style-----------------------
	//
	//if(Selection.sParagraph.fontStyle == "normal" && Selection.sParagraph.fontWeight == false){
	//	
	//		balise_mc.texte_mc.fontStyle_cb.selectedIndex = 0;	
	//	
	//}else if (Selection.sParagraph.fontStyle == "normal" && Selection.sParagraph.fontWeight == true){
	//		balise_mc.texte_mc.fontStyle_cb.selectedIndex = 1;	
	//	
	//}else if (Selection.sParagraph.fontStyle == "italic" && Selection.sParagraph.fontWeight == false){
	//		balise_mc.texte_mc.fontStyle_cb.selectedIndex = 2;	
	//	
	//}else if (Selection.sParagraph.fontStyle == "italic" && Selection.sParagraph.fontWeight == true){
	//		balise_mc.texte_mc.fontStyle_cb.selectedIndex = 3;	
	//	
	//}
	//
	//
	//	//------------------------------- Texte Alignt-----------------------
	//switch(tx.textAlign){
	//	
	//	case "justify":
	//	balise_mc.texte_mc.textAlign_cb.selectedIndex = 0;
	//	break;
	//	
	//	case "center":
	//	balise_mc.texte_mc.textAlign_cb.selectedIndex = 1;
	//	break;
	//	
	//	case "left":
	//	balise_mc.texte_mc.textAlign_cb.selectedIndex = 2;
	//	break;
	//	
	//	case "right":
	//	balise_mc.texte_mc.textAlign_cb.selectedIndex = 3;
	//	break;
	//	
	//	
	//}
	
	
	
	////------------------------------- Texte transform-----------------------
	//switch(tx.textTransform){
	//	
	//	case "none":
	//	balise_mc.texte_mc.textTransform_cb.selectedIndex = 0;
	//	break;
	//	
	//	case "capitalize":
	//	balise_mc.texte_mc.textTransform_cb.selectedIndex = 1;
	//	break;
	//	
	//	case "uppercase":
	//	balise_mc.texte_mc.textTransform_cb.selectedIndex = 2;
	//	break;
	//	
	//	case "lowercase":
	//	balise_mc.texte_mc.textTransform_cb.selectedIndex = 3;
	//	break;
	//	
	//	
	//}
	
	
	////------------------------------- Texte decoration-----------------------
	//switch(tx.textDecoration){
	//	
	//	case "none":
	//	balise_mc.texte_mc.textDecoration_cb.selectedIndex = 0; 
	//	break;
	//	
	//	case "underline":
	//	balise_mc.texte_mc.textDecoration_cb.selectedIndex= 1;
	//	break;
	//	
	//	case "overline":
	//	balise_mc.texte_mc.textDecoration_cb.selectedIndex = 2;
	//	break;
	//	
	//	case "line-through":
	//	balise_mc.texte_mc.textDecoration_cb.selectedIndex = 3;
	//	break;
	//	
	//}
	//
	//	//------------------------------- Texte decoration-----------------------
	//switch(tx.fontVariant){
	//	
	//	case false:
	//	balise_mc.texte_mc.fontVariant_cb.selectedIndex = 0; 
	//	break;
	//	
	//	case true:
	//	balise_mc.texte_mc.fontVariant_cb.selectedIndex= 1;
	//	break;
	//	
	//	
	//}
	
	
	////------------------------------- last text align-----------------------
	//
	//switch(tx.textAlignLast){
	//	
	//	case "start":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 0; 
	//	break;
	//	
	//	case "center":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex= 1;
	//	break;
	//	
	//	case "right":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 2;
	//	break;
	//	
	//	case "left":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 3;
	//	break;
	//	
	//	case "justify":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 4;
	//	break;
	//	
	//	case "end":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 5;
	//	break;
	//	
	//	case "auto":
	//	balise_mc.texte_mc.textAlignLast_cb.selectedIndex = 6;
	//	break;
	//	
	//}
	////------------------------------- Texte white space-----------------------
	//switch(tx.whiteSpace){
	//	
	//	case "normal":
	//	balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 0; 
	//	break;
	//	
	//	case "nowrap":
	//	balise_mc.texte_mc.whiteSpace_cb.selectedIndex= 1;
	//	break;
	//	
	//	case "pre":
	//	balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 2;
	//	break;
	//	
	//	case "pre-line":
	//	balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 3;
	//	break;
	//	
	//	case "pre-wrap":
	//	balise_mc.texte_mc.whiteSpace_cb.selectedIndex = 4;
	//	break;
	//	
	//}
	
	
}

//$$$
public static function initialisationService(sb:Service,balise_mc:MovieClip ){
	
	
}



public static  function iconeBaliseSelect(ic:IconeBalise,balise_mc:MovieClip){
	
	
	balise_mc.iconeBalise_mc.fontSize_ns.value = ic.label.fontSize;
	balise_mc.iconeBalise_mc.fontColor_cp.selectedColor = ic.label.color;
	balise_mc.iconeBalise_mc.label_txt.text = ic.label.label;
	
	
}
			
			
	public static function initialisationBalise(sb:Balise,balise_mc:MovieClip ){
	
	balise_mc.couleurDegrade_mc.opacity_ns.value = sb.alpha * 100;


	//Position et taille
	/*balise_mc.positionSize_mc.x_ns.value = sb.x;
	balise_mc.positionSize_mc.y_ns.value = sb.y;
		
	balise_mc.positionSize_mc.htmlWidth_ns.value = sb.htmlWidth;
	balise_mc.positionSize_mc.htmlHeight_ns.value = sb.htmlHeight;*/

}



public static function initialisationModule(sb:Balise,balise_mc:MovieClip ){
	
	initialisationPositionX(sb,balise_mc);
	initialisationPositionY(sb,balise_mc);

	initialisationPositionW(sb,balise_mc);
	//initialisationPositionW(sb,balise_mc);
	//initialisationPositionH(sb,balise_mc);
	initialisationPositionH(sb,balise_mc);
	//	initialisationPositionY(sb,balise_mc);
	
	
	var listMaster: Array = new Array();
//---	listMaster.push(sb.papa.name);
	listMaster.push(sb.parent.name);
	if(sb.parent.parent as Balise ){
		listMaster.push(sb.parent.parent.name);
	}
	
	
	var listSuivi: Array = new Array();
	var sbP = sb.parent as Balise;
	var sbPC = sb.parent.getChildAt(0) as Balise;
	sSuiviH = sbPC;
	sSuiviL = sbPC;
	/*sb.positionArray[0] = sbPC;
	sb.positionArray[5] = sbPC;*/
	
	var indexMaster:uint = 0;
	var indexSuiviL:uint = 0;
	var indexSuiviH:uint = 0;
	
	var indexSuiviRL:uint = 0;
	var indexSuiviRH:uint = 0;
	
	var i:int;
	var indexNow:int = 0;
	
	
	
	/*for( i=0;i<= sb.papa.childTab.length -1;i++)
	{
		if(sb.papa.childTab[i].name != sb.name)
		{
			listMaster.push(sb.papa.childTab[i].name);
		}
		
	}*/
	//
	//for( i=0;i<= sbP.childTab.length -1;i++)
	//{
	//	
	//	
	//	if(sbP.childTab[i].name != sb.name && sbP.childTab[i].name.indexOf("instance") == -1   ) //&& sbP.childTab[i] as BlankModule
	//	{
	//		
	//	
	//		trace("sbP.childTab[i]:" + sbP.childTab[i]);
	//		trace("sbP.childTab[i].visible:" + sbP.childTab[i].visible);
	//		listMaster.push(sbP.childTab[i].name);
	//	}
	//	
	//
	//}
	
	for( i=0;i<= sbP.numChildren -1;i++)
	{
		
		
		if(sbP.getChildAt(i).name != sb.name && sbP.getChildAt(i).name.indexOf("instance") == -1   ) //&& sbP.childTab[i] as BlankModule
		{
			
		
			listMaster.push(sbP.getChildAt(i).name);
		}
		
	
	}
	
	
	for( i=0;i<= sb.baliseParent.numChildren -1;i++)
	{
		if(sb.baliseParent.getChildAt(i).name != sb.name && sb.baliseParent.getChildAt(i) as BlankModule)
		{
			indexNow ++;
			listSuivi.push(sb.baliseParent.getChildAt(i).name);
		//trace("sb.baliseParent.childIndex(i):" + sb.baliseParent.getChildAt(i));
		}
		
	}
	
	//trace("indexNow:" + indexNow);
	
	
	
	
	
	/*for( i=0;i<= sb.parent.numChildren -1;i++)
	{
		if(sb.parent.getChildAt(i).name != sb.name  && sb.parent.getChildAt(i) as BlankModule  )
		{
			listSuivi.push(sb.parent.getChildAt(i).name);
		trace("sbP.childTab[i]:" + sb.parent.getChildAt(i).name);
		}
		
	}*/
	
	
	//childTab.push({balise: child,name: child.name});
	
	//master


	for(i=0;i<= listMaster.length -1;i++)
	{
	if(sb.positionArray[1].name == listMaster[i]){
			indexMaster = i;

		}
	}
	balise_mc.disposition_mc.master_cb.dataProvider = new DataProvider(listMaster);
	balise_mc.disposition_mc.master_cb.selectedIndex = indexMaster;

	//SuiviH
	
	for(i=0;i<= listSuivi.length -1;i++)
	{
		
		if(sb.positionArray[0].name == listSuivi[i]){
		indexSuiviH = i;
		
		}
		
		//--References
		
		/*if(sb.positionArray[5].name == listSuivi[i]){
		indexSuiviRL = i;
		
		}
		
		if(sb.positionArray[6].name == listSuivi[i]){
		indexSuiviRH = i;
		
		}*/
	}	
	balise_mc.disposition_mc.suiviH_cb.dataProvider = new DataProvider(listSuivi);
	
	//--References
	/*balise_mc.disposition_mc.referenceL_cb.dataProvider = new DataProvider(listSuivi);
	balise_mc.disposition_mc.referenceH_cb.dataProvider = new DataProvider(listSuivi);*/
	
	if(listSuivi.length > 0){
		balise_mc.disposition_mc.suiviH_cb.selectedIndex = indexSuiviH;
		
		//--References
		/*balise_mc.disposition_mc.referenceL_cb.selectedIndex = indexSuiviRL;
		balise_mc.disposition_mc.referenceH_cb.selectedIndex = indexSuiviRH;*/
		
	}else{
		
		balise_mc.disposition_mc.suiviH_cb.prompt = "Aucun"
		//--References
		/*balise_mc.disposition_mc.referenceL_cb.prompt = "Aucun"
		balise_mc.disposition_mc.referenceH_cb.prompt = "Aucun"*/
	}
	
	
	//suiviL	
		
	for(i=0;i<= listSuivi.length -1;i++)
	{

	
		if(sb.positionArray[5].name == listSuivi[i]){
			indexSuiviL = i;
		
		}
		
		//--References
		if(sb.positionArray[6].name == listSuivi[i]){
			indexSuiviRL = i;
		
		}
		
		if(sb.positionArray[7].name == listSuivi[i]){
			indexSuiviRH = i;
		
		}
	}
	
	balise_mc.disposition_mc.suiviL_cb.dataProvider = new DataProvider(listSuivi);
	//--References
	balise_mc.disposition_mc.referenceL_cb.dataProvider = new DataProvider(listSuivi);
	balise_mc.disposition_mc.referenceH_cb.dataProvider = new DataProvider(listSuivi);
	
	
	if(listSuivi.length > 0){
		balise_mc.disposition_mc.suiviL_cb.selectedIndex = indexSuiviL;
		sb.positionArray[5] = 	sb.positionArray[1].getChildByName(balise_mc.disposition_mc.suiviL_cb.selectedLabel);
		sb.positionArray[0] = 	sb.positionArray[1].getChildByName(balise_mc.disposition_mc.suiviH_cb.selectedLabel);
		
		//--References
		balise_mc.disposition_mc.referenceL_cb.selectedIndex = indexSuiviRL;
		balise_mc.disposition_mc.referenceH_cb.selectedIndex = indexSuiviRH;
		sb.positionArray[6] = 	sb.positionArray[1].getChildByName(balise_mc.disposition_mc.referenceL_cb.selectedLabel);
		sb.positionArray[7] = 	sb.positionArray[1].getChildByName(balise_mc.disposition_mc.referenceH_cb.selectedLabel);
	}else{
		balise_mc.disposition_mc.suiviL_cb.prompt = "Aucun";
		
		//--References
		balise_mc.disposition_mc.referenceL_cb.prompt = "Aucun";
		balise_mc.disposition_mc.referenceH_cb.prompt = "Aucun";
	}
	
	
	
}
	
	public static function initialisationPositionX(sb:Balise,balise_mc:MovieClip){
	
	if(sb.positionTypeX  == 1){
	balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 2;
	balise_mc.positionSizeModule_mc.x_ns.value = sb.positionScale.x * 100;
		balise_mc.positionSizeModule_mc.x_ns.enabled = true;
	} else if(sb.positionTypeX  == 2){
		
		if(sb.debutCol == -1){
			balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 1;
			balise_mc.positionSizeModule_mc.x_ns.value = sb.fixedPositionX;
			balise_mc.positionSizeModule_mc.x_ns.enabled = true;
			
		}else{
			
			balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 0;
			balise_mc.positionSizeModule_mc.x_ns.value = sb.debutCol;
			balise_mc.positionSizeModule_mc.x_ns.enabled = true;
		}
	
	}else if(sb.positionTypeX  == 3){
		
		balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 3;
		balise_mc.positionSizeModule_mc.x_ns.enabled = false;
	}else if(sb.positionTypeX  == 4){
		
		balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 4;
		balise_mc.positionSizeModule_mc.x_ns.enabled = false;
	}else if(sb.positionTypeX  == 5){
		
		balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 5;
		balise_mc.positionSizeModule_mc.x_ns.enabled = false;
	}else if(sb.positionTypeX  == 6){
		
		balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 6;
		balise_mc.positionSizeModule_mc.x_ns.enabled = false;
	}else if(sb.positionTypeX  == 7){
		
		balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 7;
		balise_mc.positionSizeModule_mc.x_ns.enabled = false;
	}else if(sb.positionTypeX  == 8){
		
		balise_mc.positionSizeModule_mc.x_cb.selectedIndex = 8;
		balise_mc.positionSizeModule_mc.x_ns.enabled = false;
	}
}

	public static function initialisationPositionY(sb:Balise,balise_mc:MovieClip){
		
	
//	var fixedPositionYC:Number = sb.fixedPositionY - sb.positionArray[1].y ;	
		
//PositionY
	if(sb.positionTypeY  == 1){
	balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 1;
	balise_mc.positionSizeModule_mc.y_ns.value = sb.positionScale.y * 100;
	balise_mc.positionSizeModule_mc.y_ns.enabled = true;
	
	} else if(sb.positionTypeY  == 2){
		
	balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 0;
	//balise_mc.positionSizeModule_mc.y_ns.value =  fixedPositionYC;
	balise_mc.positionSizeModule_mc.y_ns.value =  sb.fixedPositionY;
	balise_mc.positionSizeModule_mc.y_ns.enabled = true;
		
		//trace("fixedPositionYC:"+ fixedPositionYC);
			
	}else if(sb.positionTypeY  == 3){
		
		balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 2;
		balise_mc.positionSizeModule_mc.y_ns.enabled = false;
	}else if(sb.positionTypeY  == 4){
		
		balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 3;
		balise_mc.positionSizeModule_mc.y_ns.enabled = false;
	}else if(sb.positionTypeY  == 5){
		
		balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 4;
		balise_mc.positionSizeModule_mc.y_ns.enabled = false;
	}else if(sb.positionTypeY  == 6){
		balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 6;
		balise_mc.positionSizeModule_mc.y_ns.enabled = false;
	}else if(sb.positionTypeY  == 7){
		
		balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 5;
		balise_mc.positionSizeModule_mc.y_ns.enabled = false;
	}else if(sb.positionTypeY  == 8){
		
		balise_mc.positionSizeModule_mc.y_cb.selectedIndex = 7;
		balise_mc.positionSizeModule_mc.y_ns.enabled = false;
	}
	
}

	
public static function initialisationPositionW(sb:Balise,balise_mc:MovieClip){	

	//Size W
	if(sb.widthType == 0){

		balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = true;
		
		if(sb.column >= 0){
			balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 0;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.value = sb.column;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = true;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.stepSize = 1;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.maximum = Selection.sGrid.columnArray.length;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.minimum = 1;
		
		}else{
	
			balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 1;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.value = sb.fixedWidth;
			
			balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = true;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.stepSize = 1;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.maximum = 2000;
			balise_mc.positionSizeModule_mc.htmlWidth_ns.minimum = 0;
	
		}
	} else if(sb.widthType  == 1){
		
		balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 2;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.value = sb.scale.x * 100;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = true;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.stepSize = 0.1;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.maximum = 100;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.minimum = 0;
		
	}else if(sb.widthType == 2){
		
		balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 4;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = false;
		
	}else if(sb.widthType  == 3){
		balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 5;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = false;
		
	}else if(sb.widthType  == 4){
		
		balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 3;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = false;
		
		
	}else if(sb.widthType  == 7){
		
		balise_mc.positionSizeModule_mc.htmlWidth_cb.selectedIndex = 7;
		balise_mc.positionSizeModule_mc.htmlWidth_ns.enabled = false;
		
		
	}

	
}




public static function initialisationPositionH(sb:Balise,balise_mc:MovieClip){	

	//Size W
	if(sb.heightType == 0){

			balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = true;
	
			balise_mc.positionSizeModule_mc.htmlHeight_cb.selectedIndex = 0;
			balise_mc.positionSizeModule_mc.htmlHeight_ns.value = sb.fixedHeight;
			
			balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = true;
			balise_mc.positionSizeModule_mc.htmlHeight_ns.stepSize = 1;
			balise_mc.positionSizeModule_mc.htmlHeight_ns.maximum = 2000;
			balise_mc.positionSizeModule_mc.htmlHeight_ns.minimum = 0;
	
		
	} else if(sb.heightType  == 1){
		
		balise_mc.positionSizeModule_mc.htmlHeight_cb.selectedIndex = 1;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.value = sb.scale.y * 100;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = true;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.stepSize = 0.1;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.maximum = 100;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.minimum = 0;
		
	}else if(sb.heightType == 2){
		balise_mc.positionSizeModule_mc.htmlHeight_cb.selectedIndex = 3;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = false;
		
	}else if(sb.heightType  == 3){
		balise_mc.positionSizeModule_mc.htmlHeight_cb.selectedIndex = 4;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = false;
		
	}else if(sb.heightType  == 4){
		
		balise_mc.positionSizeModule_mc.htmlHeight_cb.selectedIndex = 2;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = false;
		
		
	}else if(sb.heightType  == 7){
		
		balise_mc.positionSizeModule_mc.htmlHeight_cb.selectedIndex = 6;
		balise_mc.positionSizeModule_mc.htmlHeight_ns.enabled = false;
		
	}

	
}











public static function initialisationModule1(sb:Balise,balise_mc:MovieClip ){
	
	
	//var pt:Point;
	
	
	//balise_mc.couleurDegrade_mc.opacity_ns.value = sb.alpha * 100;


	//Position et taille
	if(balise_mc.positionSize_mc.positionSize_cb.selectedIndex == 0){
		
		
		
				balise_mc.positionSize_mc.htmlWidth_ns.value = sb.column;
				balise_mc.positionSize_mc.L_txt.text = "N:";
		
		balise_mc.positionSize_mc.x_ns.value = sb.debutCol;
		balise_mc.positionSize_mc.X_txt.text = "D:";
		
		sb.positionTypeX = 2;
	    sb.positionTypeY = 2;
		
		sb.heightType = 0;
	    sb.widthType = 0;
		
		balise_mc.positionSize_mc.y_ns.value = sb.fixedPositionY;
	 
	}else if(balise_mc.positionSize_mc.positionSize_cb.selectedIndex == 1){
		
		balise_mc.positionSize_mc.htmlWidth_ns.value = sb.fixedWidth;
		balise_mc.positionSize_mc.L_txt.text = "L:";
		
		balise_mc.positionSize_mc.x_ns.value = sb.fixedPositionX;
		balise_mc.positionSize_mc.X_txt.text = "X:";
		
		sb.positionTypeX = 2;
	    sb.positionTypeY = 2;
		
		sb.heightType = 0;
	    sb.widthType = 0;
		
		balise_mc.positionSize_mc.y_ns.value = sb.fixedPositionY;
		
	}else if(balise_mc.positionSize_mc.positionSize_cb.selectedIndex == 2){
		
		balise_mc.positionSize_mc.x_ns.value = sb.positionScale.x * 100;
		balise_mc.positionSize_mc.X_txt.text = "X%:";
		
		balise_mc.positionSize_mc.htmlWidth_ns.value = sb.scale.x * 100;
		balise_mc.positionSize_mc.L_txt.text = "%L:";
		
		
		sb.widthType = 1;
		sb.positionTypeX = 1
		sb.heightType = 0;
		sb.positionTypeY = 2;
		
		/*sb.fixedPositionX = sb.positionArray[1].paddingLeft;
		sb.fixedWidth = sb.positionArray[1].htmlWidth - sb.positionArray[1].paddingLeft - sb.positionArray[1].paddingRight;
		balise_mc.positionSize_mc.y_ns.value = sb.fixedPositionY;*/
		
	}else if(balise_mc.positionSize_mc.positionSize_cb.selectedIndex == 3){
		/*sb.positionTypeX = 0;
		sb.fixedPositionX = sb.x;*/
		
		balise_mc.positionSize_mc.x_ns.value = sb.fixedPositionX;
		balise_mc.positionSize_mc.X_txt.text = "X:";
		
		
		sb.widthType = 2;
		sb.positionTypeX = 5
		
		sb.fixedPositionX = sb.positionArray[1].paddingLeft;
		sb.fixedWidth = sb.positionArray[1].htmlWidth - sb.positionArray[1].paddingLeft - sb.positionArray[1].paddingRight;
		
		
		balise_mc.positionSize_mc.y_ns.value = sb.fixedPositionY;
		
	}
	

	
	
	
	//sb.fixedPositionY = sb.y;
	
	//-------------------------------
	//if(balise_mc.positionSize_mc.positionSize_cb.selectedIndex == 0){
	//
	//	
	//	/*balise_mc.positionSize_mc.htmlWidth_ns.value = sb.column;
	//	balise_mc.positionSize_mc.L_txt.text = "N:";*/
	// 
	//}else if(balise_mc.positionSize_mc.positionSize_cb.selectedIndex == 1){
	//	
	//	balise_mc.positionSize_mc.htmlWidth_ns.value = sb.fixedWidth;
	//	balise_mc.positionSize_mc.L_txt.text = "L:";
	//}
	//
	balise_mc.positionSize_mc.htmlHeight_ns.value = sb.fixedHeight;
	
	
	

	Ki.balisePosition(sb);
	

}

//------------------------------------------------------------------Background-----------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
		

public static function initialisationBackground(sb:Balise,balise_mc:MovieClip){
	

balise_mc.couleurDegrade_mc.backgroundImage_cb.selectedIndex = backgroundImageIndex(sb,balise_mc);

//----color
balise_mc.couleurDegrade_mc.color_mc.backgroundColor_cp.selectedColor = sb.background.backgroundColor;

//---gradient
balise_mc.couleurDegrade_mc.gradient_mc.gradient1_cp.selectedColor = sb.background.backgroundGradiant.color1;
balise_mc.couleurDegrade_mc.gradient_mc.gradient2_cp.selectedColor = sb.background.backgroundGradiant.color2;

balise_mc.couleurDegrade_mc.gradient_mc.gradient1_ns.value = sb.background.backgroundGradiant.colorStop1;
balise_mc.couleurDegrade_mc.gradient_mc.gradient2_ns.value = sb.background.backgroundGradiant.colorStop2;
}


private static function backgroundImageIndex(sb:Balise,balise_mc:MovieClip):uint{
	
	var backgroundImage:uint;
	switch(sb.background.backgroundImage)
	{
		case "transparent":
		backgroundImage = 0;	
		backgroundImageTransparentType(sb,balise_mc);
		break;
		case "color":
		backgroundImage = 1;
		backgroundImageColorType(sb,balise_mc);			
		break;
		case "gradient":
		backgroundImage = 2;
		backgroundImageGradientType(sb,balise_mc);
		break;
		case "image":
		backgroundImage = 3;
		backgroundImageImageType(sb,balise_mc);	
		break;
		
	}
	return backgroundImage;
	
}


public static function backgroundImageGradientType(sb:Balise,balise_mc:MovieClip){
	
	balise_mc.couleurDegrade_mc.color_mc.visible = false;
	balise_mc.couleurDegrade_mc.gradient_mc.visible = true;
	sb.background.backgroundImage = "gradient";
	try{
	if(activeBaliseType != "ImageBalise"  ){
			sModule.imageBg.visible = false;

		
	}

	}catch(e:Error){
		
	}
	Ki.baliseChange(sb);
}


public static function backgroundImageColorType(sb:Balise,balise_mc:MovieClip){
	
	balise_mc.couleurDegrade_mc.color_mc.visible = true;
	balise_mc.couleurDegrade_mc.gradient_mc.visible = false;
	sb.background.backgroundImage = "color";
	try{
		if(activeBaliseType != "ImageBalise"  ){
			sModule.imageBg.visible = false;

		
	}

	}catch(e:Error){
		
	}

	Ki.baliseChange(sb);
}

public static function backgroundImageTransparentType(sb:Balise,balise_mc:MovieClip){
	balise_mc.couleurDegrade_mc.color_mc.visible = false;
	balise_mc.couleurDegrade_mc.gradient_mc.visible = false;
	sb.background.backgroundImage = "transparent";
	trace("activeBaliseType:" + activeBaliseType);

	try{
	if(activeBaliseType != "ImageBalise"  ){
			sModule.imageBg.visible = false;

		
	}

	}catch(e:Error){
		
	}
	Ki.baliseChange(sb);
	
}

public static function backgroundImageImageType(sb:Balise,balise_mc:MovieClip){
	balise_mc.couleurDegrade_mc.color_mc.visible = false;
	balise_mc.couleurDegrade_mc.gradient_mc.visible = false;
	sb.background.backgroundImage = "image";
	//moduleSelect(sImageBalise, balise_mc);
	
	try{
		if(activeBaliseType != "ImageBalise"  ){
			sModule.imageBg.visible = true;

		
	}

	}catch(e:Error){
		
	}

		

	
//	imageSelect(sModule.imageBg,balise_mc);
	Ki.baliseChange(sb);
	
}







//------------------------------------------------------------------Border-----------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------



public static function initialisationBorder(sb:Balise,balise_mc:MovieClip){
	

balise_mc.border_mc.borderWidth_mc.borderTopWidth_ns.value = sb.border.borderTopWidth ;
balise_mc.border_mc.borderWidth_mc.borderBottomWidth_ns.value = sb.border.borderBottomWidth  ;
balise_mc.border_mc.borderWidth_mc.borderRightWidth_ns.value = sb.border.borderRightWidth ;
balise_mc.border_mc.borderWidth_mc.borderLeftWidth_ns.value =  sb.border.borderLeftWidth; 

if( sb.border.borderTopWidth ==  sb.border.borderBottomWidth && sb.border.borderTopWidth ==  sb.border.borderLeftWidth && sb.border.borderTopWidth ==  sb.border.borderRightWidth){
	
	balise_mc.border_mc.borderWidth_mc.borderWidthLink_chb.selected = true;
}else{
	balise_mc.border_mc.borderWidth_mc.borderWidthLink_chb.selected = false;
}

borderWidthChange(sb,balise_mc);

}


public static function borderWidthChange(sb:Balise,balise_mc:MovieClip){
	
	if(balise_mc.border_mc.borderWidth_mc.borderWidthLink_chb.selected == true)
	{
		var borderWidth:uint = balise_mc.border_mc.borderWidth_mc.borderTopWidth_ns.value;
		//balise_mc.border_mc.borderWidth_mc.borderWidthLink_chb.selected = false;
		balise_mc.border_mc.borderWidth_mc.borderBottomWidth_ns.enabled = false;
		balise_mc.border_mc.borderWidth_mc.borderLeftWidth_ns.enabled = false;
		balise_mc.border_mc.borderWidth_mc.borderRightWidth_ns.enabled = false;
		
		balise_mc.border_mc.borderWidth_mc.borderBottomWidth_ns.value = borderWidth;
		balise_mc.border_mc.borderWidth_mc.borderLeftWidth_ns.value = borderWidth;
		balise_mc.border_mc.borderWidth_mc.borderRightWidth_ns.value = borderWidth;
		
		sb.border.borderWidth = borderWidth;
		
		
		
	}else{
		
		balise_mc.border_mc.borderWidth_mc.borderBottomWidth_ns.enabled = true;
		balise_mc.border_mc.borderWidth_mc.borderLeftWidth_ns.enabled = true;
		balise_mc.border_mc.borderWidth_mc.borderRightWidth_ns.enabled = true;
		
		sb.border.borderTopWidth = balise_mc.border_mc.borderWidth_mc.borderTopWidth_ns.value;
		sb.border.borderBottomWidth = balise_mc.border_mc.borderWidth_mc.borderBottomWidth_ns.value;
		sb.border.borderRightWidth = balise_mc.border_mc.borderWidth_mc.borderRightWidth_ns.value;
		sb.border.borderLeftWidth = balise_mc.border_mc.borderWidth_mc.borderLeftWidth_ns.value;
		
	}

	Ki.baliseChange(sb);
	
}


public static function initialisationBorderColor(sb:Balise,balise_mc:MovieClip){
balise_mc.border_mc.borderColor_mc.borderTopColor_cp.selectedColor = sb.border.borderTopColor ;
balise_mc.border_mc.borderColor_mc.borderBottomColor_cp.selectedColor = sb.border.borderBottomColor  ;
balise_mc.border_mc.borderColor_mc.borderRightColor_cp.selectedColor = sb.border.borderRightColor ;
balise_mc.border_mc.borderColor_mc.borderLeftColor_cp.selectedColor =  sb.border.borderLeftColor; 

if( sb.border.borderTopColor ==  sb.border.borderBottomColor && sb.border.borderTopColor ==  sb.border.borderLeftColor && sb.border.borderTopColor ==  sb.border.borderRightColor){
	
	balise_mc.border_mc.borderColor_mc.borderColorLink_chb.selected = true;
}else{
	balise_mc.border_mc.borderColor_mc.borderColorLink_chb.selected = false;
}

borderColorChange(sb,balise_mc);
}


public static function borderColorChange(sb:Balise,balise_mc:MovieClip){
	
	var borderColor:uint = balise_mc.border_mc.borderColor_mc.borderTopColor_cp.selectedColor;
	
	if(balise_mc.border_mc.borderColor_mc.borderColorLink_chb.selected == true)
	{
		
		balise_mc.border_mc.borderColor_mc.borderBottomColor_cp.selectedColor = borderColor;
		balise_mc.border_mc.borderColor_mc.borderLeftColor_cp.selectedColor = borderColor;
		balise_mc.border_mc.borderColor_mc.borderRightColor_cp.selectedColor = borderColor;
		
		sb.border.borderColor = borderColor;
		
		balise_mc.border_mc.borderColor_mc.borderBottomColor_cp.selectedColor = borderColor;
		balise_mc.border_mc.borderColor_mc.borderRightColor_cp.selectedColor = borderColor;
		balise_mc.border_mc.borderColor_mc.borderLeftColor_cp.selectedColor = borderColor;
		
		balise_mc.border_mc.borderColor_mc.borderBottomColor_cp.enabled = false;
		balise_mc.border_mc.borderColor_mc.borderLeftColor_cp.enabled = false;
		balise_mc.border_mc.borderColor_mc.borderRightColor_cp.enabled = false;
		
		
		
	}else{
		

		balise_mc.border_mc.borderColor_mc.borderBottomColor_cp.enabled = true;
		balise_mc.border_mc.borderColor_mc.borderLeftColor_cp.enabled = true;
		balise_mc.border_mc.borderColor_mc.borderRightColor_cp.enabled = true; 
		
		sb.border.borderTopColor = balise_mc.border_mc.borderColor_mc.borderTopColor_cp.selectedColor;
		sb.border.borderBottomColor = balise_mc.border_mc.borderColor_mc.borderBottomColor_cp.selectedColor;
		sb.border.borderRightColor = balise_mc.border_mc.borderColor_mc.borderRightColor_cp.selectedColor;
		sb.border.borderLeftColor = balise_mc.border_mc.borderColor_mc.borderLeftColor_cp.selectedColor;
		
		
		
	}
	//sb.border.borderStyle = "solid";
	Ki.baliseChange(sb);
	
	
			
	
	
}



//----------Radius
public static function initialisationRadius(sb:Balise,balise_mc:MovieClip){
balise_mc.border_mc.borderRadius_mc.borderTopRightRadius_ns.value = sb.border.borderTopRightRadius ;
balise_mc.border_mc.borderRadius_mc.borderTopLeftRadius_ns.value = sb.border.borderTopLeftRadius  ;
balise_mc.border_mc.borderRadius_mc.borderBottomLeftRadius_ns.value = sb.border.borderBottomLeftRadius ;
balise_mc.border_mc.borderRadius_mc.borderBottomRightRadius_ns.value =  sb.border.borderBottomRightRadius; 

if( sb.border.borderTopLeftRadius ==  sb.border.borderTopRightRadius && sb.border.borderTopLeftRadius ==  sb.border.borderBottomLeftRadius && sb.border.borderTopLeftRadius ==  sb.border.borderBottomRightRadius){
	
	balise_mc.border_mc.borderRadius_mc.borderRadiusLink_chb.selected = true;
}else{
	balise_mc.border_mc.borderRadius_mc.borderRadiusLink_chb.selected = false;
}
borderRadiusChange(sb,balise_mc);
}

public static function borderRadiusChange(sb:Balise,balise_mc:MovieClip){
	
	if(balise_mc.border_mc.borderRadius_mc.borderRadiusLink_chb.selected == true)
	{
		var borderRadius:uint = balise_mc.border_mc.borderRadius_mc.borderTopLeftRadius_ns.value;
		//balise_mc.border_mc.borderRadius_mc.borderRadiusLink_chb.selected = false;
		balise_mc.border_mc.borderRadius_mc.borderTopRightRadius_ns.enabled = false;
		balise_mc.border_mc.borderRadius_mc.borderBottomLeftRadius_ns.enabled = false;
		balise_mc.border_mc.borderRadius_mc.borderBottomRightRadius_ns.enabled = false;
		
		balise_mc.border_mc.borderRadius_mc.borderTopRightRadius_ns.value = borderRadius;
		balise_mc.border_mc.borderRadius_mc.borderBottomLeftRadius_ns.value = borderRadius;
		balise_mc.border_mc.borderRadius_mc.borderBottomRightRadius_ns.value = borderRadius;
		
		sb.border.borderRadius = borderRadius;
		
		
		
	}else{
		
		balise_mc.border_mc.borderRadius_mc.borderTopRightRadius_ns.enabled = true;
		balise_mc.border_mc.borderRadius_mc.borderBottomLeftRadius_ns.enabled = true;
		balise_mc.border_mc.borderRadius_mc.borderBottomRightRadius_ns.enabled = true;
		
		sb.border.borderTopLeftRadius = balise_mc.border_mc.borderRadius_mc.borderTopLeftRadius_ns.value;
		sb.border.borderTopRightRadius = balise_mc.border_mc.borderRadius_mc.borderTopRightRadius_ns.value;
		sb.border.borderBottomLeftRadius = balise_mc.border_mc.borderRadius_mc.borderBottomLeftRadius_ns.value;
		sb.border.borderBottomRightRadius = balise_mc.border_mc.borderRadius_mc.borderBottomRightRadius_ns.value;
		
		
	}

	Ki.baliseChange(sb);
	
}



public static function initialisationBorderStyle(sb:Balise,balise_mc:MovieClip){
balise_mc.border_mc.borderStyle_mc.borderTopStyle_cb.selectedIndex = borderStringToIndex(sb.border.borderTopStyle); ;
balise_mc.border_mc.borderStyle_mc.borderBottomStyle_cb.selectedIndex = borderStringToIndex(sb.border.borderBottomStyle);
balise_mc.border_mc.borderStyle_mc.borderRightStyle_cb.selectedIndex = borderStringToIndex(sb.border.borderRightStyle);
balise_mc.border_mc.borderStyle_mc.borderLeftStyle_cb.selectedIndex = borderStringToIndex(sb.border.borderLeftStyle); 

if( sb.border.borderTopStyle ==  sb.border.borderBottomStyle && sb.border.borderTopStyle ==  sb.border.borderRightStyle && sb.border.borderTopStyle ==  sb.border.borderLeftStyle){
	
	balise_mc.border_mc.borderStyle_mc.borderStyleLink_chb.selected = true;
}else{
	balise_mc.border_mc.borderStyle_mc.borderStyleLink_chb.selected = false;
}

borderStyleChange(sb,balise_mc);
}


public static function borderStyleChange(sb:Balise,balise_mc:MovieClip){
	
	if(balise_mc.border_mc.borderStyle_mc.borderStyleLink_chb.selected == true)
	{
		var borderStyle:String = borderIndexToString(balise_mc.border_mc.borderStyle_mc.borderTopStyle_cb.selectedIndex);
		var indexTopStyle = balise_mc.border_mc.borderStyle_mc.borderTopStyle_cb.selectedIndex;
	
		balise_mc.border_mc.borderStyle_mc.borderBottomStyle_cb.enabled = false;
		balise_mc.border_mc.borderStyle_mc.borderLeftStyle_cb.enabled = false;
		balise_mc.border_mc.borderStyle_mc.borderRightStyle_cb.enabled = false;
		
		balise_mc.border_mc.borderStyle_mc.borderBottomStyle_cb.selectedIndex = indexTopStyle;
		balise_mc.border_mc.borderStyle_mc.borderLeftStyle_cb.selectedIndex = indexTopStyle;
		balise_mc.border_mc.borderStyle_mc.borderRightStyle_cb.selectedIndex = indexTopStyle;
		
		sb.border.borderStyle = borderStyle;
		
		
		
	}else{
		

		balise_mc.border_mc.borderStyle_mc.borderBottomStyle_cb.enabled = true;
		balise_mc.border_mc.borderStyle_mc.borderLeftStyle_cb.enabled = true;
		balise_mc.border_mc.borderStyle_mc.borderRightStyle_cb.enabled = true;
		
		sb.border.borderTopStyle = borderIndexToString(balise_mc.border_mc.borderStyle_mc.borderTopStyle_cb.selectedIndex);
		sb.border.borderBottomStyle = borderIndexToString(balise_mc.border_mc.borderStyle_mc.borderBottomStyle_cb.selectedIndex);
		sb.border.borderRightStyle = borderIndexToString(balise_mc.border_mc.borderStyle_mc.borderRightStyle_cb.selectedIndex);
		sb.border.borderLeftStyle = borderIndexToString(balise_mc.border_mc.borderStyle_mc.borderLeftStyle_cb.selectedIndex);
		
	}
	
	Ki.baliseChange(sb);
	
}



//--------------------BorderStyle

public static function borderStringToIndex(style:String){
	
	var borderStyle:uint;
	switch(style)
	{
		case "solid":
		borderStyle = 0;	
		
		break;
		case "dotted":
		borderStyle = 1;
			
		break;
		case "dashed":
		borderStyle = 2;
		
		break;
		case "double":
		borderStyle = 3;
		
		break;
		
		
		
	}
	return borderStyle;
	
	
}


public static function borderIndexToString(index:uint){
	
	var borderStyle:String;
	switch(index)
	{
		case 0:
		borderStyle = "solid";	
		
		break;
		case 1:
		borderStyle = "dotted";
			
		break;
		case 2:
		borderStyle = "dashed";
		
		break;
		case 3:
		borderStyle = "double";
		
		break;
		
		
		
		
	}
	return borderStyle;
	
	
}


//------------------------------------------------------------------EffectMargins-----------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------



public static function initialisationEffectsMargins(sb:Balise,balise_mc:MovieClip){
	
balise_mc.effectsMargins_mc.shadow_mc.color_cp.selectedColor = sb.background.shadow.color;
balise_mc.effectsMargins_mc.shadow_mc.vShadow_ns.value = sb.background.shadow.vShadow ;
balise_mc.effectsMargins_mc.shadow_mc.hShadow_ns.value = sb.background.shadow.hShadow ;
balise_mc.effectsMargins_mc.shadow_mc.blur_ns.value =  sb.background.shadow.blur;

//-----------Transform
balise_mc.effectsMargins_mc.transform_mc.rotate_ns.value = sb.transforme.rotate;
balise_mc.effectsMargins_mc.transform_mc.skewX_ns.value = sb.transforme.skew.x;
balise_mc.effectsMargins_mc.transform_mc.skewY_ns.value = sb.transforme.skew.y;
//-----------Margin
balise_mc.effectsMargins_mc.margin_mc.marginTop_ns.value = sb.marginTop;
balise_mc.effectsMargins_mc.margin_mc.marginBottom_ns.value = sb.marginBottom;
balise_mc.effectsMargins_mc.margin_mc.marginRight_ns.value = sb.marginRight;
balise_mc.effectsMargins_mc.margin_mc.marginLeft_ns.value = sb.marginLeft;

if( sb.marginTop ==  sb.marginBottom  && sb.marginTop ==  sb.marginLeft  && sb.marginTop ==  sb.marginRight){
	
	balise_mc.effectsMargins_mc.margin_mc.marginLink_chb.selected = true;
}else{
	balise_mc.effectsMargins_mc.margin_mc.marginLink_chb.selected = false;
}
marginChange(sb,balise_mc);

//-----------padding
balise_mc.effectsMargins_mc.padding_mc.paddingTop_ns.value = sb.paddingTop;
balise_mc.effectsMargins_mc.padding_mc.paddingBottom_ns.value = sb.paddingBottom;
balise_mc.effectsMargins_mc.padding_mc.paddingRight_ns.value = sb.paddingRight;
balise_mc.effectsMargins_mc.padding_mc.paddingLeft_ns.value = sb.paddingLeft;
if( sb.paddingTop ==  sb.paddingBottom  && sb.paddingTop ==  sb.paddingLeft  && sb.paddingTop ==  sb.paddingRight){
	
	balise_mc.effectsMargins_mc.padding_mc.paddingLink_chb.selected = true;
}else{
	balise_mc.effectsMargins_mc.padding_mc.paddingLink_chb.selected = false;
}
paddingChange(sb,balise_mc);


}


public static function marginChange(sb:Balise,balise_mc:MovieClip){
	
	if(balise_mc.effectsMargins_mc.margin_mc.marginLink_chb.selected == true)
	{
		var margin:uint = balise_mc.effectsMargins_mc.margin_mc.marginTop_ns.value;
		//balise_mc.border_mc.borderRadius_mc.borderRadiusLink_chb.selected = false;
		balise_mc.effectsMargins_mc.margin_mc.marginBottom_ns.enabled = false;
		balise_mc.effectsMargins_mc.margin_mc.marginRight_ns.enabled = false;
		balise_mc.effectsMargins_mc.margin_mc.marginLeft_ns.enabled = false;
		
		balise_mc.effectsMargins_mc.margin_mc.marginBottom_ns.value = margin;
		balise_mc.effectsMargins_mc.margin_mc.marginRight_ns.value = margin;
		balise_mc.effectsMargins_mc.margin_mc.marginLeft_ns.value = margin;
		
		sb.margin = margin;
	
		
		
		
	}else{
		
		balise_mc.effectsMargins_mc.margin_mc.marginBottom_ns.enabled = true;
		balise_mc.effectsMargins_mc.margin_mc.marginRight_ns.enabled = true;
		balise_mc.effectsMargins_mc.margin_mc.marginLeft_ns.enabled = true;
		
		sb.marginTop = balise_mc.effectsMargins_mc.margin_mc.marginTop_ns.value;
		sb.marginBottom = balise_mc.effectsMargins_mc.margin_mc.marginBottom_ns.value;
		sb.marginRight = balise_mc.effectsMargins_mc.margin_mc.marginRight_ns.value;
		sb.marginLeft = balise_mc.effectsMargins_mc.margin_mc.marginLeft_ns.value;
		
	
		
	}

	Ki.baliseChange(sb);
	
}


public static function paddingChange(sb:Balise,balise_mc:MovieClip){
	
	if(balise_mc.effectsMargins_mc.padding_mc.paddingLink_chb.selected == true)
	{
		var padding:uint = balise_mc.effectsMargins_mc.padding_mc.paddingTop_ns.value;
		//balise_mc.border_mc.borderRadius_mc.borderRadiusLink_chb.selected = false;
		balise_mc.effectsMargins_mc.padding_mc.paddingBottom_ns.enabled = false;
		balise_mc.effectsMargins_mc.padding_mc.paddingRight_ns.enabled = false;
		balise_mc.effectsMargins_mc.padding_mc.paddingLeft_ns.enabled = false;
		
		balise_mc.effectsMargins_mc.padding_mc.paddingBottom_ns.value = padding;
		balise_mc.effectsMargins_mc.padding_mc.paddingRight_ns.value = padding;
		balise_mc.effectsMargins_mc.padding_mc.paddingLeft_ns.value = padding;
		
		sb.padding = padding;

		
		
		
	}else{
		
		balise_mc.effectsMargins_mc.padding_mc.paddingBottom_ns.enabled = true;
		balise_mc.effectsMargins_mc.padding_mc.paddingRight_ns.enabled = true;
		balise_mc.effectsMargins_mc.padding_mc.paddingLeft_ns.enabled = true;
		
		sb.paddingTop = balise_mc.effectsMargins_mc.padding_mc.paddingTop_ns.value;
		sb.paddingBottom = balise_mc.effectsMargins_mc.padding_mc.paddingBottom_ns.value;
		sb.paddingRight = balise_mc.effectsMargins_mc.padding_mc.paddingRight_ns.value;
		sb.paddingLeft = balise_mc.effectsMargins_mc.padding_mc.paddingLeft_ns.value;
		
	
		
	}

	Ki.baliseChange(sb);
	
}


public static function shadowChange(sb:Balise,balise_mc:MovieClip){
	
	sb.background.shadow.color = balise_mc.effectsMargins_mc.shadow_mc.color_cp.selectedColor;
	sb.background.shadow.vShadow = balise_mc.effectsMargins_mc.shadow_mc.vShadow_ns.value;
	sb.background.shadow.hShadow = balise_mc.effectsMargins_mc.shadow_mc.hShadow_ns.value;
	sb.background.shadow.blur = balise_mc.effectsMargins_mc.shadow_mc.blur_ns.value;
	Ki.baliseChange(sb);
	
}



public static function baliseBoxDraw(sb:Balise){
	
	
	
	sContainerBox.graphics.clear();
	//sContainerBox.graphics.beginFill(0x4AFFFF);
	sContainerBox.graphics.lineStyle(1, 0x4AFFFF, 1, false, LineScaleMode.NONE, CapsStyle.NONE, JointStyle.MITER, 10);
	
	/*var point1:Point = sb.globalToLocal(new Point(sb.x, sb.y));
	point1.x = point1.x + sPage.globalToLocal(sPage.x);
	point1.y = point1.y +  sPage.globalToLocal(sPage.y);
	
	var point2:Point = sb.globalToLocal(new Point(sb.x + sb.htmlWidth, sb.y));
	point2.x = point2.x +  sPage.globalToLocal(sPage.x);
	point2.y = point2.y +  sPage.globalToLocal(sPage.y);
	
	var point3:Point = sb.globalToLocal(new Point(sb.x + sb.htmlWidth, sb.y + sb.htmlHeight));
	point3.x = point3.x +  sPage.globalToLocal(sPage.x);
	point3.y = point3.y +  sPage.globalToLocal(sPage.y);
	
	var point4:Point = sb.globalToLocal(new Point(sb.x, sb.y + sb.htmlHeight));
	point4.x = point4.x +  sPage.globalToLocal(sPage.x);
	point4.y = point4.y +  sPage.globalToLocal(sPage.y);
	
	
	
	sContainerBox.graphics.moveTo(point1.x, point1.y);
	sContainerBox.graphics.lineTo(point2.x, point2.y);
	sContainerBox.graphics.lineTo(point3.x, point3.y);
	sContainerBox.graphics.lineTo(point4.x, point4.y);
	sContainerBox.graphics.lineTo(point1.x, point1.y);
	sContainerBox.graphics.endFill();*/
	
	//emplacementScene
	
	/*var point1:Point = sb.localToGlobal(new Point(sb.x, sb.y));
	point1.x = point1.x - 50;
	point1.y = point1.y - 220;
*/

	/*sContainerBox.graphics.moveTo(sb.x + sb.parent.x, sb.y +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.htmlWidth + sb.parent.x, sb.y +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.htmlWidth + sb.parent.x, sb.y + sb.htmlHeight +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.parent.x, sb.y + sb.htmlHeight +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x +  sb.parent.x, sb.y +  sb.parent.y);*/
	
	sContainerBox.graphics.moveTo(sb.x  + sb.parent.x, sb.y  + sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.htmlWidth + sb.parent.x, sb.y +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.htmlWidth + sb.parent.x, sb.y + sb.htmlHeight +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.parent.x, sb.y + sb.htmlHeight +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x  + sb.parent.x, sb.y +  + sb.parent.y);
	
	/*sContainerBox.graphics.moveTo(sb.x  + sb.baliseParent.x, sb.y  + sb.baliseParent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.width + sb.baliseParent.x, sb.y +  sb.baliseParent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.width + sb.baliseParent.x, sb.y + sb.height +  sb.baliseParent.y);
	sContainerBox.graphics.lineTo(sb.x + sb.baliseParent.x, sb.y + sb.height +  sb.parent.y);
	sContainerBox.graphics.lineTo(sb.x  + sb.baliseParent.x, sb.y +  + sb.baliseParent.y);*/
	
	sContainerBox.graphics.endFill();

	
	
}

public static function activeParagraphForm(){
	
		if(Selection.activeBaliseType == "Paragraph"){
		Ki.paragraphPosition(Selection.sParagraph);
		Position.texteScale(Selection.sParagraph);
}
	
}

/*
public static function pageSelect(sb:Balise,balise_mc:MovieClip){
	
		
	balise_mc.positionSize_mc.visible = false;
	balise_mc.pageSizeMarges_mc.visible = true;	
	balise_mc.couleurDegrade_mc.opacity_ns.enabled = false;
	

}*/
		
		








		
		
		}
	
}
