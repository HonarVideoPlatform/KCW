package com.kaltura.vo
{
	import com.kaltura.vo.BaseFlexVo;
	[Bindable]
	public dynamic class KalturaBulkUpload extends BaseFlexVo
	{
		public var id : int = int.MIN_VALUE;
		public var uploadedBy : String;
		public var uploadedOn : int = int.MIN_VALUE;
		public var numOfEntries : int = int.MIN_VALUE;
		public var status : int = int.MIN_VALUE;
		public var logFileUrl : String;
		public var csvFileUrl : String;
		public var results : Array = new Array();
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('id');
			propertyList.push('uploadedBy');
			propertyList.push('uploadedOn');
			propertyList.push('numOfEntries');
			propertyList.push('status');
			propertyList.push('logFileUrl');
			propertyList.push('csvFileUrl');
			propertyList.push('results');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('uploadedBy');
			arr.push('uploadedOn');
			arr.push('numOfEntries');
			arr.push('status');
			arr.push('logFileUrl');
			arr.push('csvFileUrl');
			arr.push('results');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('uploadedBy');
			arr.push('uploadedOn');
			arr.push('numOfEntries');
			arr.push('status');
			arr.push('logFileUrl');
			arr.push('csvFileUrl');
			arr.push('results');
			return arr;
		}

	}
}
