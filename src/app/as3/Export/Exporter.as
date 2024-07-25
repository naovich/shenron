package com.nao.Export {

	import com.adobe.images.JPGEncoder;
	import com.adobe.images.PNGEncoder;
	import com.nao.Pages.Page;
	import flash.display.DisplayObject;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.utils.ByteArray;
	import flash.display.MovieClip;
	import flash.net.FileReference;
	import com.nao.Containers.Balise;

	public class Exporter {

		private var _qualite: uint;
		private var _bitmapdata: BitmapData;
		private var _movieClip : DisplayObject;
		

		public function Exporter() {
			// constructor code
		}

		public static function exporterJPG(movieClip : Balise, qualite: uint) {
			// constructor code

			//_qualite = qualite;
			//_movieClip = movieClip;
			
			var bitmapData: BitmapData = new BitmapData(movieClip.htmlWidth, movieClip.htmlHeight);
			bitmapData.draw(movieClip);
			var jpgEncoder: JPGEncoder = new JPGEncoder(qualite);
			var byteArray: ByteArray = jpgEncoder.encode(bitmapData);

			var file: FileReference = new FileReference();
			file.save(byteArray, "Design.jpg");

		}

		public static function exporterPNG(movieClip : Page) {
			
			//_movieClip = movieClip;
			var bitmapData: BitmapData = new BitmapData(movieClip.htmlWidth, movieClip.htmlHeight);
			bitmapData.draw(movieClip);
			var byteArray: ByteArray = PNGEncoder.encode(bitmapData);
			
			var file: FileReference = new FileReference();
			file.save(byteArray, "Design.png");
		}
		
		


	}

}