package com.nao.Pages {

	import flash.display.Sprite;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import com.nao.Containers.Div;
	import com.nao.Power.Ki;
	import com.nao.Pages.Grid;
	import com.nao.Pages.Plan;
	import com.nao.General.Shenron;
	import com.nao.General.Project;
	import com.nao.General.Selection;



	public class Page extends Div {

		private var _grid:Grid;
		private var _project:Project;
		public static var staticPageId: int = 0;
		private var _idPageTab:uint ;
		private var _idPage:uint;
		private var _pageType:String;

		
		public function Page(width:uint, height:uint,color:uint,pageType:String = "Landing") {
			// constructor code
			super(0,0,width,height);
			
			this.background.backgroundColor = color;
			this.pageType = pageType
			
			var plan:Plan = new Plan(this,Shenron.sceneLocation);
			plan.addChild(this);
			Ki.baliseChange(this);
			
			baliseType = "Page";
			baliseName ="Page";
			
			staticPageId ++;
			
			this._idPage = staticPageId;
			Shenron.activeProject.activeWebsite.pageTab.push(this);
			this.name = baliseName + " " + staticPageId.toString();
			Shenron.activeProject.activeWebsite.activePage = this;
			Selection.sPage = this;
			Selection.sGrid = this.grid;
			
			var ongP:OngletHoriz_mc = new OngletHoriz_mc();
			ongP.label_txt.text = (Shenron.activeProject.activeWebsite.pageTab.length).toString() + "-" + this.pageType;
			ongP.label_txt.mouseEnabled = false;
		
			ongP.buttonMode = true;
			Shenron.activeProject.activeWebsite.containerTabPage.addChild(ongP);
			ongP.x = (Shenron.activeProject.activeWebsite.pageTab.length - 1) * (ongP.width + 1);
			ongP.tabNum = Shenron.activeProject.activeWebsite.pageTab.length;
			this.idPageTab = Shenron.activeProject.activeWebsite.pageTab.length -1;
			Shenron.activeProject.activeWebsite.containerTabPage.addChild(Shenron.activeTabPage);
			Shenron.activeTabPage.x = ongP.x;
			Shenron.activeTabPage.y = ongP.y;
			Shenron.activeProject.activeWebsite.activeTabPageX = ongP.y;
			
			
		}
		
		public function updatePage(width:uint, height:uint, color:uint){
			
			Shenron.activeProject.activeWebsite.activePage.width = width ;
			Shenron.activeProject.activeWebsite.activePage.height =  height;
			Shenron.activeProject.activeWebsite.activePage.background.backgroundColor = color;
			//Shenron.activeProject.activeWebsite.activePage.pageType =  pageType ;
			Ki.baliseChange(Shenron.activeProject.activeWebsite.activePage);
			
			
			
	
			
		}


			
			
		public function delPage(){
			
			if(Shenron.activeProject.activeWebsite.pageTab.length > 1)
			{
			
			Shenron.activeProject.activeWebsite.containerTabPage.visible = false;
			var i:uint =0;
		
			for each( var value in Shenron.activeProject.activeWebsite.pageTab){
				
				
				if( value.idPage == Shenron.activeProject.activeWebsite.activePage.idPage){
					
					Shenron.activeProject.activeWebsite.pageTab.removeAt(i);
				
				}
				i++;
				
		
				
			}
			
		
			for each( var valueTab in Shenron.activeProject.activeWebsite.containerTabPage){
				valueTab.visible = false;
			}
			Shenron.activeProject.activeWebsite.containerTabPage.removeChildren();
			
			i =0;
			for each( var newValue in Shenron.activeProject.activeWebsite.pageTab){
			
				var ongP:OngletHoriz_mc = new OngletHoriz_mc();
				ongP.label_txt.text = (i + 1).toString() +  "-" + Shenron.activeProject.activeWebsite.pageTab[i].pageType;
				ongP.label_txt.mouseEnabled = false;
				ongP.buttonMode = true;
				Shenron.activeProject.activeWebsite.containerTabPage.addChild(ongP);
				ongP.x = (i) * (ongP.width + 1);
				ongP.tabNum = i +1;
				
				Shenron.activeProject.activeWebsite.pageTab[i].idPageTab = i;
				
				i++;
				
			}
			Shenron.activeProject.activeWebsite.pageChange(1);
			Shenron.activeProject.activeWebsite.containerTabPage.visible = true;
		}
	}		
		
		
		

		public function get grid(): Grid {
			return _grid;
		}
		
		public function set grid(grid: Grid) {
			_grid = grid;
		}	
		
		public function get project(): Project {
			return _project;
		}
		
		public function set project(project: Project) {
			_project = project;
		}
		
		public function get idPage(): uint {
			return _idPage;
		}
		
		public function set idPage(idPage: uint) {
			_idPage= idPage;
		}
		
	
		public function get idPageTab(): uint {
			return _idPageTab;
		}
		
		public function set idPageTab(idPageTab: uint) {
			_idPageTab = idPageTab;
		}
		
		public function get pageType(): String {
			return _pageType;
		}
		
		public function set pageType(pageType: String) {
			_pageType = pageType;
		}
		
	



	}

}