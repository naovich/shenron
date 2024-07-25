package com.nao.Forms  {
	
		import com.nao.Images.Image;
		import com.nao.Textes.IconeTexte;
		import com.nao.Textes.Paragraph;
		import com.nao.Containers.Balise;
		import com.nao.Images.IconeBalise;
		import com.nao.Components.Bouton;
		import com.nao.Power.Ki;
		import com.nao.Basic.Position;
		import com.nao.Pages.Page;
		import com.nao.Pages.Grid;
		import com.nao.Components.Telephone;
		import com.nao.Components.Adress;
		import com.nao.Components.SocialIcon;
		import com.nao.Images.Maps;
		import com.nao.Forms.TexteInput;
		import com.nao.Forms.SelectInput;
		import com.nao.Forms.InputCheckBox;
		import com.nao.Forms.InputRadio;
		import flash.geom.Point;
	
	public class Contact extends Balise {
		
		private var _page:Page = new Page(1200,1000,0xAAAABB);
		private var _grid:Grid = new Grid(_page,0,0,20,20,12,20);
		private var _mainModule:Balise = new Balise(0,0,176,200);
		private var _header:Balise = new Balise(0,0,176,40);
		private var _footer:Balise = new Balise(0,0,176,40);
		private var _icone:IconeBalise = new IconeBalise("",0,0,0,30);
		private var _titre:IconeTexte = new IconeTexte("Contact us","",0,0,0,110);
		private var _sousTitre:Paragraph = new Paragraph(0,50,130,4);
		private var _texte:Paragraph = new Paragraph(0,50,130,4);
		private var _bouton:Bouton = new Bouton("Submit") ;
		private var _telephone:Telephone = new Telephone();
		private var _adress:Adress = new Adress();
		private var _logo:Image = new Image(0,0,120,50);
		private var _map:Maps = new Maps();
		private var _socialIcon:SocialIcon = new SocialIcon();
		
		private var _firstname:TexteInput = new TexteInput("Firstname");
		private var _secondname:TexteInput = new TexteInput("Secondname");
		private var _lastname:TexteInput = new TexteInput("Lastname");
		private var _birthDate:TexteInput = new TexteInput("Date of birth");
		private var _country:SelectInput = new SelectInput("Country");
		private var _city:TexteInput = new TexteInput("City",0,0,250,25);
		private var _location:TexteInput = new TexteInput("Adress");
		private var _email:TexteInput = new TexteInput("Email");
		private var _subject:TexteInput = new TexteInput("Subject");
		private var _phone:TexteInput = new TexteInput("Phone");
		private var _message:TexteInput = new TexteInput("Message",0,0,250,250);
		
		private var _departureDate:TexteInput = new TexteInput("Check in date",0,0,160,25); 

		private var _arrivalDate:TexteInput = new TexteInput("Check out date",0,0,160,25); 
		private var _maxPrice:TexteInput = new TexteInput("Max price",0,0,160,25); 
		private var _minPrice:TexteInput = new TexteInput("Min price",0,0,160,25); 
		private var _adult:SelectInput = new SelectInput("Adult",0,0,160,25); 
		private var _children:SelectInput = new SelectInput("Children",0,0,160,25); 
		private var _night:SelectInput = new SelectInput("Night"); 
		
		private var _property:SelectInput = new SelectInput("Property type",0,0,160,25);  
		private var _bedroom:SelectInput = new SelectInput("Bedrooms",0,0,160,25); 
		private var _bathroom:SelectInput = new SelectInput("Bathrooms",0,0,160,25); 
		private var _minSquareFootage:SelectInput = new SelectInput("Square footage",0,0,160,25);  
		
		
		
		private var _positionTexteInput:uint = 0;
		private var _positionTab:Array = new Array();
		private var _formType:uint = 1;
		
		
		
		
		public function Contact(grid:Grid, x:Number = 0, y:Number = 0, width:Number = 500,column:uint = 2, height:Number = 500) {
			// constructor code
			super(x,y,width,height);
			_grid = grid;
			this.addBalise(header);
			this.addBalise(footer);
			this.addBalise(mainModule);
			this.addBalise(titre);
			this.addBalise(sousTitre);
			this.addBalise(texte);
			this.addBalise(icone);
			this.addBalise(bouton);
			this.addBalise(telephone);
			this.addBalise(adress);
			this.addBalise(email);
			this.addBalise(subject);
			this.addBalise(phone);
			this.addBalise(socialIcon);
			this.addBalise(map);
			
			this.addBalise(firstname);
			this.addBalise(secondname);
			this.addBalise(lastname);
			this.addBalise(birthDate);
			this.addBalise(country);
			this.addBalise(city);
			this.addBalise(location);
			this.addBalise(message);
			this.addBalise(bouton);
		
			this.addBalise(departureDate);
			this.addBalise(arrivalDate);
			this.addBalise(maxPrice);
			this.addBalise(minPrice);
			this.addBalise(adult);
			this.addBalise(children);
			this.addBalise(night);
			this.addBalise(property);
			this.addBalise(bedroom);
			this.addBalise(bathroom);
			this.addBalise(minSquareFootage);
			
			this.column = column;
			this.padding = 10 ;
			this.paddingTop = 0;
			titre.margin = 0;
			
			_departureDate.iconeTexte.icone.label = "";
			_arrivalDate.iconeTexte.icone.label = "";
			_departureDate.iconeTexte.positionIcone = 1;
			_arrivalDate.iconeTexte.positionIcone = 1;
			_departureDate.iconeTexte.marginRight = 0;	
			_arrivalDate.iconeTexte.marginLeft = 0;	
				
			defaultContact(column);
			
			
			
			
			
		}
		
		private function defaultContact(nbCol):void{
			
			 var _defaultModule:Balise = new Balise(0,0,176,this.htmlHeight);
			 var _defaultMainModule:Balise = new Balise(0,0,176,400);
			 var _defaultHeader:Balise = new Balise(0,0,176,40);
			 var _defaultFooter:Balise = new Balise(0,0,176,40);
			 var _defaultIcone:IconeBalise = new IconeBalise("",0,0,0,30);
			 var _defaultTitre:IconeTexte = new IconeTexte("Contact us","",0,0,0,110);
			 var _defaultSousTitre:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultTexte:Paragraph = new Paragraph(0,50,130,4);
			 var _defaultBouton:Bouton = new Bouton("Submit") ;
			 var _defaultTelephone:Telephone = new Telephone();
			 var _defaultAdress:Adress = new Adress();
			 var _defaultLogo:Image = new Image(0,0,120,50);
			 var _defaultMap:Maps = new Maps();
			 var _defaultSocialIcon:SocialIcon = new SocialIcon();
			
			 var _defaultFirstname:TexteInput = new TexteInput("Firstname");
			 var _defaultSecondname:TexteInput = new TexteInput("Secondname");
			 var _defaultLastname:TexteInput = new TexteInput("Lastname");
			 var _defaultBirthDate:TexteInput = new TexteInput("Date of birth");
			 var _defaultCountry:SelectInput = new SelectInput("Country");
			 var _defaultCity:TexteInput = new TexteInput("City",0,0,250);
			 var _defaultLocation:TexteInput = new TexteInput("Adress");
			 var _defaultEmail:TexteInput = new TexteInput("Email");
			 var _defaultSubject:TexteInput = new TexteInput("Subject");
			 var _defaultPhone:TexteInput = new TexteInput("Phone");
			 var _defaultMessage:TexteInput = new TexteInput("",0,0,250,250);
			 
			 var _defaultDepartureDate:TexteInput = new TexteInput("Check in date",0,0,160,25); 
			 var _defaultArrivalDate:TexteInput = new TexteInput("Check out date",0,0,160,25);  
		     var _defaultMaxPrice:TexteInput = new TexteInput("Max price",0,0,160,25);  
		     var _defaultMinPrice:TexteInput = new TexteInput("Min price",0,0,160,25);  
		     var _defaultAdult:SelectInput = new SelectInput("Adult",0,0,160,25);  
		     var _defaultChildren:SelectInput = new SelectInput("Children",0,0,160,25);  
		     var _defaultNight:SelectInput = new SelectInput("Night"); 
		
		     var _defaultProperty:SelectInput = new SelectInput("Property type",0,0,160,25);  
		     var _defaultBedroom:SelectInput = new SelectInput("Bedrooms",0,0,160,25); 
		     var _defaultBathroom:SelectInput = new SelectInput("Bathrooms",0,0,160,25); 
			 var _defaultMinSquareFootage:SelectInput = new SelectInput("Square footage",0,0,160,25);  
			
			
				mainModule.visible = false;
				header.visible = false;
				footer.visible = false;
				country.visible = false;
				city.visible = false;
				secondname.visible = false;
				icone.visible = false;
				sousTitre.visible = false;
				texte.visible = false;
				telephone.visible = false;
				adress.visible = false;
				logo.visible = false;
				socialIcon.visible = false;
				birthDate.visible = false;
				location.visible = false;
				phone.visible = false;
				map.visible = false;
				
				firstname.visible = false;
				lastname.visible = false;
				email.visible = false;
				subject.visible = false;
				message.visible = false;
				
				location.visible = false;
				departureDate.visible = false;
				arrivalDate.visible = false;
				maxPrice.visible = false;
				minPrice.visible = false;
				adult.visible = false;
				children.visible = false;
				night.visible = false;
				bathroom.visible = false;
				property.visible = false;
				bedroom.visible = false;
				bathroom.visible = false;
				minSquareFootage.visible = false;
				
				
				
				bouton.visible = true;
				
				
				city.position = 0;
				departureDate.position = 4;
				arrivalDate.position = 4;
				maxPrice.position = 0;
				minPrice.position = 0;
				adult.position = 3;
				children.position = 3;
				night.position = 3;
				bathroom.position = 3;
				property.position = 3;
				bedroom.position = 3;
				bathroom.position = 3;
				minSquareFootage.position = 3;
				
				/*departureDate.value = departureDate.label;
				arrivalDate.value = arrivalDate.label;*/
				departureDate.label = "";
				arrivalDate.label = "";
				
				
				
				
			 positionTab.push(departureDate);
			 positionTab.push(arrivalDate);
			 positionTab.push(maxPrice);
			 positionTab.push(minPrice);
			 positionTab.push(adult);
			 positionTab.push(children);
			 positionTab.push(night);
			 positionTab.push(property);
			 positionTab.push(bedroom);
			 positionTab.push(bathroom);
			 positionTab.push(minSquareFootage);
			 positionTab.push(firstname);
			 positionTab.push(lastname);
			 positionTab.push(email);
			 positionTab.push(subject);
			 positionTab.push(birthDate);
			 positionTab.push(country);
			 positionTab.push(city);
			 positionTab.push(location);
			 positionTab.push(message);
				
			 positionTab.push(departureDate);
			 positionTab.push(arrivalDate);
			 positionTab.push(maxPrice);
			 positionTab.push(minPrice);
			 positionTab.push(adult);
			 positionTab.push(children);
			 positionTab.push(night);
			 positionTab.push(property);
			 positionTab.push(bedroom);
			 positionTab.push(bathroom);
			 positionTab.push(minSquareFootage);
	
			
			
			 
			
			_defaultModule.padding = this.padding ;
			 Ki.equalizeMain(this,_defaultModule);
			 Ki.equalize(mainModule,_defaultMainModule);
			 Ki.equalize(header,_defaultHeader);
			 Ki.equalize(footer,_defaultFooter);
			 Ki.equalize(titre,_defaultTitre);
			 Ki.equalize(texte,_defaultTexte);
			 Ki.equalize(bouton,_defaultBouton);
			 Ki.equalize(map,_defaultMap);
			 Ki.equalize(icone, _defaultIcone);
			 Ki.equalize(sousTitre, _defaultSousTitre);
			 Ki.equalize(telephone, _defaultTelephone);
			 Ki.equalize(adress, _defaultAdress);
			 Ki.equalize(logo, _defaultLogo);
			 Ki.equalize(socialIcon, _defaultSocialIcon);
			 Ki.equalize(firstname, _defaultFirstname);
			 Ki.equalize(secondname, _defaultSecondname);
			 Ki.equalize(lastname, _defaultLastname);
			 Ki.equalize(birthDate, _defaultBirthDate);
			 Ki.equalize(country, _defaultCountry);
			 Ki.equalize(location, _defaultLocation);
			 Ki.equalize(email, _defaultEmail);
			 Ki.equalize(subject, _defaultSubject);
			 Ki.equalize(phone, _defaultPhone);
			 Ki.equalize(message, _defaultMessage);
			 Ki.equalize(bouton, _defaultBouton);
			 
			 Ki.equalize(departureDate, _defaultDepartureDate);
			 Ki.equalize(arrivalDate, _defaultArrivalDate);
			 Ki.equalize(maxPrice, _defaultMaxPrice);
			 Ki.equalize(minPrice, _defaultMinPrice);
			 Ki.equalize(adult, _defaultAdult);
			 Ki.equalize(children, _defaultChildren);
			 Ki.equalize(night, _defaultNight);
			 Ki.equalize(property, _defaultProperty);
			 Ki.equalize(phone, _defaultBedroom);
			 Ki.equalize(bedroom, _defaultMessage);
			 Ki.equalize(bathroom, _defaultBathroom);
			 Ki.equalize(minSquareFootage,_defaultMinSquareFootage);
			 
			
			mainModule ==_defaultMainModule;
			header ==_defaultHeader;
			footer ==_defaultFooter;
			titre ==_defaultTitre;
			texte ==_defaultTexte;
			bouton ==_defaultBouton;
			map ==_defaultMap;
			icone == _defaultIcone;
			sousTitre == _defaultSousTitre;
			telephone == _defaultTelephone;
			adress == _defaultAdress;
			logo == _defaultLogo;
			socialIcon == _defaultSocialIcon;
			firstname == _defaultFirstname;
			secondname == _defaultSecondname;
			lastname == _defaultLastname;
			birthDate == _defaultBirthDate;
			country == _defaultCountry;
			location == _defaultLocation;
			email == _defaultEmail;
			subject == _defaultSubject;
			phone == _defaultPhone;
			message == _defaultMessage;
			
			departureDate == _defaultDepartureDate
			arrivalDate == _defaultArrivalDate;
			maxPrice == _defaultMaxPrice;
			minPrice == _defaultMinPrice;
			adult == _defaultAdult;
		    children == _defaultChildren;
			night == _defaultNight;
			property == _defaultProperty;
			bedroom == _defaultBedroom;
			bathroom == _defaultBathroom;
			minSquareFootage == _defaultMinSquareFootage;
			
			
			header.positionArray[1] = this;
			footer.positionArray[1] = this;
			mainModule.positionArray[1] = this;
			titre.positionArray[1] = this;
			sousTitre.positionArray[1] = this;
			texte.positionArray[1] = this;
			icone.positionArray[1] = this;
			bouton.positionArray[1] = this;
			telephone.positionArray[1] = this;
			adress.positionArray[1] = this;
			email.positionArray[1] = this;
			subject.positionArray[1] = this;
			phone.positionArray[1] = this;
			socialIcon.positionArray[1] = this;
			map.positionArray[1] = this;
			
			firstname.positionArray[1] = this;
			secondname.positionArray[1] = this;
			lastname.positionArray[1] = this;
			birthDate.positionArray[1] = this;
			country.positionArray[1] = this;
			city.positionArray[1] = this;
			location.positionArray[1] = this;
			message.positionArray[1] = this;
			
			
			departureDate.positionArray[1] = this;
			arrivalDate.positionArray[1] = this;
			maxPrice.positionArray[1] = this;
			minPrice.positionArray[1] = this;
			adult.positionArray[1] = this;
		    children.positionArray[1] = this;
			night.positionArray[1] = this;
			property.positionArray[1] = this;
			phone.positionArray[1] = this;
			bedroom.positionArray[1] = this;
			bathroom.positionArray[1] = this;
			minSquareFootage.positionArray[1] = this;
			
			header.positionArray[0] = this;
			footer.positionArray[0] = mainModule;
			mainModule.positionArray[0] = header;
			titre.positionArray[0] = this;
			sousTitre.positionArray[0] = titre;
			texte.positionArray[0] = this;
			icone.positionArray[0] = this;
			bouton.positionArray[0] = message;
			telephone.positionArray[0] = this;
			adress.positionArray[0] = this;
			email.positionArray[0] = lastname;
			subject.positionArray[0] = email;
			phone.positionArray[0] = this;
			socialIcon.positionArray[0] = this;
			map.positionArray[0] = this;
			
			firstname.positionArray[0] = titre;
			secondname.positionArray[0] = firstname;
			lastname.positionArray[0] = firstname;
			birthDate.positionArray[0] = lastname;
			country.positionArray[0] = birthDate;
			city.positionArray[0] = country;
			location.positionArray[0] = city;
			message.positionArray[0] = subject;
			
			
			departureDate.positionArray[0] = this;
			arrivalDate.positionArray[0] = this;
			maxPrice.positionArray[0] = this;
			minPrice.positionArray[0] = this;
			adult.positionArray[1] = this;
		    children.positionArray[0] = this;
			night.positionArray[0] = this;
			property.positionArray[0] = this;
			phone.positionArray[0] = this;
			bedroom.positionArray[0] = this;
			bathroom.positionArray[0] = this;
			minSquareFootage.positionArray[0] = this;
			
			
			
			
			titre.margin = 10;
			sousTitre.margin = 10;
			texte.margin = 10;
			icone.margin = 10;
			bouton.margin = 10;
			telephone.margin = 10;
			adress.margin = 10;
			email.margin = 10;
			subject.margin = 10;
			phone.margin = 10;
			socialIcon.margin = 10;
			map.margin = 10;
			
			firstname.margin = 10;
			secondname.margin = 10;
			lastname.margin = 10;
			birthDate.margin = 10;
			country.margin = 10;
			city.margin = 5;
			location.margin = 10;
			message.margin = 10;
			bouton.margin = 10;
			bouton.marginBottom = 0;
			message.marginBottom = 15;
			
			departureDate.margin = 5;
			arrivalDate.margin = 5;
			maxPrice.margin = 5;
			minPrice.margin = 5;
			adult.margin = 5;
		    children.margin = 5;
			night.margin = 5;
			property.margin = 5;
			phone.margin = 5;
			bedroom.margin = 5;
			bathroom.margin = 5;
			minSquareFootage.margin = 5;
			
			//departureDate.margin = 5;
			arrivalDate.marginLeft = 0;
			departureDate.marginRight = 0;
			
			minPrice.marginRight = 5;
			//maxPrice.paddingRight = 0;
			
			
			this.htmlWidth = grid.colWidth(nbCol);
			//this.htmlWidth = 400;
		
			//-----------SCALE----------------
			header.scale.x = 1;
			mainModule.scale.x = 1;
			footer.scale.x = 1;
			
			//---------POSITION---------------
			
			header.positionTypeX = 2;
			header.positionTypeY = 2;
			
			mainModule.positionTypeX = 2;
			mainModule.positionTypeY = 2;
			
			footer.positionTypeX = 2;
			footer.positionTypeY = 2;
			
			
			titre.positionTypeX = 4;
			titre.positionTypeY = 3;
			
			
			firstname.positionTypeX = 5;
			firstname.positionTypeY = 6;
			firstname.positionArray[0] = titre;
			firstname.fixedPositionY = 0;
			firstname.position = 1;
			
			lastname.positionTypeX = 5;
			lastname.positionTypeY = 6;
			lastname.positionArray[0] = firstname;
			lastname.fixedPositionY = 0;
			lastname.position = 1;
			
			email.positionTypeX = 5;
			email.positionTypeY = 6;
			email.positionArray[0] = lastname;
			email.fixedPositionY = 0;
			email.position = 1;
			
			subject.positionTypeX = 5;
			subject.positionTypeY = 6;
			subject.positionArray[0] = email;
			subject.fixedPositionY = 0;
			subject.position = 1;
			
			message.positionTypeX = 5;
			message.positionTypeY = 6;
			message.positionArray[0] = subject;
			message.position = 2;
			
			bouton.positionTypeX = 5;
			bouton.positionTypeY = 6;
			bouton.positionArray[0] = message;
			
		//------------- Hotel ---------------	
			city.positionTypeX = 5;
			city.positionTypeY = 6;
			city.positionArray[0] = titre;
			
			departureDate.positionTypeX = 5;
			departureDate.positionTypeY = 6;
			departureDate.positionArray[0] = city;
			
			arrivalDate.positionTypeX = 6;
			arrivalDate.positionTypeY = 6;
			arrivalDate.positionArray[0] = city;
			arrivalDate.positionArray[5] = departureDate;
			
			minPrice.positionTypeX = 5;
			minPrice.positionTypeY = 6;
			minPrice.positionArray[0] = arrivalDate;
			
			maxPrice.positionTypeX = 6;
			maxPrice.positionTypeY = 6;
			maxPrice.positionArray[0] = arrivalDate;
			maxPrice.positionArray[5] = minPrice;
			
			adult.positionTypeX = 5;
			adult.positionTypeY = 6;
			adult.positionArray[0] = maxPrice;
			
			children.positionTypeX = 3;
			children.positionTypeY = 6;
			children.positionArray[0] = maxPrice;
			
			night.positionTypeX = 5;
			night.positionTypeY = 6;
			night.positionArray[0] = children;
			
			property.positionTypeX = 5;
			property.positionTypeY = 6;
			property.positionArray[0] = night;
			
			minSquareFootage.positionTypeX = 3;
			minSquareFootage.positionTypeY = 6;
			minSquareFootage.positionArray[0] = night;
			
			bedroom.positionTypeX = 5;
			bedroom.positionTypeY = 6;
			bedroom.positionArray[0] = property;
			
			bathroom.positionTypeX = 3;
			bathroom.positionTypeY = 6;
			bathroom.positionArray[0] = property;
			
			
			if(formType == 1){
					
				firstname.visible = true;
				lastname.visible = true;
				email.visible = true;
				subject.visible = true;
				message.visible = true;
					
				//bouton.label = "Submit"
				
				}else if(formType == 2){
					
			
					
				minPrice.positionTypeX = 5;
				minPrice.positionTypeY = 6;
				minPrice.positionArray[0] = arrivalDate;
				
				maxPrice.positionTypeX = 6;
				maxPrice.positionTypeY = 6;
				maxPrice.positionArray[0] = arrivalDate;
				maxPrice.positionArray[5] = minPrice;
					
					
					
				titre.label ="Reservation";
				city.visible = true;
				departureDate.visible = true;
				arrivalDate.visible = true;
				maxPrice.visible = true;
				minPrice.visible = true;
				
				
				minPrice.marginRight = 9;
				
				
				/*adult.visible = true;
				children.visible = true;
				night.visible = true;*/
				city.widthType = 2;
				bouton.value = "Search";
				bouton.positionTypeX = 5;
				bouton.positionTypeY = 6;
				bouton.positionArray[0] = minPrice;
				bouton.widthType = 2;	
				this.paddingRight = 0;
				//this.paddingLeft = 5;
				
				this.city.inputText.inputWidth = 324;
				this.bouton.htmlWidth = 324;
					
				}else if(formType == 3){
				
				titre.label ="Find";
					
				city.visible = true;
				maxPrice.visible = true;
				minPrice.visible = true;
				property.visible = true;
				/*bedroom.visible = true;
				bathroom.visible = true;*/
				minSquareFootage.visible = true;
					
					
				minPrice.positionTypeX = 5;
				minPrice.positionTypeY = 6;
				minPrice.positionArray[0] = city;
				minPrice.marginRight = 9;
				
				maxPrice.positionTypeX = 6;
				maxPrice.positionTypeY = 6;
				maxPrice.positionArray[0] = city;
				maxPrice.positionArray[5] = minPrice;
				
				property.positionTypeX = 5;
				property.positionTypeY = 6;
				property.positionArray[0] = minPrice;
				//property.marginRight = 59;
				//bedroom.visible = true;
				//bathroom.visible = true;
				
				bouton.value = "Search";
				bouton.fixedWidth = 300;
				bouton.widthType = 0;
					
				property.positionTypeX = 5;
				property.positionTypeY = 6;
				property.positionArray[0] = maxPrice;
				property.combobox.inputWidth = 160;
				//property.resizeBalise();
				
				
				minSquareFootage.positionTypeX = 6;
				minSquareFootage.positionTypeY = 6;
				minSquareFootage.positionArray[0] = maxPrice;
				minSquareFootage.positionArray[5] = property;
				minSquareFootage.combobox.inputWidth = 160;
				
				bedroom.positionTypeX = 5;
				bedroom.positionTypeY = 6;
				bedroom.positionArray[0] = property;
				bedroom.combobox.inputWidth = 160;
				
				bathroom.positionTypeX = 6;
				bathroom.positionTypeY = 6;
				bathroom.positionArray[0] = property;
				bathroom.positionArray[5] = bedroom;
				bathroom.combobox.inputWidth = 160;
				
				bouton.positionTypeX = 5;
				bouton.positionTypeY = 6;
				bouton.positionArray[0] = property;

				
				this.city.inputText.inputWidth = 324;
				this.bouton.htmlWidth = 324;
			
					
				}else if(formType == 4){
				
				titre.label ="Reservation";
				bouton.value = "Reserve";	
				property.label = "Room type";	
	
				night.visible = true;
				adult.visible = true;
				children.visible = true;
				property.visible = true;
				
				
				adult.positionTypeX = 5;
				adult.positionTypeY = 6;
				adult.positionArray[0] = titre;
				adult.combobox.inputWidth = 160;
					
				children.positionTypeX = 6;
				children.positionTypeY = 6;
				children.positionArray[0] = titre;
				children.combobox.inputWidth = 160;
				children.positionArray[5] = adult;
					
					
				night.positionTypeX = 5;
				night.positionTypeY = 6;
				night.positionArray[0] = adult;
				night.combobox.inputWidth = 160;
				
				
				property.positionTypeX = 6;
				property.positionTypeY = 6;
				property.positionArray[0] = adult;
				property.positionArray[5] = night;
				property.combobox.inputWidth = 160;
				
				bouton.positionTypeX = 5;
				bouton.positionTypeY = 6;
				bouton.positionArray[0] = night;

				
				
				this.bouton.htmlWidth = 324;
			
					
				}
			
			Ki.contactChange(this);
						
		}
		
	
	
		
		//---------------
		public function get firstname(): TexteInput {
			return _firstname;
		}

		public function set firstname(firstname: TexteInput) {
			_firstname = firstname;
		}
		
		//---------------
		public function get secondname(): TexteInput {
			return _secondname;
		}

		public function set secondname(secondname: TexteInput) {
			_secondname = secondname;
		}
		
		//---------------
		public function get lastname(): TexteInput {
			return _lastname;
		}

		public function set lastname(lastname: TexteInput) {
			_lastname = lastname;
		}
		
			//---------------
		public function get birthDate(): TexteInput {
			return _birthDate;
		}

		public function set birthDate(birthDate: TexteInput) {
			_birthDate = birthDate;
		}
		
		//---------------
		public function get country(): SelectInput {
			return _country;
		}

		public function set country(country: SelectInput) {
			_country = country;
		}
		
		//---------------
		public function get email(): TexteInput {
			return _email;
		}

		public function set email(email: TexteInput) {
			_email = email;
		}
		
		
		//---------------
		public function get subject(): TexteInput {
			return _subject;
		}

		public function set subject(subject: TexteInput) {
			_subject = subject;
		}
		
		//---------------
		public function get phone(): TexteInput {
			return _phone;
		}

		public function set phone(phone: TexteInput) {
			_phone = phone;
		}
		
		//---------------
		public function get city(): TexteInput {
			return _city;
		}

		public function set city(city: TexteInput) {
			_city = city;
		}
		//---------------
		public function get location(): TexteInput {
			return _location;
		}

		public function set location(location: TexteInput) {
			_location = location;
		}
		
		
		//---------------
		public function get message(): TexteInput {
			return _message;
		}

		public function set message(message: TexteInput) {
			_message = message;
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
		
		//	//---------------
		//public function get image(): Image {
		//	return _image;
		//}

		//public function set image(image: Image) {
		//	_image = image;
		//}
		
		
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
		public function get map(): Maps {
			return _map;
		}

		public function set map(map: Maps) {
			_map = map;
		}
		
		//---------------------	
		public function get socialIcon(): SocialIcon {
			return _socialIcon;
		}

		public function set socialIcon(socialIcon: SocialIcon) {
			_socialIcon = socialIcon;
		}
		
		//---------------------	
		public function get grid(): Grid {
			return _grid;
		}

		public function set grid(grid: Grid) {
			_grid = grid;
		}
	
		
		//---------------------	
		public function get positionTexteInput(): uint {
			return _positionTexteInput;
		}

		public function set positionTexteInput(positionTexteInput: uint) {
			_positionTexteInput = positionTexteInput;
			Ki.contactChange(this);
			
		}
		
		//---------------------	
		public function get positionTab(): Array {
			return _positionTab;
		}

		public function set positionTab(positionTab: Array) {
			_positionTab = positionTab;
		}
		
		//---------------------	
		public function get formType(): uint {
			return _formType;
		}

		public function set formType(formType: uint) {
			_formType = formType;
		}
		
		//---------------------	
		public function get departureDate(): TexteInput {
			return _departureDate;
		}

		public function set departureDate(departureDate: TexteInput) {
			_departureDate = departureDate;
		}
		
		//---------------------	
		public function get arrivalDate(): TexteInput {
			return _arrivalDate;
		}

		public function set arrivalDate(arrivalDate: TexteInput) {
			_arrivalDate = arrivalDate;
		}
		
		//---------------------	
		public function get maxPrice(): TexteInput {
			return _maxPrice;
		}

		public function set maxPrice(maxPrice: TexteInput) {
			_maxPrice = maxPrice;
		}
		
		//---------------------	
		public function get minPrice(): TexteInput {
			return _minPrice;
		}

		public function set minPrice(minPrice: TexteInput) {
			_minPrice = minPrice;
		}
		
		//---------------------	
		public function get adult(): SelectInput {
			return _adult;
		}

		public function set adult(adult: SelectInput) {
			_adult = adult;
		}
		
		//---------------------	
		public function get children(): SelectInput {
			return _children;
		}

		public function set children(children: SelectInput) {
			_children = children;
		}
		
		//---------------------	
		public function get night(): SelectInput {
			return _night;
		}

		public function set night(night: SelectInput) {
			_night = night;
		}
		
		//---------------------	
		public function get property(): SelectInput {
			return _property;
		}

		public function set property(property: SelectInput) {
			_property = property;
		}
		
		//---------------------	
		public function get bedroom(): SelectInput {
			return _bedroom;
		}

		public function set bedroom(bedroom: SelectInput) {
			_bedroom = bedroom;
		}
		
		//---------------------	
		public function get bathroom(): SelectInput {
			return _bathroom;
		}

		public function set bathroom(bathroom: SelectInput) {
			_bathroom = bathroom;
		}
	
		//---------------------	
		public function get minSquareFootage(): SelectInput {
			return _minSquareFootage;
		}

		public function set minSquareFootage(minSquareFootage: SelectInput) {
			_minSquareFootage = minSquareFootage;
		}
		
		
		
		
		
		
	}
	
}
