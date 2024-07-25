package com.nao.Modules  {
	
	import com.nao.Modules.ServicePrice;
	import com.nao.Textes.IconeTexte;
	
	public class ServiceReservation extends ServicePrice {

		private var _squateFootage:IconeTexte = new IconeTexte("Squate footage","",1);
		private var _bedroom:IconeTexte = new IconeTexte("Bedrooms","",1);
		private var _bathroom:IconeTexte = new IconeTexte("Bathrooms","",1);
		private var _residenceType:IconeTexte = new IconeTexte();
		private var _reservationKind:uint ; //(location, hotel, buy, car)
		
		
		public function ServiceReservation(grid:Grid, titre:String = "null", column:uint = 2 ,debutCol:int = -1,height:Number = 200,y:Number = 0,x:Number = 0,width:Number = 200 ) {
		
			// constructor code
			
			super(grid,column ,debutCol,height,y,x,width );
		}
		
		
		
		//---------------
		public function get squateFootage(): IconeTexte {
			return _squateFootage;
		}

		public function set squateFootage(price: IconeTexte) {
			_squateFootage = squateFootage;
		}
		
		//---------------
		public function get bedroom(): IconeTexte {
			return _bedroom;
		}

		public function set bedroom(bedroom: IconeTexte) {
			_bedroom = bedroom;
		}
		
		//---------------
		public function get bathroom(): IconeTexte {
			return _bathroom;
		}

		public function set bathroom(bathroom: IconeTexte) {
			_bathroom = bathroom;
		}
		
		//---------------
		public function get residenceType(): IconeTexte {
			return _residenceType;
		}

		public function set residenceType(residenceType: IconeTexte) {
			_residenceType = residenceType;
		}
		
		//---------------
		public function get reservationKind(): uint {
			return _reservationKind;
		}

		public function set reservationKind(reservationKind: uint) {
			_reservationKind = reservationKind;
		}
		

	}
	
}
