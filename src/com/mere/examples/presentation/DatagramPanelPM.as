package com.mere.examples.presentation
{
	import com.mere.utils.datagramserver.events.DatagramServerEvent;
	import com.mere.utils.datagramserver.infrastructure.DatagramServer;
	
	import flash.events.Event;

	public class DatagramPanelPM
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		public function connect():void
		{
			dispatcher(new Event(DatagramServerEvent.START));
		}
		
		public function disconnect():void
		{
			dispatcher(new Event(DatagramServerEvent.STOP));
		}
	}
}