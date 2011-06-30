package com.mere.examples.application
{
	import com.mere.examples.domain.DatagramLogs;
	import com.mere.utils.datagramserver.events.DataReceivedEvent;
	import com.mere.utils.datagramserver.events.DatagramStatusEvent;
	
	import flash.events.Event;
	
	import mx.core.BitmapAsset;
	
	import spark.components.gridClasses.GridColumn;
	import spark.primitives.BitmapImage;

	public class DatagramCommand
	{
		[Inject]
		public var logs:DatagramLogs;
		
		[MessageHandler]
		public function dataReceived(e:DataReceivedEvent):void
		{
			logs.add(e.string);
			/**
			 * you can also use:
			 * e.ip 	: returns the IP of the sender
			 * e.data 	: returns the packet as a bytearray
			 * e.xml 	: returns the packet as xml
			 */ 
		}
		
		[MessageHandler(selector="CLEARLOGS")]
		public function clearData(e:Event):void
		{
			logs.logs.removeAll();
			GridColumn
		}
		
		[MessageHandler]
		public function onStatusChanged(e:DatagramStatusEvent):void
		{
			logs.add(e.message);
		}
		
	}
}