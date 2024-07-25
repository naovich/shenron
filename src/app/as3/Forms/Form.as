package com.nao.Forms  {
	
		import com.nao.Images.Image;
		import com.nao.Textes.IconeTexte;
		import com.nao.Textes.Paragraph;
		import com.nao.Containers.Balise;
		import com.nao.Images.IconeBalise;
		import com.nao.Components.Bouton;
		import com.nao.Power.Ki;
		import com.nao.Basic.Position;
		import com.nao.Pages.Grid;
		import com.nao.Components.Telephone;
		import com.nao.Components.Adress;
		import com.nao.Components.SocialIcon;
		import com.nao.Images.Maps;
		import com.nao.Forms.TexteInput;
		import com.nao.Forms.SelectInput;
		import
	
	public class Form extends Balise {
	
		private var _mainModule:Balise = new Balise(0,0,176,200);
		private var _header:Balise = new Balise(0,0,176,40);
		private var _footer:Balise = new Balise(0,0,176,40);
		private var _map:Maps = new Maps();
		private var _icone:IconeBalise = new IconeBalise("",0,0,0,30);
		private var _titre:IconeTexte = new IconeTexte("Contact us","",0,0,0,110);
		private var _sousTitre:Paragraph = new Paragraph(0,50,130,4);
		private var _texte:Paragraph = new Paragraph(0,50,130,4);
		private var _bouton:Bouton = new Bouton("View more") ;
		private var _telephone:Telephone = new Telephone();
		private var _adress:Adress = new Adress();
		private var _logo:Image = new Image(0,0,120,50);
		private var _socialIcon:SocialIcon = new SocialIcon();
		
		
		
		
		
		public function Form() {
			// constructor code
		}
		
		
		//---------------
		public function get header(): Balise {
			return _header;
		}

		public function set header(header: Balise) {
			_header = header;
		}
		
			//---------------
		public function get footer(): Balise {
			return _footer;
		}

		public function set footer(footer: Balise) {
			_footer = footer;
		}
		
		//---------------
		public function get icone(): IconeBalise {
			return _icone;
		}

		public function set icone(icone: IconeBalise) {
			_icone = icone;
		}
		
			//---------------
		public function get image(): Image {
			return _image;
		}

		public function set image(image: Image) {
			_image = image;
		}
		
		
		//--------------------	
		public function get titre(): IconeTexte {
			return _titre;
		}
		
		public function set titre(titre: IconeTexte) {

			_titre = titre;
		}
		
		//--------------------	
		public function get sousTitre(): Paragraph {
			return _sousTitre;
		}
		
		public function set sousTitre(sousTitre: Paragraph) {

			_sousTitre = sousTitre;
		}
		
		//--------------------	
		public function get texte(): Paragraph {
			return _texte;
		}
		
		public function set texte(texte: Paragraph) {

			_texte = texte;
		}
		
		//--------------------	
		public function get mainModule(): Balise {
			return _mainModule;
		}
		
		public function set mainModule(mainModule: Balise) {

			_mainModule = mainModule;
		}
		
				
		//--------------------	
		public function get bouton(): Bouton {
			return _bouton;
		}
		
		public function set bouton(bouton: Bouton) {

			_bouton = bouton;
		}
		
		//---------------------	
		public function get telephone(): Telephone {
			return _telephone;
		}

		public function set telephone(telephone: Telephone) {
			_telephone = telephone;
		}
		//---------------------	
		public function get adress(): Adress {
			return _adress;
		}

		public function set adress(adress: Adress) {
			_adress = adress;
		}
		
		//---------------------	
		public function get logo(): Image {
			return _logo;
		}

		public function set logo(logo: Image) {
			_logo = logo;
		}
		
		//---------------------	
		public function get socialIcon(): SocialIcon {
			return _socialIcon;
		}

		public function set socialIcon(socialIcon: SocialIcon) {
			_socialIcon = socialIcon;
		}

	}
	
}
