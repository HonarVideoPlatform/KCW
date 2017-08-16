package com.kaltura.commands.entrySchedule
{
	import com.kaltura.delegates.entrySchedule.EntryScheduleGetDelegate;
	import com.kaltura.net.KalturaCall;

	public class EntryScheduleGet extends KalturaCall
	{
		public var filterFields : String;
		public function EntryScheduleGet( id : int )
		{
			service= 'entrySchedule';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EntryScheduleGetDelegate( this , config );
		}
	}
}
