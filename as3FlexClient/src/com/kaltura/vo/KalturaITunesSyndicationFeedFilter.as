package com.kaltura.vo
{
	import com.kaltura.vo.KalturaBaseSyndicationFeedFilter;

	[Bindable]
	public dynamic class KalturaITunesSyndicationFeedFilter extends KalturaBaseSyndicationFeedFilter
	{
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
