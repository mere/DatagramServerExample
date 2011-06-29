package com.mere.examples.application
{
	import com.mere.examples.domain.DatagramLogs;
	import com.mere.utils.datagramserver.events.DataReceivedEvent;
	import com.mere.utils.datagramserver.events.DatagramStatusEvent;
	
	import flash.events.Event;

	public class DatagramCommand
	{
		[Inject]
		public var logs:DatagramLogs;
		
		[MessageHandler]
		public function dataReceived(e:DataReceivedEvent):void
		{
			trace('data received:'+e.string);
			logs.add(e.string);
		}
		
		[MessageHandler(selector="CLEARLOGS")]
		public function clearData(e:Event):void
		{
			logs.logs.removeAll();
		}
		
		[MessageHandler]
		public function onStatusChanged(e:DatagramStatusEvent):void
		{
			logs.add(e.message);
		}
		
	}
}