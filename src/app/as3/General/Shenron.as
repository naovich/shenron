package com.nao.General  {
	
	import com.nao.General.Project;
	import flash.geom.Rectangle;
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;

	
	public class Shenron {

		
		
		
		private static var _projectNameTab:Array = new Array();
		private static var _projectTab:Array = new Array();
		private static var _activeProject:Project;
		private static var _sceneLocation:Rectangle = new Rectangle();
		private static var _scrollpane: ScrollPane = new ScrollPane();
		private static var _activeTab:MovieClip = new MovieClip();
		private static var _activeTabPage:MovieClip = new MovieClip();
	

		
		
		
		
		public function Shenron() {
			// constructor code
			
			
		}
		
		//----------------------------Routine---------------------
		public static function ongletPageAlign(){
			
		Shenron.activeProject.activeWebsite.containerTabPage.addChild(Shenron.activeTabPage);
		Shenron.activeTabPage.x = (Shenron.activeProject.activeWebsite.activePage.idPageTab) * (Shenron.activeProject.activeWebsite.containerTabPage.getChildAt(0).width + 1);
		Shenron.activeProject.activeWebsite.activeTabPageX = Shenron.activeTabPage.x;
			
		}
		
		
		
		//--------------------------------------------
		public static function get projectNameTab(): Array {
			return _projectNameTab;
		}
		
		public static function set projectNameTab(projectNameTab: Array) {
			_projectNameTab = projectNameTab;
		}
		
		//--------------------------------------------
		public static function get projectTab(): Array {
			return _projectTab;
		}
		
		public static function set projectTab(projectTab: Array) {
			_projectTab = projectTab;
		}
		
		//--------------------------------------------
		public static function get activeProject(): Project {
			return _activeProject;
		}
		
		public static function set activeProject(activeProject: Project) {
			_activeProject = activeProject;
		}
		
		//--------------------------------------------
		public static function get sceneLocation(): Rectangle {
			return _sceneLocation;
		}
		
		public static function set sceneLocation(sceneLocation: Rectangle) {
			_sceneLocation = sceneLocation;
		}
		
		//--------------------------------------------
		public static function get scrollpane(): ScrollPane {
			return _scrollpane;
		}
		
		public static function set scrollpane(scrollpane: ScrollPane) {
			_scrollpane = scrollpane;
		}
		//-------------------------------------------------
		
		public static function get activeTab(): MovieClip {
			return _activeTab;
		}
		
		public static function set activeTab(activeTab: MovieClip) {
			_activeTab = activeTab;
		}
		//-------------------------------------------------
		
		public static function get activeTabPage(): MovieClip {
			return _activeTabPage;
		}
		
		public static function set activeTabPage(activeTabPage: MovieClip) {
			_activeTabPage = activeTabPage;
		}



	}
	
}
