package com.nao.General  {
	import com.nao.Themes.Theme;
	import com.nao.Pages.Page; 
	import com.nao.General.Selection;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	public class Website {

		
		private var _name:String;
		private var _pageTab:Array = new Array(); ;
		private var _theme:Theme;
		private var _activePage:Page;
		private var _idWebsite:uint;
		private static var _nbWebsite:uint = 0;
		private var _activeTabPageX:Number;
		private var _containerTabPage:Sprite = new Sprite();
		
		
		public function Website() {
			// constructor code
			_name = "Site web style-" + _nbWebsite.toString() ;
			_nbWebsite ++;
			this._idWebsite = _nbWebsite;
			
			//selectedPage = 0;
			Shenron.activeProject.activeWebsite = this;
			Selection.sWebsite = this;
			
			Shenron.activeProject.websiteTab.push(this);
			
			
			
			var ll:OngletLatMC = new OngletLatMC();
			ll.label_txt.text = (Shenron.activeProject.websiteTab.length).toString();
			ll.label_txt.mouseEnabled = false;
			//ll.activeTab_mc.mouseEnabled = false;
			ll.buttonMode = true;
			Shenron.activeProject.containerTab.addChild(ll);
			ll.y = (Shenron.activeProject.websiteTab.length - 1) * (ll.height + 1);
			ll.tabNum = Shenron.activeProject.websiteTab.length;
			Shenron.activeProject.containerTab.addChild(Shenron.activeTab);
			Shenron.activeTab.x = ll.x;
			Shenron.activeTab.y = ll.y;
			Shenron.activeProject.activeTabY = ll.y;
			
			
			containerTabPage.addEventListener(MouseEvent.CLICK,pageChangeEvent);
			/*for(var i=0; i<= Shenron.activeProject.websiteTab.length; i++)
			{
				Shenron.activeProject.containerTab
			}*/
			
			
	

		}
		public function pageTabFalse() {
			// constructor code
			
			for(var i:uint =0; i< pageTab.length; i++){
				//pageTab[i].visible = false;
				pageTab[i].parent.visible = false;
			}
			
		}
		
		function pageChangeEvent(e:MouseEvent){
			
			if(e.target as OngletHoriz_mc){
				pageChange(e.target.tabNum);
				
			Shenron.activeProject.activeWebsite.containerTabPage.addChild(Shenron.activeTabPage);
			Shenron.activeTabPage.x = e.target.x;
			Shenron.activeTabPage.y = e.target.y;
			this.activeTabPageX = e.target.x;
				
				
			}
		}
		
		public function pageChange(targetTab:uint){
	
			
			Shenron.activeProject.activeWebsite.activePage = Shenron.activeProject.activeWebsite.pageTab[targetTab - 1];
			Selection.sPage = Shenron.activeProject.activeWebsite.pageTab[targetTab - 1];
				
			Selection.sGrid = Selection.sPage.grid;
			Shenron.scrollpane.source = Shenron.activeProject.activeWebsite.pageTab[targetTab - 1].parent;
			//trace("ActiveWeb:" + Shenron.activeProject.activeWebsite.pageTab[targetTab - 1]);
			Shenron.ongletPageAlign();
		
		}
		
		
		


		public function delWesite(){
			
			if(Shenron.activeProject.websiteTab.length > 1)
			{
			
		for(var i:uint=0;i<= Shenron.activeProject.websiteTab.length - 1;i++){
		
			Shenron.activeProject.containerTab.getChildAt(i).visible = false;
			//Shenron.activeProject.containerTab.removeChildAt(i);
			
			if( Shenron.activeProject.websiteTab[i].idWebsite == Shenron.activeProject.activeWebsite.idWebsite)
			{	
				Shenron.activeProject.websiteTab.removeAt(i);
				
				
			}
			
			

		}
		Shenron.activeProject.activeWebsite.containerTabPage.visible = false;
	
		Shenron.activeProject.containerTab.removeChildren();
		for(var j:uint=0;j< Shenron.activeProject.websiteTab.length;j++){
			
			
			var ll:OngletLatMC = new OngletLatMC();
			ll.label_txt.text = (j + 1).toString();
			ll.label_txt.mouseEnabled = false;
			//ll.activeTab_mc.mouseEnabled = false;
			ll.buttonMode = true;
			Shenron.activeProject.containerTab.addChild(ll);
			ll.y = (j) * (ll.height + 1);
			ll.tabNum = j +1;
			Shenron.activeProject.containerTab.addChild(Shenron.activeTab);
			Shenron.activeTab.x = ll.x;
			Shenron.activeTab.y = ll.y;
			Shenron.activeProject.activeTabY = ll.y;
		
		}
	
		Shenron.activeProject.activeWebsite = Shenron.activeProject.websiteTab[0];
		Shenron.activeProject.websiteChange(1);
		Shenron.activeTab.x = Shenron.activeProject.containerTab.getChildAt(0).x;
		Shenron.activeTab.y = Shenron.activeProject.containerTab.getChildAt(0).y;
		Shenron.activeProject.activeTabY = Shenron.activeProject.containerTab.getChildAt(0).y;

		Shenron.ongletPageAlign();
		Shenron.activeProject.activeWebsite.containerTabPage.visible = true;
	}
	}



		
		//--------------------	
		public function get idWebsite(): uint {
			return _idWebsite;
		}
		
		/*public static function set idWebsite(idWebsite: uint) {
			_idWebsite = idWebsite;
		}	
		*/
		
		//--------------------	
		public function get name(): String {
			return _name;
		}
		
		public function set name(name: String) {
			_name = name;
		}
		
		
		//--------------------	
		public function get theme(): Theme {
			return _theme;
		}
		
		public function set theme(theme: Theme) {
			_theme = theme;
		}
		
		//--------------------------------------------
		public function get pageTab(): Array {
			return _pageTab;
		}
		
		public function set pageTab(pageTab: Array) {
			_pageTab = pageTab;
		}
		//--------------------------------------------
		public function get containerTabPage(): Sprite{
			return _containerTabPage;
		}
		
		public function set containerTabPage(containerTabPage: Sprite) {
			_containerTabPage = containerTabPage;
		}
		
		//--------------------------------------------
		public function get activePage(): Page {
			return _activePage;
		}
		
		public function set activePage(activePage: Page) {
			_activePage = activePage;
		}
		
		//--------------------------------------------
		public function get activeTabPageX(): Number{
			return _activeTabPageX;
		}
		
		public function set activeTabPageX(activeTabPageX: Number) {
			_activeTabPageX = activeTabPageX;
		}



	}
	
}
