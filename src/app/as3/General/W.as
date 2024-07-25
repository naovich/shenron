package com.nao.General {
	
	public class W {
		
	 //1 English, 2 French,3  Spanish, 4 Deutch, 6 netherland;
		public static var lang:uint = 1;
		
		public function W() {
			
			
		}
		

//------------------------------------------WORD------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------

//-----------------------------------------Menu----------------------------

public static function  home(): String {
	var result:String;
	switch(lang){
		case 1:
			result = "Home"; //English
		break;
		case 2:
			result = "Accueil"; //French
		break;
		case 3:
			result = "Bienvenida"; //Spanish
		break;
		case 4:
			result = "Willkommen"; //Deutch
		break;
		case 5:
			result = "Ontvangst"; //Netherdand
		break;
}
	return result;
}


public static function services(lg:uint = 1): String {
	var result:String;
	switch(lg){
		case 1:
			result = "Services"; //English
		break;
		case 2:
			result = "Services"; //French
		break;
		case 3:
			result = "Servicios"; //Spanish
		break;
		case 4:
			result = "Dienstleistungen"; //Deutch
		break;
		case 5:
			result = "Diensten"; //Netherdand
		break;
}
	return result;
}

public static function  news(lg:uint = 1): String {
	var result:String;
	switch(lg){
		case 1:
			result = "News"; //English
		break;
		case 2:
			result = "Actualités"; //French
		break;
		case 3:
			result = "Noticias"; //Spanish
		break;
		case 4:
			result = "Nachrichten"; //Deutch
		break;
		case 5:
			result = "Nieuws"; //Netherdand
		break;
}
	return result;
}

//Nachrichten
		

	}
	
}
