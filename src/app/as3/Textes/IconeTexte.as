package com.nao.Textes {
	
	import com.nao.Components.Bouton;
	import com.nao.Images.Icone;
	import com.nao.Power.Ki;
	import flash.text.TextFormat;
	import com.nao.Containers.Balise;
	import com.nao.Containers.Element;
	import com.nao.Basic.Position;
	import com.nao.Images.Image;
	
	public class IconeTexte extends Element {
		
		private var _texte:Texte = new Texte();
		private var _icone:Icone =  new Icone("");
		private var _positionIcone:uint;
		private var _ornement:Image = new Image(0,0,100,20);
		private var _ornementVisible:Boolean = false;
	

		public function IconeTexte (label:String = "Mon bouton", icone:String = "", posIcone:uint = 0, x:Number = 0, y:Number = 0, width:Number = 70, height:Number = 30, iconSize:uint = 20  ) {
			// constructor code
			
				super(x, y, width, height);
				codeHTML = <div></div>;
				
				_texte.label = label;
		        _texte.fontFamily = "Font Awesome";
				_icone.label = icone;
				_positionIcone = posIcone;
				
				_icone.marginRight = 5;
				//_icone.marginLeft  = 5;
				_icone.marginLeft  = 0;
				
				_texte.resize();
				this.padding = 5;
				
				this.addBalise(_texte);
				this.addBalise(_icone);
			/*	this.htmlWidth = this.width;
				this.htmlHeight = this.height;*/
			
				this.background.backgroundImage ="transparent";
				this.htmlLoad.paintsDefaultBackground = false ;
				
				this.mouseChildren = false;
				Ki.iconeTexteChange(this);
		
				trace("IconeTexte.width:" + this.htmlWidth);
		
		}
		
		public function set fontFamily(fontFamily: String) {

			texte.fontFamily = fontFamily;
			Ki.iconeTexteChange(this);
		}
		
		public function get fontFamily(): String {
			return texte.fontFamily;
		}
		
		//---------------------
		 public function set fontSize(fontSize: uint) {

			texte.fontSize = fontSize;
			icone.fontSize = fontSize;
			Ki.iconeTexteChange(this);
		}
		
		public function get fontSize(): uint {
			return texte.fontSize;
		}
		
		//---------------------	
		
		public function set fontWeight(fontWeight: Boolean) {

			texte.fontWeight = fontWeight;
			icone.fontWeight = fontWeight;
			Ki.iconeTexteChange(this);
		}
		
		public function get fontWeight(): Boolean {
			return texte.fontWeight;
		}
		//---------------------	
		public function get color(): uint {
			return texte.color;
		}
		
		public function set color(color: uint) {
			texte.color = color;
			icone.color = color;
			Ki.texteChange(texte);
			Ki.texteChange(icone);
		}
		
	
		//---------------------		
		public function get textDecoration(): String {
			return texte.textDecoration;
		}
		
		public function set textDecoration(textDecoration: String) {

			texte.textDecoration = textDecoration;
			Ki.texteChange(texte);
		}
		//---------------------	
		public function get fontStyle(): String {
			return texte.fontStyle;
		}
			
		public function set fontStyle(fontStyle: String) {

			texte.fontStyle = fontStyle;
		    Ki.iconeTexteChange(this);
		}
		
		
		
		public function set iconeFontFamily(fontFamily: String) {

			icone.fontFamily = fontFamily;
			Ki.iconeTexteChange(this);
		}
		
		public function get iconeFontFamily(): String {
			return icone.fontFamily;
		}
		
		//---------------------
		 public function set iconeFontSize(fontSize: uint) {

			icone.fontSize = fontSize;
			Ki.iconeTexteChange(this);
		}
		
		public function get iconeFontSize(): uint {
			return icone.fontSize;
		}
		
		//---------------------	
		
		public function set iconeFontWeight(fontWeight: Boolean) {

			icone.fontWeight = fontWeight;
			Ki.iconeTexteChange(this);
		}
		
		public function get iconeFontWeight(): Boolean {
			return icone.fontWeight;
		}
		//---------------------	
		public function get iconeColor(): uint {
			return icone.color;
		}
		
		public function set iconeColor(color: uint) {
			icone.color = color;
			Ki.texteChange(icone);
		}
		
		//---------------------		
		public function get iconeTextDecoration(): String {
			return icone.textDecoration;
		}
		
		public function set iconeTextDecoration(textDecoration: String) {

			icone.textDecoration = textDecoration;
			Ki.texteChange(icone);
		}
		//---------------------	
		public function get iconeFontStyle(): String {
			return icone.fontStyle;
		}
			
		public function set iconeFontStyle(fontStyle: String) {

			icone.fontStyle = fontStyle;
			Ki.iconeTexteChange(this);
		}
	
		
		//---------------------
		 public function set texteFontSize(fontSize: uint) {

			texte.fontSize = fontSize;
			Ki.texteChange(this);
		}
		
		public function get texteFontSize(): uint {
			return texte.fontSize;
		}
		
		//---------------------	
		
		public function set texteFontWeight(fontWeight: Boolean) {

			texte.fontWeight = fontWeight;
			Ki.texteChange(this);
		}
		
		public function get texteFontWeight(): Boolean {
			return texte.fontWeight;
		}
		//---------------------	
		public function get texteColor(): uint {
			return texte.color;
		}
		
		public function set texteColor(color: uint) {
			texte.color = color;
			Ki.texteChange(texte);
		}
		
		//---------------------		
		public function get texteTextDecoration(): String {
			return texte.textDecoration;
		}
		
		public function set texteTextDecoration(textDecoration: String) {

			texte.textDecoration = textDecoration;
			Ki.texteChange(texte);
		}
		//---------------------	
		public function get texteFontStyle(): String {
			return texte.fontStyle;
		}
			
		public function set texteFontStyle(fontStyle: String) {

			texte.fontStyle = fontStyle;
			Ki.texteChange(this);
		}
		
		
		//---------------------	
	
		public function set texte(texte: Texte) {
			_texte = texte;
		}
		
		public function get texte():Texte {
			return _texte;
			
		}
		//---------------------
		public function set label(label: String) {
			_texte.label = label;
			Ki.iconeTexteChange(this);
		
		
		}
		
		public function get label():String {
			return _texte.label;
		}
		
		//---------------------
		public function set icone(icone: Icone) {
			_icone = icone;
			
		}
		
		public function get icone():Icone {
			return _icone;
		}
		
		//---------------------
		public function set iconeLabel(iconeLabel: String) {
			_icone.label = iconeLabel;
			
		}
		
		public function get iconeLabel():String {

			return  _texte.label;
			
		}
		
		//---------------------
		public function set positionIcone(positionIcone: uint) {
			_positionIcone = positionIcone;
			Ki.iconeTexteChange(this);
		}
		
		public function get positionIcone():uint {
			return _positionIcone;
		}
		
		//---------------------
		public function set ornement(ornement: Image) {
			_ornement = ornement;
			
		}
		
		public function get ornement():Image {
			return _ornement;
		}
		
		//---------------------
		public function set ornementVisible(ornement: Boolean) {
			_ornementVisible = ornementVisible;
			
		}
		
		public function get ornementVisible():Boolean {
			return _ornementVisible;
		}
		
		


	}
	
}
