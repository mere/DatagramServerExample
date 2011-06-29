package com.mere.examples.domain
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class DatagramLogs
	{
		public var logs:ArrayCollection = new ArrayCollection();
		
		public function add(log:String):void
		{
			logs.addItem(log);
		}
	}
}