package com.kaltura.commands.system
{
	import com.kaltura.delegates.system.SystemDeleteUserDelegate;
	import com.kaltura.net.KalturaCall;

	public class SystemDeleteUser extends KalturaCall
	{
		public var filterFields : String;
		public function SystemDeleteUser( userId : int )
		{
			service= 'system';
			action= 'deleteUser';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemDeleteUserDelegate( this , config );
		}
	}
}
