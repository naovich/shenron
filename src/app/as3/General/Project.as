package com.nao.General  {
	import com.nao.General.Shenron;
	import com.nao.Themes.Theme;
	import com.nao.Pages.Page; 
	import com.nao.General.Website;
	import com.nao.General.Selection;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Project {

		
		private var _name:String;
		private var _typeProject:uint; //web, mobile
		private var _typeWebsite:uint // Blog, Dashboard, Ecommerce, inscription, Personnel, portail, produit, RS, Résevation, vitrine, cordfunding
		private var _cathegorie:uint; //Agriculture, alimentation, animaux, architecture, Auto, Moto, Automoto, Basketball
		// bisiness, caritatif, cinema, cosmetique, dating, dentiste, enfants, fottball, football americain, freelance, hotel, immobilier, infographie,
		//jeux vidéo, mariage, medecin, mode, pari
		
		private var _sousCathegorie:uint;
		private var _client:String;// le site ou le client, musique,photographie, restaurant, santé, senior, spa, sport, télé, voyage
		private var _forme:uint // Anguleux, bande, carré, courbe, tuiles
		private var _websiteTab:Array = new Array() ;
		private var _containerTab:Sprite = new Sprite();
		private var _activeTabY:Number;
		
		private var _activeWebsite:Website;
		private var _beginDate:Date;
		private var _endDate:Date;
		private var _money:Number;
		private var _win:Boolean;
		private var _language:uint;
		private static var _idProject:uint = 0;
		
		
		
		public function Project(name:String ="Projet", typeProject:uint = 0, typeWebsite:uint = 0, cathegorie:uint = 0, sousCathegorie:uint = 0, client:String = "", forme:uint =0, language:uint = 0  ) {
			// constructor code
			_idProject ++;
			_name = name;
			_typeProject = typeProject;
			_typeWebsite = typeWebsite;
			_cathegorie = cathegorie;
			_client = client;
			_forme = forme;
			_language = language;
			if( Shenron.projectTab.length > 0){
				
				Shenron.activeProject.containerTab.visible = false;
				
			}
			Shenron.projectNameTab.push(this.name);
			Shenron.projectTab.push(this);
			Shenron.activeProject = this;
			Selection.sProject = this;
			
			containerTab.addEventListener(MouseEvent.CLICK,websiteChangeEvent);
			
			var webSite:Website = new Website();
				
			
		}
		
		function websiteChangeEvent(e:MouseEvent){
			
			if(e.target as OngletLatMC){
				websiteChange(e.target.tabNum);
				
			Shenron.activeProject.containerTab.addChild(Shenron.activeTab);
			Shenron.activeTab.x = e.target.x;
			Shenron.activeTab.y = e.target.y;
			this.activeTabY = e.target.y;
				
			Shenron.activeProject.activeWebsite.containerTabPage.addChild(Shenron.activeTabPage);
			Shenron.activeTabPage.x = (Shenron.activeProject.activeWebsite.activePage.idPageTab) * (Shenron.activeProject.activeWebsite.containerTabPage.getChildAt(0).width + 1);
			Shenron.activeProject.activeWebsite.activeTabPageX = Shenron.activeTabPage.x;
				
				
				
				
			}
		}
		
		public function websiteChange(targetTab:uint){
	
			Shenron.activeProject.activeWebsite.containerTabPage.visible = false;
			Shenron.activeProject.activeWebsite = Shenron.activeProject.websiteTab[targetTab - 1];
			Selection.sWebsite = Shenron.activeProject.websiteTab[targetTab - 1];
			Shenron.activeProject.activeWebsite.activePage = Selection.sWebsite.activePage;
			
			
			Selection.sPage = Selection.sWebsite.activePage;
			Selection.sGrid = Selection.sPage.grid;
			Shenron.scrollpane.source = Selection.sWebsite.activePage.parent;
			Shenron.activeProject.activeWebsite.containerTabPage.visible = true;
			
			
			
		
		}
		
		
			public function organize(targetTab:uint){
	
			
		
		
		}
		
		public function get idProject(): uint {
			return _idProject;
		}
		
		//--------------------	
		public function get name(): String {
			return _name;
		}
		
		public function set name(name: String) {
			_name = name;
		}
		
		//--------------------	
		public function get typeProject(): uint {
			return _typeProject;
		}
		
		public function set typeProject(type: uint) {
			_typeProject = typeProject;
		}
		
		//--------------------	
		public function get typeWebsite(): uint {
			return _typeWebsite;
		}
		
		public function set typeWebsite(type: uint) {
			_typeWebsite = typeWebsite;
		}
		
		//--------------------------------------------
		public function get websiteTab(): Array {
			return _websiteTab;
		}
		
		public function set websiteTab(websiteTab: Array) {
			_websiteTab = websiteTab;
		}
		//--------------------	
		public function get cathegorie(): uint {
			return _cathegorie;
		}
		
		public function set cathegorie(type: uint) {
			_cathegorie = cathegorie;
		}
		
		//--------------------	
		public function get sousCathegorie(): uint {
			return _sousCathegorie;
		}
		
		public function set sousCathegorie(type: uint) {
			_sousCathegorie = sousCathegorie;
		}
		
		//--------------------	
		public function get forme(): uint {
			return _forme;
		}
		
		public function set forme(type: uint) {
			_forme = forme;
		}
		//--------------------	
		public function get client(): String {
			return _client;
		}
		
		public function set client(client: String) {
			_client = client;
		}
		
		
		//--------------------	
		public function get beginDate(): Date {
			return _beginDate;
		}
		
		public function set beginDate(beginDate: Date) {
			_beginDate = beginDate;
		}
		
		//--------------------	
		public function get endDate(): Date {
			return _endDate;
		}
		
		public function set endDate(endDate: Date) {
			_endDate = endDate;
		}
		
		//--------------------	
		public function get money(): Number {
			return _money;
		}
		
		public function set money(money: Number) {
			_money = money;
		}

		
		//--------------------	
		public function get language(): uint {
			return _language;
		}
		
		public function set language(language: uint) {
			_language = language;
		}
		
		
		
		//--------------------	
		public function get win(): Boolean {
			return _win;
		}
		
		public function set win(win: Boolean) {
			_win = win;
		}
		
		//--------------------------------------------
		public function get activeWebsite(): Website {
			return _activeWebsite;
		}
		
		public function set activeWebsite(activeWebsite: Website) {
			_activeWebsite = activeWebsite;
		}

		//--------------------------------------------
		public function get containerTab(): Sprite{
			return _containerTab;
		}
		
		public function set containerTab(containerTab: Sprite) {
			_containerTab = containerTab;
		}
		//--------------------------------------------
		public function get activeTabY(): Number{
			return _activeTabY;
		}
		
		public function set activeTabY(activeTabY: Number) {
			_activeTabY = activeTabY;
		}
		
		//--------------------------------------------
	/*	public function get activeTabPageX(): Number{
			return _activeTabPageX;
		}
		
		public function set activeTabPageX(activeTabPageX: Number) {
			_activeTabPageX = activeTabPageX;
		}*/


	}
	
}
