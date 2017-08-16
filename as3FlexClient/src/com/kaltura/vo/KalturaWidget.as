package com.kaltura.vo
{
	import com.kaltura.vo.BaseFlexVo;
	[Bindable]
	public dynamic class KalturaWidget extends BaseFlexVo
	{
		public var id : String;
		public var sourceWidgetId : String;
		public var rootWidgetId : String;
		public var partnerId : int = int.MIN_VALUE;
		public var entryId : String;
		public var uiConfId : int = int.MIN_VALUE;
		public var securityType : int = int.MIN_VALUE;
		public var securityPolicy : int = int.MIN_VALUE;
		public var createdAt : int = int.MIN_VALUE;
		public var updatedAt : int = int.MIN_VALUE;
		public var partnerData : String;
		public var widgetHTML : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('id');
			propertyList.push('sourceWidgetId');
			propertyList.push('rootWidgetId');
			propertyList.push('partnerId');
			propertyList.push('entryId');
			propertyList.push('uiConfId');
			propertyList.push('securityType');
			propertyList.push('securityPolicy');
			propertyList.push('createdAt');
			propertyList.push('updatedAt');
			propertyList.push('partnerData');
			propertyList.push('widgetHTML');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('sourceWidgetId');
			arr.push('rootWidgetId');
			arr.push('partnerId');
			arr.push('entryId');
			arr.push('uiConfId');
			arr.push('securityType');
			arr.push('securityPolicy');
			arr.push('createdAt');
			arr.push('updatedAt');
			arr.push('partnerData');
			arr.push('widgetHTML');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('sourceWidgetId');
			arr.push('entryId');
			arr.push('uiConfId');
			arr.push('securityType');
			arr.push('securityPolicy');
			arr.push('partnerData');
			return arr;
		}

	}
}
