package com.kaltura.commands.uiConf
{
	import com.kaltura.vo.KalturaUiConf;
	import com.kaltura.delegates.uiConf.UiConfAddDelegate;
	import com.kaltura.net.KalturaCall;

	public class UiConfAdd extends KalturaCall
	{
		public var filterFields : String;
		public function UiConfAdd( uiConf : KalturaUiConf )
		{
			service= 'uiconf';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = kalturaObject2Arrays(uiConf,'uiConf');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UiConfAddDelegate( this , config );
		}
	}
}
