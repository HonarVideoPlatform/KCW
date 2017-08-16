package com.kaltura.commands.user
{
	import com.kaltura.vo.KalturaUserFilter;
	import com.kaltura.vo.KalturaFilterPager;
	import com.kaltura.delegates.user.UserListDelegate;
	import com.kaltura.net.KalturaCall;

	public class UserList extends KalturaCall
	{
		public var filterFields : String;
		public function UserList( filter : KalturaUserFilter=null,pager : KalturaFilterPager=null )
		{
			if(filter== null)filter= new KalturaUserFilter();
			if(pager== null)pager= new KalturaFilterPager();
			service= 'user';
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
			delegate = new UserListDelegate( this , config );
		}
	}
}
