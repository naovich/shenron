package com.nao.General {
	
	public class L {
		
	 //1 English, 2 French,3  Spanish, 4 Deutch, 6 netherland;
		public static var name:uint = 1;
		
		public function L() {
			
			
		}
		
		
	
	//-------------------------
/*	public function get name(): uint {
			return _name;
		}
		
	public function set name(name: uint) {
		_name = name;

	}
		*/

//------------------------------------------WORD------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------

//-----------------------------------------Menu----------------------------

public static function  get home(): String {
	var result:String;
	switch(name){
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


public static function get services(): String {
	var result:String;
	switch(name){
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

public static function  get news(): String {
	var result:String;
	switch(name){
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

//-----------------------Bouton------------------------------

public static function  get viewMore(): String {
	var result:String;
	switch(name){
		case 1:
			result = "Views More"; //English
		break;
		case 2:
			result = "Afficher plus"; //French
		break;
		case 3:
			result = "View More(ES)"; //Spanish
		break;
		case 4:
			result = "View More(DE)"; //Deutch
		break;
		case 5:
			result = "View More(NE)"; //Netherdand
		break;
}
	return result;
}

public static function  get seeMore(): String {
	var result:String;
	switch(name){
		case 1:
			result = "See more"; //English
		break;
		case 2:
			result = "Voir plus"; //French
		break;
		case 3:
			result = "See more"; //Spanish
		break;
		case 4:
			result = "See more"; //Deutch
		break;
		case 5:
			result = "See more"; //Netherdand
		break;
}
	return result;
}

public static function  get addToCart(): String {
	var result:String;
	switch(name){
		case 1:
			result = "Add to cart"; //English
		break;
		case 2:
			result = "Ajouter au panier"; //French
		break;
		case 3:
			result = "Add to cart"; //Spanish
		break;
		case 4:
			result = "Add to cart"; //Deutch
		break;
		case 5:
			result = "Add to cart"; //Netherdand
		break;
}
	return result;
}


public static function  get address(): String {
	var result:String;
	switch(name){
		case 1:
			result = "Address"; //English
		break;
		case 2:
			result = "Addresse"; //French
		break;
		case 3:
			result = "Address"; //Spanish
		break;
		case 4:
			result = "Address"; //Deutch
		break;
		case 5:
			result = "Address"; //Netherdand
		break;
}
	return result;
}

public static function  get aboutUs(): String {
	var result:String;
	switch(name){
		case 1:
			result = "About us"; //English
		break;
		case 2:
			result = "A propos de nous"; //French
		break;
		case 3:
			result = "About us"; //Spanish
		break;
		case 4:
			result = "About us"; //Deutch
		break;
		case 5:
			result = "About us"; //Netherdand
		break;
}
	return result;
}
		

	}
	
}
