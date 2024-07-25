package com.nao.Basic {
	import flash.display.DisplayObject;
	import com.nao.Textes.Texte;
	import com.nao.Textes.Paragraph;
	import com.nao.Containers.Balise;
	import flash.geom.Point;
	import com.nao.Components.Bouton;
	import com.nao.Forms.InputText;
	
	import com.nao.Power.Ki;
	
	public class Position {
		
		private var _positionSystem:String;
		private var _master:Balise;
		private var _positionArray:Array = new Array();
		
		private var normalXLeft:String;
		private var normalXRight:String;
		private var normalXCenter:Number;
		private var normalYTop:Number;
		private var normalYBottom:Number;
		private var normalYCenter:Number;
		
		

		public function Position() {
			// constructor code
		}
		
		
		//------------------------------------Postion normal--------------------------------------------------
		//----------------------------------------------------------------------------------------------------
		
		public static function normalXRight(obj:Balise,balise:Balise):Number{
			obj.x =  balise.htmlLoad.width - obj.htmlLoad.width  - balise.paddingRight ;
			if(obj.parent != balise) obj.x += balise.x ;
			return obj.x;
		}
		
		public static function normalXLeft(obj:Balise,balise:Balise):Number{
			obj.x =  balise.paddingLeft;
			if(obj.parent != balise) obj.x += balise.x ;
			return obj.x;
		}
		
		public static function normalXCenter(obj:Balise,balise:Balise):Number{
			obj.x =  balise.htmlWidth/2 - obj.htmlWidth/2 ;
			//obj.x =  balise.width/2 - obj.width/2 ;
			if(obj.parent != balise) obj.x += balise.x ;
			return obj.x;
		}

		//-----------------
		
		public static function normalYTop (obj:Balise,balise:Balise):Number{
			obj.y =  balise.paddingTop;
			if(obj.parent != balise) obj.y += balise.y ;
			return obj.y;
		}
		
		public static function normalYBottom (obj:Balise,balise:Balise):Number{
			obj.y =  balise.htmlLoad.height - obj.htmlLoad.height - balise.paddingBottom ;
			if(obj.parent != balise) obj.y += balise.y ;
			return obj.y;
		}
		
		public static function normalYCenter (obj:Balise,balise:Balise):Number{
			
			obj.y = balise.htmlLoad.height/2 - obj.htmlLoad.height/2 ;
			if(obj.parent != balise) obj.y += balise.y ;
			return obj.y;
		}
		
	//------------------------------------Double normal--------------------------------------------------
		//--------------------------------------------------------------------------------------------------
		
		
		public static function normalXYRightTop(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXRight(obj,balise);
			var y:Number = normalYTop(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		
		//-----------------
		public static function normalXYRightCenter(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXRight(obj,balise);
			var y:Number = normalYCenter(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		//-----------------
		public static function normalXYRightBottom(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXRight(obj,balise);
			var y:Number = normalYBottom(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		//------------------------------------------------------------------------------------
		
		public static function normalXYCenterTop(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXCenter(obj,balise);
			var y:Number = normalYTop(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		
		//-----------------
		public static function normalXYCenterCenter(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXCenter(obj,balise);
			var y:Number = normalYCenter(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		//-----------------
		public static function normalXYCenterBottom(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXCenter(obj,balise);
			var y:Number = normalYBottom(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		//------------------------------------------------------------------------------------
		
		public static function normalXYLeftTop(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXLeft(obj,balise);
			var y:Number = normalYTop(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		
		//-----------------
		public static function normalXYLeftCenter(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXLeft(obj,balise);
			var y:Number = normalYCenter(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		
		//-----------------
		public static function normalXYLeftBottom(obj:Balise,balise:Balise):Point{
			
			var x:Number = normalXLeft(obj,balise);
			var y:Number = normalYBottom(obj,balise);
			
			var pos:Point = new Point(x,y);
			return pos;
		}
		//------------------------------------Master postion Convertion--------------------------------------------------
		//--------------------------------------------------------------------------------------------------
	/*
		public function XtoComponent(DisplayObject:D):Number{
			
		}
		
		public function componentToX():Number{
			
		}*/
		
		
		//------------------------------------Postion grid--------------------------------------------------
		//--------------------------------------------------------------------------------------------------
	
		
		public static function gridPosition (obj:Balise,balise:Balise,horizontalLevel:uint, verticalLevel:uint, horizontalPosition:uint, verticalPosition:uint):Point{
			
			var horizontalUnite:Number = (balise.htmlLoad.width/horizontalLevel)/2;
			var verticalUnite:Number = (balise.htmlLoad.height/verticalLevel)/2;
			
			var posX:Number = ( (balise.htmlLoad.width * (horizontalPosition/horizontalLevel)) - horizontalUnite) - obj.htmlLoad.width/2;
			var posY:Number = ( (balise.htmlLoad.height * (verticalPosition/verticalLevel)) - verticalUnite ) - obj.htmlLoad.height/2;
			
			obj.x = posX;
			obj.y = posY;
			
			var pos:Point = new Point(posX,posY);
			return pos;
		}
		
		
	public static function gridPositionMultiple (horizontalLevel:uint, verticalLevel:uint,container:Balise ){	
		
		for(var i=1;i<=horizontalLevel;i++)
		{
			for(var j=1;j<=verticalLevel;j++){
				
				var o:Bouton = new Bouton("O","",0,0,0,50,50);
				container.addChild(o);
				Position.gridPosition(o,container,horizontalLevel,verticalLevel,i,j);
				
			}
			
		}
	}
		
		//------------------------------------Postion Scale--------------------------------------------------
		//-------------------------------------------------------------------------------------------------

		
		
		//------------------------------------Postion After/Before--------------------------------------------------
		//-------------------------------------------------------------------------------------------------
		public static function afterX(obj:Balise, balise:Balise):Number{
			var posX:Number =  balise.x + balise.htmlWidth + balise.marginRight + obj.marginLeft  ;
			obj.x = posX;
			return posX ;
			
		}
		
		public static function beforeX(obj:Balise, balise:Balise):Number{
			var posX:Number = balise.x - obj.htmlWidth - obj.marginRight - balise.marginLeft ;
			obj.x = posX;
			return posX ;
		}
		
		
		
		public static function afterY(obj:Balise, balise:Balise):Number{
			var posY:Number = balise.y + balise.htmlHeight + obj.marginTop + balise.marginBottom  ;
			obj.y = posY;
			return posY ;
		}
		
		public static function beforeY(obj:Balise, balise:Balise):Number{
			var posY:Number = balise.y - obj.htmlHeight - obj.marginBottom - balise.marginTop  ;
			obj.x = posY;
			return posY ;
			
		}
		
		//------------------------------------ Size -------------------------------------------------
		//-------------------------------------------------------------------------------------------------
		
		public static function sameWidth(obj:Balise, balise:Balise, coeff:Number):Number{

			obj.fixedWidth = balise.htmlWidth * coeff;
			obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
			obj.scaleEnd.x = (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;
			return obj.fixedWidth;
			
		}
		
		public static function sameHeight(obj:Balise, balise:Balise, coeff:Number):Number{
		
			obj.fixedHeight = balise.htmlHeight * coeff;
			obj.scale.y = obj.fixedHeight/(obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom);
			return obj.fixedHeight;
		}
		
		
		
			//------------------------------------Postion Generale--------------------------------------------------
		//-------------------------------------------------------------------------------------------------
		
		public static function generalScale(obj:Balise):Point{
			
			var posX:Number;
			var posY:Number;
			
			if(obj.widthType == 0)
			{
				posX = obj.fixedWidth;	
				//obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
		
			}else if(obj.widthType == 1){
			
			//posX = obj.positionArray[1].htmlWidth * obj.scale.x ; //posX = (obj.positionArray[1].htmlWidth - (obj.x * 2) )* obj.scale.x ;
			posX = (obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight) * obj.scale.x ;
			obj.fixedWidth = posX;
			
			obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
			obj.scaleEnd.x = (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;
			}else if(obj.widthType == 2){
			//Prend tout le contenu sauf les marges
			posX = obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingRight - obj.positionArray[1].paddingLeft  ;	
			obj.fixedWidth = posX;
			//obj.scale.x = obj.fixedWidth/obj.positionArray[1].htmlWidth;
			obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
			obj.scaleEnd.x = (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;
			
			}else if(obj.widthType == 3){
			//L'ensemble de ses enfants plus les marges
	
			posX = obj.resizeBaliseWidth();
			
			obj.fixedWidth = posX;
			//obj.scale.x = obj.fixedWidth/obj.positionArray[1].htmlWidth;
			obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
			obj.scaleEnd.x = (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;
				
			}else if(obj.widthType == 4){
			//jusqu'au bout
			posX = obj.positionArray[1].htmlWidth - obj.fixedPositionX;
			obj.fixedWidth = posX;
			//obj.scale.x = obj.fixedWidth/obj.positionArray[1].htmlWidth;
			obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
			obj.scaleEnd.x = (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;

			
			}else if(obj.widthType == 5){
			//jusqu'au bout des pixel en commençant vers la fin
			
			
			}else if(obj.widthType == 6){
				
			//	if(obj.positionTypeX != 3){
					
			
			var posfixedEndX:Number = (obj.positionArray[1].htmlWidth  ) * obj.scaleEnd.x   ;
			// debut, posFin = taille
		/*obj.scaleEnd.x 	= (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;	*/
			var tempFixedPositionX:Number = obj.fixedPositionX;
			posX = Math.abs(posfixedEndX - obj.fixedPositionX);// + obj.positionArray[1].paddingLeft ;
			obj.fixedWidth = posX;
			
			obj.scale.x = obj.fixedWidth/(obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight);
			//obj.scale.x = obj.fixedWidth/obj.positionArray[1].htmlWidth;
			obj.fixedPositionX = tempFixedPositionX;
		//	obj.scaleEnd.x = (obj.fixedWidth + obj.fixedPositionX)/obj.positionArray[1].htmlWidth;
				//	}
			}else if(obj.widthType == 7){
			//jusqu'au bout des pixel en commençant vers la fin
				posX = sameWidth(obj,obj.positionArray[6],obj.coeffScaleX);
			
			}
			
			
			
			if(obj.heightType == 0)
			{
				posY = obj.fixedHeight;	
	

			}else if(obj.heightType == 1){
				
			posY = (obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom) * obj.scale.y ;
		//	posX = (obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight) * obj.scale.x ;

			obj.fixedHeight = posY;
			//obj.scale.y = obj.fixedHeight/obj.positionArray[1].htmlHeight;
			//obj.scale.y = obj.fixedHeight/(obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom);

				
			}else if(obj.heightType == 2){
				
			posY = obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom  ;
			obj.fixedHeight = posY;
			//obj.scale.y = obj.fixedHeight/obj.positionArray[1].htmlHeight;
			obj.scale.y = obj.fixedHeight/(obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom);

				
			}else if(obj.heightType == 3){
			posY = obj.resizeBaliseHeight();
			obj.fixedHeight = posY;
			//obj.scale.y = obj.fixedHeight/obj.positionArray[1].htmlHeight;
			obj.scale.y = obj.fixedHeight/(obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom);

			
			}else if(obj.heightType == 4){
			//jusqu'au bout
			posY = obj.positionArray[1].htmlHeight - obj.fixedPositionY;
			obj.fixedHeight = posY;
			//obj.scale.y = obj.fixedHeight/obj.positionArray[1].htmlHeight;
			obj.scale.y = obj.fixedHeight/(obj.positionArray[1].htmlHeight - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom);

			
			}else if(obj.heightType == 6){
			
			var posfixedEndY:Number = (obj.positionArray[1].htmlHeight  ) * obj.scaleEnd.y   ;
			var tempFixedPositionY:Number = obj.fixedPositionY;
			posY = Math.abs(posfixedEndY - obj.fixedPositionY);// + obj.positionArray[1].paddingLeft ;
			obj.fixedHeight  = posY;
			
			obj.scale.y = obj.fixedHeight /(obj.positionArray[1].htmlHeight  - obj.positionArray[1].paddingTop - obj.positionArray[1].paddingBottom);
			obj.fixedPositionY = tempFixedPositionY;
	
			}else if(obj.heightType == 7){
			
			posY = sameHeight(obj,obj.positionArray[7],obj.coeffScaleY);

			}
			
			obj.htmlWidth = posX ;
			obj.htmlHeight = posY;
			var pos:Point = new Point(posX,posY);
			return pos;
		}
		
		
		
		public static function generalPosition (obj:Balise):Point{
			
			var posX:Number = 0;
			var posY:Number = 0;
			var pos:Point = new Point(posX,posY);
			
			if(obj.positionTypeX == 0)
			{
			pos = gridPosition(obj,obj.positionArray[1],obj.positionArray[2].x,obj.positionArray[2].y,obj.positionArray[2].width,obj.positionArray[2].height);

			}
			else if (obj.positionTypeX == 1){
			
			posX = obj.positionArray[1].htmlWidth * obj.positionScale.x  ;
			//posX = ((obj.positionArray[1].htmlWidth - obj.positionArray[1].paddingLeft - obj.positionArray[1].paddingRight ) * obj.positionScale.x ) + obj.positionArray[1].paddingLeft  ;
			obj.fixedPositionX = posX;	
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
		
			}
			
			else if (obj.positionTypeX == 2){
			posX = obj.fixedPositionX  ;
			//obj.fixedPositionX = posX;	
		//	obj.positionScale.x = obj.fixedPositionX/(obj.positionArray[1].htmlWidth);
		//	obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
			}
			
			else if (obj.positionTypeX == 3){
			posX = normalXRight(obj,obj.positionArray[1]) ;
			obj.fixedPositionX = posX;	
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
			
				
			}
			
			else if (obj.positionTypeX == 4){
			posX = normalXCenter(obj,obj.positionArray[1]) ;
			obj.fixedPositionX = posX;	
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
			}
			
			else if (obj.positionTypeX == 5){
			posX = normalXLeft(obj,obj.positionArray[1]) ;
			obj.fixedPositionX = posX;	
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
			}
			// Après un objet
			else if (obj.positionTypeX == 6){
			posX = afterX(obj,obj.positionArray[5]);
			obj.fixedPositionX = posX;	
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
				/*trace("-----------Après Objet-------------" );
				trace("obj.positionArray[5]:" + obj.positionArray[5].name);
				trace("obj.positionArray[5].x:" + obj.positionArray[5].x);
				trace("obj.positionArray[5].fixedPositionX:" + obj.positionArray[5].fixedPositionX);
				trace("obj.x:" + obj.x);
				trace("obj.fixedPositionX:" + obj.fixedPositionX);*/
			}
			// Avant un objet
			else if (obj.positionTypeX == 7){
			posX = beforeX(obj,obj.positionArray[5]);
			obj.fixedPositionX = posX;	
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
				
				/*trace("-----------Avant Objet-------------" );
				trace("obj.positionArray[5]:" + obj.positionArray[5].name);
				trace("obj.positionArray[5].x:" + obj.positionArray[5].x);
				trace("obj.positionArray[5].fixedPositionX:" + obj.positionArray[5].fixedPositionX);
				trace("obj.x:" + obj.x);
				trace("obj.fixedPositionX:" + obj.fixedPositionX);*/
			}// Sur un objets
			else if (obj.positionTypeX == 8){
			posX = obj.positionArray[5].fixedPositionX;
			obj.fixedPositionX = posX;
			obj.positionScale.x = obj.fixedPositionX/obj.positionArray[1].htmlWidth;
			obj.scaleEnd.x = (obj.fixedWidth + posX)/obj.positionArray[1].htmlWidth;
				/*trace("-----------Sur Objet-------------" );
				trace("obj.positionArray[5]:" + obj.positionArray[5].name);
				trace("obj.positionArray[5].x:" + obj.positionArray[5].x);
				trace("obj.positionArray[5].fixedPositionX:" + obj.positionArray[5].fixedPositionX);
				trace("obj.x:" + obj.x);
				trace("obj.fixedPositionX:" + obj.fixedPositionX);*/
			
			}
			
			//centré,commence au centre
			//scaleX et scaleY dépende de la position en  et Y  pour rendre en compte les marge
			//bug avanr après objet
			
			
			
			//--------------------------
			
			
			if (obj.positionTypeY == 1){
			
			posY = obj.positionArray[1].htmlHeight * obj.positionScale.y ;
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
			}
			
			else if (obj.positionTypeY == 2){
			posY = obj.fixedPositionY ;// + obj.positionArray[1].y ;
			/*obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;*/
			}
			
			else if (obj.positionTypeY == 3){
			posY = normalYTop(obj,obj.positionArray[1]) ;
			
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
			}
			
			else if (obj.positionTypeY == 4){
			posY = normalYCenter(obj,obj.positionArray[1]) ;
			
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
			}
			
			else if (obj.positionTypeY == 5){
			posY = normalYBottom(obj,obj.positionArray[1]) ;
				
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
			}
			// Après un objet
			else if (obj.positionTypeY == 6){
			posY = afterY(obj,obj.positionArray[0]);
				
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
			}
			// Avant un objet
			else if (obj.positionTypeY == 7){
			posY = beforeY(obj,obj.positionArray[0]);
			
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
			}//Sur un objet
			else if (obj.positionTypeY == 8){
			posY = obj.positionArray[0].y;
			obj.fixedPositionY = posY;
			obj.positionScale.y = obj.fixedPositionY/obj.positionArray[1].htmlHeight;
			obj.scaleEnd.y = (obj.fixedHeight + posY)/obj.positionArray[1].htmlHeight;
				trace("obj.positionArray[0].y:" + obj.positionArray[0].y);
				trace("obj.fixedPositionY:" + obj.fixedPositionY);
				
			}
			
			
			if(obj.positionTypeX == 0)
			{
				
			obj.x = pos.x;
			obj.y = pos.y;

			}else{
				
			obj.x = posX;
			obj.y = posY;
			
			pos.x = posX ;
			pos.y = posY;
				
			}
			
						
			return pos;
			
			
		}
		
		
		 
			
		
		public static function texteScale(texte:Paragraph){
			
			
			
			if(texte.numRow == 1)
			{
			 texte.allHeight(texte.positionArray[1]);
			}else if (texte.numRow == 2) {
				texte.hitObjectY(texte.positionArray[4]);
			}else if (texte.numRow == 3) {
				//texte.row;
			}
			
			if(texte.texteWidthType == 0)
			{
			 texte.longeur(texte.htmlWidth);
			}else if(texte.texteWidthType == 1)
			{
			 texte.allWidth(texte.positionArray[1]);
			}else if (texte.texteWidthType == 2) {
				texte.hitObjectX(texte.positionArray[3]);
			}else if (texte.texteWidthType == 3) {
				texte.longeur(texte.positionArray[0].htmlWidth);
				//trace("texte.longeur(texte.positionArray[0].htmlWidth);");
			}else if (texte.texteWidthType == 4) {
				texte.longeur(texte.texteWidth);
				//trace("texte.longeur(texte.positionArray[0].htmlWidth);");
				//trace("jjjj");
			}
			
			
			
			
		}
	
		public static function permute(balise1:Balise, balise2:Balise)
		{
			var baliseTemp:Balise = new Balise(0,0,10,10);
			
			baliseTemp.positionTypeX = balise1.positionTypeX ;
			baliseTemp.positionTypeY = balise1.positionTypeY;
			baliseTemp.fixedPositionX = balise1.fixedPositionX;
			baliseTemp.fixedPositionY = balise1.fixedPositionY;
			baliseTemp.positionArray = balise1.positionArray;
			
			balise1.positionTypeX = balise2.positionTypeX ;
			balise1.positionTypeY = balise2.positionTypeY;
			balise1.fixedPositionX = balise2.fixedPositionX;
			balise1.fixedPositionY = balise2.fixedPositionY;
			balise1.positionArray = balise2.positionArray;
			
			balise2.positionTypeX = baliseTemp.positionTypeX ;
			balise2.positionTypeY = baliseTemp.positionTypeY;
			balise2.fixedPositionX = baliseTemp.fixedPositionX;
			balise2.fixedPositionY = baliseTemp.fixedPositionY;
			
			balise2.positionArray = baliseTemp.positionArray;
			
			
			generalPosition(balise1);
			generalPosition(balise2);
			
			
		}
		
		
			//------------------------------------Alignement--------------------------------------------------
		//-------------------------------------------------------------------------------------------------
		
		
		public static function alignementSpace (balise:Balise,positionTypeY:uint = 3):void{
			
		}
	
		//-------------------------- Alignement uniforme début first-left (1)
		public static function alignementHorizontalLeftX(balise:Balise,positionTypeY:uint = 3):void{
			
			var lastChild:uint = balise.satTab.length - 1;
			var space:Number = (balise.htmlWidth - balise.marginLeft - balise.marginRight )/ (balise.satTab.length ) ;
			var spacePercent:Number = space/(balise.htmlWidth);
			
			
		//	balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 5;
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 3;
			balise.satTab[0].heightType = 3;

			for(var i=1; i<=lastChild; i++){
			
		//	balise.satTab[i].positionArray[1] = balise;
			balise.satTab[i].positionTypeX = 1;
			balise.satTab[i].positionTypeY = positionTypeY;
			balise.satTab[i].positionScale.x	= balise.satTab[i - 1].positionScale.x + spacePercent;
			}	
			
		}
		
		//-------------------------- Alignement uniforme début first-left & last-right (2)
		
		public static function alignementHorizontalLeftRightX(balise:Balise,positionTypeY:uint = 3):void{
			
			var lastChild:uint = balise.satTab.length - 1;
			var space:Number = (balise.htmlWidth - balise.marginLeft - balise.marginRight  - (balise.satTab[lastChild].htmlWidth ))/ (balise.satTab.length - 1 ) ;
			var spacePercent:Number = space/(balise.htmlWidth);
		
			
		//	balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 5;
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 3;
			balise.satTab[0].heightType = 3;
			
			if(balise.satTab.length > 1)
			{
			//balise.satTab[lastChild].positionArray[1] = balise;
			balise.satTab[lastChild].positionTypeX = 3;
			balise.satTab[lastChild].positionTypeY = positionTypeY;
			balise.satTab[lastChild].widthType = 3;
			balise.satTab[lastChild].heightType = 3;
			}
		
			for(var i=1; i<lastChild; i++){
			
		//	balise.satTab[i].positionArray[1] = balise;
			balise.satTab[i].positionTypeX = 1;
			balise.satTab[i].positionTypeY = positionTypeY;
			balise.satTab[i].positionScale.x	= balise.satTab[i - 1].positionScale.x + spacePercent;
			}	
			
		}
		
		//-------------------------- Alignement uniforme espaces first-left (3)
		
		public static function alignementHorizontalLeftSpace (balise:Balise,positionTypeY:uint = 3):void{
			
			var currantSize:Number;
			var totalSize:Number = 0;
			var mediumSize:Number = 0;
			var spacePercent:Number;
			var lastChild:uint = balise.satTab.length - 1;
			
			//balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 5;
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 3;
			balise.satTab[0].heightType = 3;
			
			for(var i:int=0; i<= lastChild; i++){
			
				currantSize = balise.satTab[i].htmlWidth ;
				totalSize = totalSize + currantSize;
				
			}	
			
			
			totalSize = balise.htmlWidth  - balise.paddingLeft - totalSize 
			mediumSize = totalSize/(balise.satTab.length);
			
			for(i = 1; i<=lastChild; i++){
			
				balise.satTab[i].positionScale.x = 	balise.satTab[i-1].positionScale.x +  (mediumSize)/(balise.htmlWidth)+ balise.satTab[i-1].htmlWidth/(balise.htmlWidth);
			//	balise.satTab[i].positionArray[1] = balise;
				balise.satTab[i].positionTypeX = 1;
				balise.satTab[i].positionTypeY = positionTypeY;
				balise.satTab[i].widthType = 3;
				balise.satTab[i].heightType = 3;
				
			}
			
		
			
		}
		
		//-------------------------- Alignement uniforme espaces first- left & last-right  (4)
		
		public static function alignementHorizontalLeftRightSpace (balise:Balise,positionTypeY:uint = 3):void{
		
			var currantSize:Number;
			var totalSize:Number = 0;
			var mediumSize:Number = 0;
			var spacePercent:Number;
			var lastChild:uint = balise.satTab.length - 1;
			
			//balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 5;
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 3;
			balise.satTab[0].heightType = 3;
			
			if(balise.satTab.length > 1)
			{
			//balise.satTab[lastChild].positionArray[1] = balise;
			balise.satTab[lastChild].positionTypeX = 3;
			balise.satTab[lastChild].positionTypeY = positionTypeY;
			balise.satTab[lastChild].widthType = 3;
			balise.satTab[lastChild].heightType = 3;
			}
			
			for(var i:int=0; i<= lastChild; i++){
			
				currantSize = balise.satTab[i].htmlWidth ;
				totalSize = totalSize + currantSize;
				
			}	
			
			
			totalSize = balise.htmlWidth  - balise.paddingLeft - balise.paddingRight - totalSize 
			mediumSize = totalSize/(balise.satTab.length - 1) ;
			spacePercent = mediumSize/balise.htmlWidth;
			
			for(i = 1; i<lastChild; i++){
			
				balise.satTab[i].positionScale.x = 	balise.satTab[i-1].positionScale.x +  (mediumSize)/(balise.htmlWidth) + balise.satTab[i-1].htmlWidth/(balise.htmlWidth);
				//balise.satTab[i].positionArray[1] = balise;
				balise.satTab[i].positionTypeX = 1;
				balise.satTab[i].positionTypeY = positionTypeY;
				balise.satTab[i].widthType = 3;
				balise.satTab[i].heightType = 3;
				
				
			}
			
		}
		
		
		//-------------------------- Alignement uniforme espaces centre (5)
		
		public static function alignementHorizontalCentreSpace (balise:Balise,positionTypeY:uint = 3):void{
			
			var currantSize:Number;
			var totalSize:Number = 0;
			var mediumSize:Number = 0;
			var spacePercent:Number;
			var lastChild:uint = balise.satTab.length - 1;
			
			
			for(var i:int=0; i<= lastChild; i++){
			
				currantSize = balise.satTab[i].htmlWidth ;
				totalSize = totalSize + currantSize;
				
			}	
			
			
			totalSize = balise.htmlWidth  - balise.paddingLeft - totalSize 
			mediumSize = totalSize/(balise.satTab.length + 1);
			
			
			balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 5;
			balise.satTab[0].positionScale.x = (mediumSize)/(balise.htmlWidth);
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 3;
			balise.satTab[0].heightType = 3;
	

			for(i = 1; i<=lastChild; i++){
			
				balise.satTab[i].positionScale.x = 	balise.satTab[i-1].positionScale.x +  (mediumSize)/(balise.htmlWidth)+ balise.satTab[i-1].htmlWidth/(balise.htmlWidth);
				balise.satTab[i].positionArray[1] = balise;
				balise.satTab[i].positionTypeX = 5;
				balise.satTab[i].positionTypeY = positionTypeY;
				balise.satTab[i].widthType = 3;
				balise.satTab[i].heightType = 3;
				
			}
			
		}
		
	
		
		
		//-------------------------- Alignement uniforme debut centre (6)
		
		public static function alignementHorizontalSpaceX (balise:Balise,positionTypeY:uint = 3):void{
			
			var lastChild:uint = balise.satTab.length - 1;
			var space:Number = (balise.htmlWidth - balise.marginLeft - balise.marginRight )/ (balise.satTab.length + 1) ;
			var spacePercent:Number = space/(balise.htmlWidth);
			
			
			balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 1;
			balise.satTab[0].positionScale.x = spacePercent;
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 3;
			balise.satTab[0].heightType = 3;

			for(var i=1; i<=lastChild; i++){
			
			balise.satTab[i].positionArray[1] = balise;
			balise.satTab[i].positionTypeX = 1;
			balise.satTab[i].positionTypeY = positionTypeY;
			balise.satTab[i].positionScale.x	= balise.satTab[i - 1].positionScale.x + spacePercent;
			}	
			
			
			
			
		}
		
		//---------------------------Alignement simple-----------------------------
		
		//
		
		public static function alignementHorizontalSimple (balise:Balise,positionTypeY:uint = 3, space:uint=10, E0X0:Boolean = true):void{
			
			var lastChild:uint = balise.satTab.length - 1;
			
			
			balise.satTab[0].positionArray[1] = balise;
			balise.satTab[0].positionTypeX = 2;
			
			if(E0X0 == true){
				balise.fixedPositionX = 0 ;
			}else{
				balise.fixedPositionX = space ;
			}
			balise.satTab[0].disposition = 0;
			balise.satTab[0].positionTypeY = positionTypeY;
			balise.satTab[0].widthType = 9;
			balise.satTab[0].heightType = 9;
			Ki.balisePosition(balise.satTab[0]);

			for(var i:uint = 1; i<=lastChild; i++){
			
				balise.satTab[i].disposition = 0;
				balise.satTab[i].positionArray[1] = balise;
				balise.satTab[i].positionTypeX = 6;
				balise.satTab[i].positionArray[5] = balise.satTab[i - 1] ;
				balise.satTab[i].positionTypeY = positionTypeY;
				balise.satTab[i].widthType = 9;
				balise.satTab[i].heightType = 9;
				Ki.balisePosition(balise.satTab[i]);
			}
			//trace("dispo");
				
			
		}
		
	
		
		//------------------------------------------------------------------- DISPOSITION------------------------------------------------------
		
		public static function dispositionChange(balise:Balise):void{
			
		//	balise.disposition = 4;
		//	trace(balise.disposition);
			switch(balise.disposition)
			{
				case 1:alignementHorizontalLeftX(balise); 				
				break;
				
				case 2:alignementHorizontalLeftRightX(balise);
				break;
				
				case 3:alignementHorizontalLeftSpace(balise);
				break;
				
				case 4:alignementHorizontalLeftRightSpace(balise);
				break;
				
				case 5:alignementHorizontalCentreSpace(balise);
				break;
				
				case 6:alignementHorizontalSpaceX(balise);
				break;
				
				case 10:alignementHorizontalSimple(balise);
				break;
				
			}
			
		}
		
		
		
		
	
	//------------------------------------Getter/Setter--------------------------------------------------
	//--------------------------------------------------------------------------------------------------
	
	//--------------------	
		public function get positionSystem(): String {
			return _positionSystem;
		}
		
		public function set positionSystem(positionSystem: String) {

			_positionSystem = positionSystem;
		}
		
		//--------------------	
		public function get master(): Balise {
			return _master;
		}
		
		public function set master(master: Balise) {

			_master = master;
		}
	
	
	
		

	}
	
}
