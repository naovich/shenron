package com.nao.Modules {
	import com.nao.Containers.Balise;
	import com.nao.Textes.IconeTexte;
	import com.nao.Power.Ki;
	import com.nao.Basic.Position;
	
	public class Login extends Balise {
		
		private var _boutonLogin:IconeTexte = new IconeTexte("Login","",1) ;
		private var _boutonRegister:IconeTexte = new IconeTexte("Register","",1);

		public function Login(x:int = 0 , y:int = 0,width:uint = 0, height:uint = 0) {
			// constructor code
			
			super(x, y, width, height);
			super.background.backgroundImage = "transparent";
			
			this.addBalise(_boutonLogin);
			this.addBalise(_boutonRegister);
			
						
			_boutonLogin.marginRight = 5;
			_boutonRegister.paddingLeft = _boutonLogin.marginRight;
			
			_boutonRegister.border.borderStyle ="solid";
			_boutonRegister.border.borderColor = 0xFFFFFF;
			_boutonRegister.border.borderWidth = 0;
			_boutonRegister.border.borderLeftWidth = 1;
			_boutonLogin.marginRight = 5;
			
			_boutonLogin.texte.fontSize = 12;
			_boutonRegister.texte.fontSize = 12;
			
			_boutonLogin.icone.fontSize = 12;
			_boutonRegister.icone.fontSize = 12;
			
			
			
			_boutonRegister.positionArray[1] = this;
			_boutonRegister.positionArray[0] = this;
		    _boutonRegister.positionTypeX = 3;
			_boutonRegister.positionTypeY = 4;
			
			_boutonLogin.positionArray[5] = _boutonRegister;
			_boutonLogin.positionArray[1] = this;
		    _boutonLogin.positionTypeX = 7;
			_boutonLogin.positionTypeY = 4;
			
		
			Ki.loginChange(this);
			/*Ki.iconeTexteChange(_boutonLogin);
			Ki.iconeTexteChange(_boutonRegister);
			Ki.baliseChange(this);
			
			Position.normalXYRightCenter(_boutonRegister,this);
			Position.normalYCenter(_boutonLogin,this);
			Position.beforeX(_boutonLogin,_boutonRegister);*/
			
		}
		
		//---------------------	
		public function get boutonLogin(): IconeTexte {
			return _boutonLogin;
		}
		
		public function set boutonLogin (boutonLogin: IconeTexte) {

			_boutonLogin = boutonLogin;
		}
		//---------------------	
		public function get boutonRegister(): IconeTexte {
			return _boutonRegister;
		}
		
		public function set boutonRegister (boutonRegister: IconeTexte) {

			_boutonRegister = boutonRegister;
		}
		
	
		
		//---------------------	
		public function get fontSize(): uint {
			return _boutonLogin.texte.fontSize;
		}
		
		public function set fontSize(fontSize:uint) {
			_boutonLogin.texte.fontSize = fontSize;
			_boutonLogin.icone.fontSize = fontSize;
			
			_boutonRegister.texte.fontSize = fontSize;
			_boutonRegister.icone.fontSize = fontSize;
			
			Ki.iconeTexteChange(_boutonLogin);
			Ki.iconeTexteChange(_boutonRegister);
			
			Position.normalXYRightCenter(_boutonRegister,this);
			Position.normalYCenter(_boutonLogin,this);
			Position.beforeX(_boutonLogin,_boutonRegister);
		
		}
		
		//---------------------	
		public function get color(): uint {
			return _boutonLogin.texte.color;
		}
		
		public function set color(color:uint) {
			_boutonLogin.texte.color = color;
			_boutonLogin.icone.color = color;
			
			_boutonRegister.texte.color = color;
			_boutonRegister.icone.color = color;
			
			_boutonRegister.border.borderColor = color;
			_boutonLogin.border.borderColor = color;
			
			Ki.iconeTexteChange(_boutonLogin);
			Ki.iconeTexteChange(_boutonRegister);
		
		}
		
		//---------------------	
		public function get fontFamily(): String {
			return _boutonLogin.texte.fontFamily;
		}
		
		public function set fontFamily(fontFamily:String) {
			_boutonLogin.texte.fontFamily = fontFamily;
			_boutonRegister.texte.fontFamily = fontFamily;
			
			Ki.iconeTexteChange(_boutonLogin);
			Ki.iconeTexteChange(_boutonRegister);
			
			Position.normalXYRightCenter(_boutonRegister,this);
			Position.normalYCenter(_boutonLogin,this);
			Position.beforeX(_boutonLogin,_boutonRegister);
		
		}

		

	}
	
}
