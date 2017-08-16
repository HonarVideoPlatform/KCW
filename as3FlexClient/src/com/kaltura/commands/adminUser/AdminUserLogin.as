package com.kaltura.commands.adminUser
{
	import com.kaltura.delegates.adminUser.AdminUserLoginDelegate;
	import com.kaltura.net.KalturaCall;

	public class AdminUserLogin extends KalturaCall
	{
		public var filterFields : String;
		public function AdminUserLogin( email : String,password : String )
		{
			service= 'adminuser';
			action= 'login';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			keyArr.push( 'password' );
			valueArr.push( password );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AdminUserLoginDelegate( this , config );
		}
	}
}
