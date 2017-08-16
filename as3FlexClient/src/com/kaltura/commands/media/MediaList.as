package com.kaltura.commands.media
{
	import com.kaltura.vo.KalturaMediaEntryFilter;
	import com.kaltura.vo.KalturaFilterPager;
	import com.kaltura.delegates.media.MediaListDelegate;
	import com.kaltura.net.KalturaCall;

	public class MediaList extends KalturaCall
	{
		public var filterFields : String;
		public function MediaList( filter : KalturaMediaEntryFilter=null,pager : KalturaFilterPager=null )
		{
			if(filter== null)filter= new KalturaMediaEntryFilter();
			if(pager== null)pager= new KalturaFilterPager();
			service= 'media';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = kalturaObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = kalturaObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaListDelegate( this , config );
		}
	}
}
