package com.kaltura.commands.system
{
	import com.kaltura.vo.KalturaSystemUserFilter;
	import com.kaltura.vo.KalturaFilterPager;
	import com.kaltura.delegates.system.SystemListUsersDelegate;
	import com.kaltura.net.KalturaCall;

	public class SystemListUsers extends KalturaCall
	{
		public var filterFields : String;
		public function SystemListUsers( filter : KalturaSystemUserFilter=null,pager : KalturaFilterPager=null )
		{
			if(filter== null)filter= new KalturaSystemUserFilter();
			if(pager== null)pager= new KalturaFilterPager();
			service= 'system';
			action= 'listUsers';

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
			delegate = new SystemListUsersDelegate( this , config );
		}
	}
}
