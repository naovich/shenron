package  com.nao.Containers {
	
	import flash.html.HTMLLoader;
	import flash.display.Sprite;
	import com.nao.Basic.Background;
	import com.nao.Basic.Border;
	import com.nao.Pages.Grid;
	import com.nao.Transform.Transforme;
	import com.nao.Power.Ki;
	import com.nao.Effects.Shadow;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;
	import com.nao.Basic.Position;
	import flash.events.MouseEvent;
	import com.nao.Containers.Div;
	import com.nao.General.Selection;
	import flash.display.MovieClip;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem
    import flash.events.ContextMenuEvent;
    import com.nao.Modules.Module;
    import com.nao.Images.ImageBalise;
	
	
	
	
	
	public class Balise extends Sprite{
		
		
		private var _opacity:Number = 1;
		
		private var _display:String = "block"; //block, inline, none
		private var _visibility:Boolean = true; //block, inline, none
		private var _zIndex:int;
		private var _background:Background = new Background();
		private var _border:Border = new Border();
		private var _column:int;
		private var _codeHTML:XML ;
		private var _htmlLoad:HTMLLoader = new HTMLLoader();
		private var _transforme:Transforme = new Transforme();
		//10
		private var _padding: uint = 0;
		private var _paddingRight: uint = 0;
		private var _paddingLeft: uint = 0;
		private var _paddingTop: uint = 0;
		private var _paddingBottom: uint = 0;
		//10
		private var _margin: uint = 0;
		private var _marginRight: uint = 0;
		private var _marginLeft: uint = 0;
		private var _marginTop: uint = 0;
		private var _marginBottom: uint = 0;
		private var _gridPosition:Rectangle = new Rectangle(0,0,0,0);
		
		private var _positionTypeX:int = 1; 
		private var _positionTypeY:int = 1; 
		
		private var _fixedPositionX:Number = 0; 
		private var _fixedPositionY:Number  = 0; 
		
		private var _widthType:uint = 1; 
		private var _heightType:uint = 1; 
		
		private var _fixedWidth:Number = 50; 
		private var _fixedHeight:Number  = 50;
		
		private var _coeffScaleX:Number = 1;
		private var _coeffScaleY:Number = 1;

		
		private var _scale:Point = new Point(1,1);
		private var _scaleEnd:Point = new Point(1,1);
		private var _positionScale:Point = new Point(0,0);
		private var _papa:Balise;
		var s:Sprite = new Sprite();
		//private var _positionArray:Array = new Array("followObjectY","master",_gridPosition,"hitObjectX","hitObjectY","followObjectX","sizeX", "sizeY");
		
		private var _positionArray:Array = new Array(s,s,_gridPosition,s,s,s,s,s);
		private var _childTab:Array = new Array();
		private var _satTab:Array = new Array();
		private var _followersTab:Array = new Array();
		private var _disposition:uint = 0;
		private var _baliseType:String = "Balise";
		private var _baliseName:String = "Balise";
		public static var staticId: int = 0;
		private var papaBol = false;
		private var _baliseParent:Balise;
		private var _moduleParent:Balise;
		
		private var _debutCol:int = -1;
		
		


	

		

		public function Balise(x:Number, y:Number, width:Number, height:Number, dispo:uint = 0 ){
			
			_codeHTML = <div></div>;
			_disposition = dispo;
			this.x = x;
			this.y = y;
			this._htmlLoad.width = width;
			this._htmlLoad.height = height;
			this.htmlLoad.paintsDefaultBackground = false ;
			this.addChild(_htmlLoad);
			
			
			this._transforme.rotate = 0;
			this._transforme.skew.x = 0;
			this._transforme.skew.y = 0;
			this.positionArray[5] = this;
			
			this.fixedPositionX = x;
			this.fixedPositionY = y;
			
			this.fixedWidth = width;
			this.fixedHeight = height;
		
		
		
			this.addEventListener(MouseEvent.CLICK, baliseClick);
			this.positionArray[0] = this;
			this.positionArray[1] = this;
			this.positionArray[5] = this;
			this.positionArray[6] = this;
			this.positionArray[7] = this;
			
			this.scale.x = 1;
			this.scale.x = 1;
			
			this.positionTypeX = 2;
			this.positionTypeY = 2;
			_moduleParent = this;
			
			
			

		Ki.baliseChange(this);

			
		}
		
		//---------------------------------------------METHODES---------------------------------------------
		
		/*public function colorChange(balise:Balise, color1:uint, color2:uint){
			
			for(var i:uint = 0; i<= balise.children; i++){
				
				if( balise.getChildAt(i).background.backgroundColor = color1)
				{
					balise.getChildAt(i).background.backgroundColor = color2;
				}
				
				
				
			}
			
		}
		*/
		
		/*private function baliseCM(){
			
			this.contextMenu = contextMenuBalise;
			contextMenuBalise.customItems.push(indexBg);
			indexBg.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, indexBackground);
		}*/
		
		
		public function resizeBalise():Point{
			
			var pointFinalX:uint = 0;
			var pointFinalY:uint = 0;
			
			for( var i:uint = 0; i< this.childTab.length; i++){
				
			if(pointFinalX <  this.childTab[i].x + this.childTab[i].htmlWidth && this.childTab[i].visible == true )  pointFinalX =  this.childTab[i].x + this.childTab[i].htmlWidth ;
			if(pointFinalY <  this.childTab[i].y + this.childTab[i].htmlHeight && this.childTab[i].visible == true )  pointFinalY =  this.childTab[i].y + this.childTab[i].htmlHeight ;
				
			}
			
			this.htmlHeight = pointFinalY + this.paddingBottom ;//+ balise.paddingTop ;
			this.htmlWidth = pointFinalX + this.paddingRight + this.paddingLeft  ;
			
			var point:Point = new Point();
			point.x = this.htmlWidth;
			point.y = this.htmlHeight;
			
			return point;
			
			
		}
		
		
		public function resizeBaliseWidth():Number{
			
			var pointFinalX:uint = 0;
			
			
			for( var i:uint = 0; i< this.childTab.length; i++){
				
			if(pointFinalX <  this.childTab[i].x + this.childTab[i].htmlWidth && this.childTab[i].visible == true )  pointFinalX =  this.childTab[i].x + this.childTab[i].htmlWidth ;
		
				
			}
			this.htmlWidth = pointFinalX + this.paddingRight + this.paddingLeft  ;
			
			
			return this.htmlWidth; 
		}
		
		public function resizeBaliseHeight():Number{
			
			
			var pointFinalY:uint = 0;
			
			for( var i:uint = 0; i< this.childTab.length; i++){
				
			if(pointFinalY <  this.childTab[i].y + this.childTab[i].htmlHeight && this.childTab[i].visible == true)  pointFinalY =  this.childTab[i].y + this.childTab[i].htmlHeight ;
				
			}
			
			this.htmlHeight = pointFinalY + this.paddingBottom ;//+ balise.paddingTop ;
			return this.htmlHeight;
		}
		
		//----------------------------------------------Equalize------------------------------------------
		
		
		
		
		private function baliseClick(e:MouseEvent){
			
		//	trace(this.typeBalise);
			//trace(e.currentTarget);
			e.stopPropagation();
			
			var st:Sprite =  stage.getChildAt(0) as Sprite;
			var balise_mc = st.getChildByName("balise_mc");
			
			Selection.selectBalise(e,balise_mc);


		
			
		}
		
		

		public function modify(grille:Grid, column:int,debutCol:int=-1, x:Number = 0,width:Number = 200){
		
			var wpos:Number;
			var xpos:Number;
			var xw:Point = new Point()
		
		if(debutCol >= 0)
			{
				if(debutCol == 0){
					xpos = 0;
					
					
				}else{
					xpos = grille.columnArray[debutCol - 1].x;
				}
			
				
				}else{
				xpos = x;
			}
			
			
			
			
			if(column >= 0)
			{
				//wpos =  grid.colWidth(column) + 20;
				if(xpos == 0)
				{
					if(column == 0)
					{
						wpos = grille.page.htmlWidth;
						xpos = 0;
						
					}else{
						wpos =  grille.colWidth(column) + grille.marginLeft;
					}
					
					
				
				
				}else{
					wpos =  grille.colWidth(column);
				
					
				}
				
			}else{
				wpos = width;
			}
			
			
			xw.x = xpos;
			xw.y = wpos;
			
			
			/*trace("wpos:" + wpos);
			trace("xw:" + xw.y);*/
			return xw;
	
			
	}	
		
	public function modifyX(grille:Grid,debutCol:int=-1, x:Number = 0):Number{
		
		var xpos:Number;
		//var xw:Number ;
		
		if(debutCol >= 0)
			{
				if(debutCol == 0){
					xpos = 0;
					
					
				}else{
					xpos = grille.columnArray[debutCol - 1].x;
				}
			
				
				}else{
				xpos = x;
			}
			
			return xpos;

	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//-------------------------------------------GETTER/SETTER------------------------------------------	
		public function get htmlWidth(): Number {
			return _htmlLoad.width ;
		}
		
		public function set htmlWidth(htmlWidth: Number) {
			this._htmlLoad.width = htmlWidth;
			
			Ki.baliseChange(this);
		}
		
		public function get htmlHeight(): Number {
			return _htmlLoad.height ;
		}
		
		public function set htmlHeight(htmlHeight: Number) {
			this._htmlLoad.height = htmlHeight;
			//imageBalise.htmlLoad.height = htmlHeight;

			Ki.baliseChange(this);
		}
		
	
		public function get opacity(): Number {
			return _opacity * 100;
		}
		
		public function set opacity(opacity: Number) {
			_opacity = opacity/100;
			Ki.baliseChange(this);
		}
		
		
		
		public function get display(): String {
			return _display;
		}
		
		public function set display(display: String) {
			_display = display;
			Ki.baliseChange(this);
		}
		
		public function get visibility(): Boolean {
			return _visibility;
		}
		
		public function set visibility(visibility: Boolean) {
			_visibility = visibility;
			Ki.baliseChange(this);
		}
		
		
		public function get zIndex(): int {
			return _zIndex;
		}
		
		public function set zIndex(zIndex: int) {
			_zIndex = zIndex;
			Ki.baliseChange(this);
		}
		
		public function get background(): Background {
			return _background;
		}
		
		public function set background(background: Background) {
			_background = background;
			Ki.baliseChange(this);
			
		}
		
		public function get border(): Border {
			return _border;
		}
		
		public function set border(border: Border) {
			_border = border;
			Ki.baliseChange(this);
		}
		/*
		public function get shadow(): Shadow {
			return _shadow;
		}
		
		public function set shadow(shadow: Shadow) {
			_shadow = shadow;
			Ki.baliseChange(this);
		}*/
		
		
		public function get codeHTML(): XML {
			return _codeHTML;
		}
		
		public function set codeHTML(codeHTML: XML) {
			_codeHTML = codeHTML;
			Ki.baliseChange(this);
		}
		
		
		public function get htmlLoad(): HTMLLoader {
			return _htmlLoad;
		}
		
		public function set htmlLoad(htmlLoad: HTMLLoader) {
			_htmlLoad = htmlLoad;
		}
		
		public function get transforme(): Transforme {
			return _transforme;
		}
		
		public function set transforme(transforme: Transforme) {
			_transforme = transforme;
			Ki.baliseChange(this);
		}
		
		//---------------
		public function get padding(): uint {
			return _padding;
		}

		public function set padding(padding: uint) {
			_padding = padding;
			_paddingRight = padding;
			_paddingLeft = padding;
			_paddingTop = padding;
			_paddingBottom =  padding;
			
		}
		
		//---------------
		public function get paddingRight(): uint {
			return _paddingRight;
		}

		public function set paddingRight(paddingRight: uint) {
			_paddingRight = paddingRight;
			Ki.baliseChange(this);
		}

		//---------------
		public function get paddingLeft(): uint {
			return _paddingLeft;
		}

		public function set paddingLeft(paddingLeft: uint) {
			_paddingLeft = paddingLeft;
			Ki.baliseChange(this);
		}
		//---------------
		public function get paddingTop(): uint {
			return _paddingTop;
		}

		public function set paddingTop(paddingTop: uint) {
			_paddingTop = paddingTop;
			Ki.baliseChange(this);
		}

		//---------------
		public function get paddingBottom(): uint {
			return _paddingBottom;
		}

		public function set paddingBottom(paddingBottom: uint) {
			_paddingBottom = paddingBottom;
			Ki.baliseChange(this);
		}
		
		//---------------
		public function get margin(): uint {
			return _margin;
		}

		public function set margin(margin: uint) {
			_margin = margin;
			_marginRight = margin;
			_marginLeft = margin;
			_marginTop = margin;
			_marginBottom =  margin;
			
		}
		
		//---------------
		public function get marginRight(): uint {
			return _marginRight;
		}

		public function set marginRight(marginRight: uint) {
			_marginRight = marginRight;
			Ki.baliseChange(this);
		}

		//---------------
		public function get marginLeft(): uint {
			return _marginLeft;
		}

		public function set marginLeft(marginLeft: uint) {
			_marginLeft = marginLeft;
			Ki.baliseChange(this);
		}
		//---------------
		public function get marginTop(): uint {
			return _marginTop;
		}

		public function set marginTop(marginTop: uint) {
			_marginTop = marginTop;
			Ki.baliseChange(this);
		}

		//---------------
		public function get marginBottom(): uint {
			return _marginBottom;
		}

		public function set marginBottom(marginBottom: uint) {
			_marginBottom = marginBottom;
			Ki.baliseChange(this);
		}
		
		//---------------
		public function get positionArray(): Array {
			return _positionArray;
		}

		public function set positionArray(positionArray: Array) {
			_positionArray = _positionArray;
			Ki.baliseChange(this);
		}
		
		//---------------
		public function get gridPosition(): Rectangle {
			return _gridPosition;
		}

		public function set gridPosition(gridPosition: Rectangle) {
			_gridPosition = gridPosition;
			
			positionArray[2] = gridPosition;
			Ki.baliseChange(this);
		}
		
		//---------------
		public function get scale(): Point {
			return _scale;
		}

		public function set scale(scale: Point) {
			_scale = scale;
			
		}
		//---------------
		public function get scaleEnd(): Point {
			return _scaleEnd;
		}

		public function set scaleEnd(scaleEnd: Point) {
			_scaleEnd = scaleEnd;
			
		}
		
		//---------------
		public function get positionScale(): Point {
			return _positionScale;
		}

		public function set positionScale(positionScale: Point) {
			_positionScale = positionScale;
			
		}
		
		//--------------------	
		public function get column(): int {
			return _column;
		}
		
		public function set column(column: int) {
			_column = column;
		}
		
	
		//--------------------	
		public function get positionTypeX(): int {
			return _positionTypeX;
		}
		
		public function set positionTypeX(positionTypeX: int) {
			_positionTypeX = positionTypeX;
			
		}
		//--------------------	
		public function get positionTypeY(): int {
			return _positionTypeY;
		}
		
		public function set positionTypeY(positionTypeY: int) {
			_positionTypeY = positionTypeY;
			
		}
		//--------------------	
		public function get fixedPositionX(): Number {
			return _fixedPositionX;
		}
		
		public function set fixedPositionX(fixedPositionX: Number) {
			_fixedPositionX = fixedPositionX;
			
		}
		//--------------------	
		public function get fixedPositionY(): Number {
			return _fixedPositionY;
		}
		
		public function set fixedPositionY(fixedPositionY: Number) {
			_fixedPositionY = fixedPositionY;
			
		}
		
		//--------------------	
		public function get widthType(): uint {
			return _widthType;
		}
		
		public function set widthType(widthType: uint) {
			_widthType = widthType;
			
		}
		
		//--------------------	
		public function get heightType(): uint {
			return _heightType;
		}
		
		public function set heightType(heightType: uint) {
			_heightType = heightType;
			
		}
		
		//--------------------	
		public function get fixedWidth(): Number {
			return _fixedWidth;
		}
		
		public function set fixedWidth(fixedWidth: Number) {
			_fixedWidth = fixedWidth;
			
			if(this.widthType == 0)
			{
			this.htmlWidth = fixedWidth;
			}
		}
		
		//--------------------	
		public function get fixedHeight(): Number {
			return _fixedHeight;
		}
		
		public function set fixedHeight(fixedHeight: Number) {
			_fixedHeight = fixedHeight;
			
			if(this.heightType == 0)
			{
			this.htmlHeight = fixedHeight;
			}
		}
		//--------------------
		
		public function get coeffScaleX(): uint {
			return _coeffScaleX;
		}
		
		public function set coeffScaleX(coeffScaleX: uint) {
			_coeffScaleX = coeffScaleX;
			
		}
		
		//--------------------
		
		public function get coeffScaleY(): uint {
			return _coeffScaleY;
		}
		
		public function set coeffScaleY(coeffScaleY: uint) {
			_coeffScaleY = coeffScaleY;
			
		}
		
		//--------------------	
		public function get childTab(): Array {
			return _childTab;
		}
		
		public function set childTab(childTab: Array) {
			_childTab = childTab;
			
		}
		
		//--------------------	
		public function get followersTab(): Array {
			return _followersTab;
		}
		
		public function set followersTab(followersTab: Array) {
			_followersTab = followersTab;
			
		}
	
		
		public function addBalise(child:Balise):void{
			this.addChild(child);
			
			childTab.push({balise: child,name: child.name});
			
			child.positionArray[1] = this;
		
			if(this.childTab.length > 1)
			{
				child.positionArray[0] = this.childTab[0].balise;
				child.positionArray[5] = this.childTab[0].balise;
				
				this.childTab[0].balise.positionArray[0] =  this.childTab[1].balise;
				this.childTab[0].balise.positionArray[5] =  this.childTab[1].balise;
				
				
			}else{
				child.positionArray[0] = this;
				child.positionArray[5] = this;
			}
			
			
			//trace("child.positionArray[0]:" +  child.positionArray[0].name);
			child.baliseParent = this;
			child.scale.x =  child.htmlWidth/this.htmlWidth;
			child.scale.y =  child.htmlHeight/this.htmlHeight;
			
			
			
			child.positionScale.x = child.x/this.htmlWidth;
			child.positionScale.y = child.y/this.htmlHeight;
			
			child.fixedPositionX = child.x;
			child.fixedPositionY = child.y;
			
			child.scaleEnd.x = (child.fixedWidth + child.fixedPositionX)/child.positionArray[1].htmlWidth;

			child.scaleEnd.y = (child.fixedHeight + child.fixedPositionY)/child.positionArray[1].htmlHeight;
			if (child.papaBol == false)
			{
				
				//trace(papaBol);
			child._papa = this;
			child.papaBol = true;
			}
			
			//child._papa = this;
			child.visible = true;
			//satTab.push(child);
		}
		
		public function removeBalise(child:Balise):void{
			this.removeChild(child);
			childTab.removeAt(childTab.indexOf(child));
			satTab.removeAt(satTab.indexOf(child));
			

			child.visible = false;
		}
		
		
		
		
		//--------------------	
		public function get satTab(): Array {
			return _satTab;
		}
		
		public function set satTab(satTab: Array) {
			_satTab = satTab;
			
		}
		
		
		public function addSat(sat:Balise):void{
			//removeSat(sat);
			satTab.push(sat);
			if(sat.parent == null){
				this.addBalise(sat);
			}
			sat.positionArray[1] = this;
			sat.visible = true;
		}
		
		public function removeSat(sat:Balise):void{
			satTab.removeAt(_satTab.indexOf(sat));
			sat.visible = false;
		}
		
		public function addFollower(fol:Balise):void{
			//removeSat(sat);
			
			
			
			var lastChild:uint = _followersTab.length;
			var isHere:Boolean = false;
				
				for(var i:uint = 0; i<=lastChild; i++){
				
					if(_followersTab[i] == fol){
						isHere = true;
						break;
					}
					
				}	
				
				if(isHere == false){
					followersTab.push(fol);
				}
		
		}
		
		public function removeFollower(fol:Balise):void{
			followersTab.removeAt(_followersTab.indexOf(fol));
		
		}
		
		
		
	//--------------------	
		public function get disposition(): uint {
			return _disposition;
		}
		
		public function set disposition(disposition: uint) {
			_disposition = disposition;
			//Position.dispositionChange(this);
			
		}
		
		public function get baliseType(): String {
			return _baliseType;
		}
		
		public function set baliseType(typeBalise: String) {
			_baliseType = baliseType;
		}
		
		public function get baliseName(): String {
			return _baliseName;
		}
		
		public function set baliseName(baliseName: String) {
			_baliseName = baliseName;
		}
		
		
		public function get papa(): Balise {
			return _papa;
		}
		
	
		
		//---------------------	
		public function get debutCol(): int {
			return _debutCol;
		}

		public function set debutCol(debutCol: int) {
			_debutCol = debutCol;
		}
		
		
		//---------------------	
		public function get baliseParent(): Balise {
			return _baliseParent;
		}

		public function set baliseParent(baliseParent: Balise) {
			_baliseParent = baliseParent;
		}
		
		
		//---------------------	
		public function get moduleParent(): Balise {
			return _moduleParent;
		}

		public function set moduleParent(moduleParent: Balise) {
			_moduleParent = moduleParent;
		}





	}


}