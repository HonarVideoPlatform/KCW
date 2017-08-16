package com.kaltura.commands.liveStream
{
	import com.kaltura.delegates.liveStream.LiveStreamGetDelegate;
	import com.kaltura.net.KalturaCall;

	public class LiveStreamGet extends KalturaCall
	{
		public var filterFields : String;
		public function LiveStreamGet( entryId : String,version : int=-1 )
		{
			service= 'livestream';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamGetDelegate( this , config );
		}
	}
}
