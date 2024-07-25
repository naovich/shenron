package com.nao.Components {
	
	import com.nao.Components.IconeTexte;
	import com.nao.Images.Icone;
	
	public class LinkIconeTexte extends IconeTexte {
		
	private var _icone:Icone = new Icone(0,0,50,"");
	private var _positionIcone:uint ;
	private var styleIcon = "font-family:FontAwesome;margin:10px";

		public function LinkIconeTexte (x:Number, y:Number, width:Number, height:Number,label:String, icone:String = "", positionIcone:uint = 0, iconSize:uint = 20  ) {
			// constructor code
			_icone.fontSize = iconSize;
			_icone.label = icone;
			_positionIcone = positionIcone ;
			super(x, y, width, height,label,icone,positionIcone,iconSize);
		
		switch(positionIcone)
			{
				case 0: 
				_codeHTML = <a>{label}</a>;
				break;
				
				case 1: 
				_codeHTML = <span><span style = {styleIcon}>{_icone.label}</span><a href='#'>{label}</a></span>;
				break;
				
				case 2:
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span><br></br>{label}</a>;
				break;
				
				case 3:
				_codeHTML = <a>{label} <span style = {styleIcon}>{_icone.label}</span></a>;
				break;
				
				case 4:
				_codeHTML = <a>{label} <br></br><span style = {styleIcon}>{_icone.label}</span></a>;
				break;
				
				
				
			}
			
		//	_codeHTML = <a href='#'><i style = {styleIcon}>{_icone.label}</i><br></br>{label}</a href='#'>;
			this.background.backgroundImage = "default";
		}
		
		
		
		override public function  set label(label: String) {
			switch(positionIcone)
			{
				case 0: 
				_codeHTML = <a>{label}</a>;
				break;
				
				case 1: 
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span>{label}</a>;
				break;
				
				case 2:
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span><br></br>{label}</a>;
				break;
				
				case 3:
				_codeHTML = <a>{label} <span style = {styleIcon}>{_icone.label}</span></a>;
				break;
				
				case 4:
				_codeHTML = <a>{label} <br></br><span style = {styleIcon}>{_icone.label}</span></a>;
				break;
			_label = label;
			}
		}

		
	
		override public function set icone(icone: Icone) {

			_icone = icone;
			switch(positionIcone)
			{
				case 0: 
				_codeHTML = <a>{label}</a>;
				break;
				
				case 1: 
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span>{label}</a>;
				break;
				
				case 2:
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span><br></br>{label}</a>;
				break;
				
				case 3:
				_codeHTML = <a>{label} <span style = {styleIcon}>{_icone.label}</span></a>;
				break;
				
				case 4:
				_codeHTML = <a>{label} <br></br><span style = {styleIcon}>{_icone.label}</span></a>;
				break;
			
			}
		}
		
		
		
		override public function set positionIcone(positionIcone: uint) {

			_positionIcone = positionIcone;
			
			switch(positionIcone)
			{
				case 0: 
				_codeHTML = <a>{label}</a>;
				break;
				
				case 1: 
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span>{label}</a>;
				break;
				
				case 2:
				_codeHTML = <a><span style = {styleIcon}>{_icone.label}</span><br></br>{label}</a>;
				break;
				
				case 3:
				_codeHTML = <a>{label} <span style = {styleIcon}>{_icone.label}</span></a>;
				break;
				
				case 4:
				_codeHTML = <a>{label} <br></br><span style = {styleIcon}>{_icone.label}</span></a>;
				break;
			
			}
		}

	
		
		
		
		
		
		
		
		
		
		
		
		}
	
}
