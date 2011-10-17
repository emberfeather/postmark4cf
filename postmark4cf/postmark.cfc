component extends="base" {
	public component function init( required string apiKey, numeric threshold = 500 ) {
		super.init(arguments.apiKey);
		
		variables.threshold = arguments.threshold;
		
		variables.messages = [];
		variables.results = [];
		
		return this;
	}
	
	public void function addMessage(required struct message) {
		arrayAppend(variables.messages, arguments.message);
	}
	
	public struct function activateBounce(required numeric bounceID) {
		// Send the request
		http url="#variables.baseUrl#/bounces/#arguments.bounceID#/activate" method="put" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
		}
		
		__checkForErrors(local.apiResults, 'Failed to retrieve bounce information');
		
		return deserializeJson(local.apiResults.filecontent);
	}
	
	public struct function getBounce(required numeric bounceID) {
		// Send the request
		http url="#variables.baseUrl#/bounces/#arguments.bounceID#" method="get" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
		}
		
		__checkForErrors(local.apiResults, 'Failed to retrieve bounce information');
		
		return deserializeJson(local.apiResults.filecontent);
	}
	
	public struct function getBounceDump(required numeric bounceID) {
		// Send the request
		http url="#variables.baseUrl#/bounces/#arguments.bounceID#/dump" method="get" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
		}
		
		__checkForErrors(local.apiResults, 'Failed to retrieve bounce dump');
		
		return deserializeJson(local.apiResults.filecontent);
	}
	
	public struct function getBounces(struct filter = {}, numeric count = 25, numeric offset = 0) {
		local.items = listToArray(structKeyList(arguments.filter));
		
		// Send the request
		http url="#variables.baseUrl#/bounces" method="get" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
			
			httpparam type="url" name="count" value="#arguments.count#";
			httpparam type="url" name="offset" value="#arguments.offset#";
			
			for(local.i in local.items) {
				httpparam type="url" name="#local.i#" value="#arguments.filter[local.i]#";
			}
		}
		
		__checkForErrors(local.apiResults, 'Failed to retreive bounced messages');
		
		return deserializeJson(local.apiResults.filecontent);
	}
	
	public array function getBounceTags() {
		// Send the request
		http url="#variables.baseUrl#/bounces/tags" method="get" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
		}
		
		__checkForErrors(local.apiResults, 'Failed to retreive bounce tags');
		
		return deserializeJson(local.apiResults.filecontent);
	}
	
	public struct function getDeliveryStats() {
		// Send the request
		http url="#variables.baseUrl#/deliverystats" method="get" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
		}
		
		__checkForErrors(local.apiResults, 'Failed to retrieve delivery statistics');
		
		return deserializeJson(local.apiResults.filecontent);
	}
	
	public array function send() {
		__sendMessages();
		
		local.currentResults = variables.results;
		
		// Reset the results
		variables.results = [];
		
		return local.currentResults;
	}
	
	/**
	 * Sends any batched messages
	 **/
	private void function __sendMessages() {
		if( !arrayLen(variables.messages) ) {
			return;
		}
		
		while( arrayLen(variables.messages) ) {
			local.batch = [];
			
			// Create a batch from any that are waiting
			for( local.i = min(arrayLen(variables.messages), variables.threshold); local.i > 0; local.i-- ) {
				arrayAppend(local.batch, variables.messages[local.i]);
				
				// Remove from queue
				arrayDeleteAt(variables.messages, local.i);
			}
			
			// Send the batch
			http url="#variables.baseUrl#/email/batch" method="post" result="local.apiResults" {
				httpparam type="header" name="Accept" value="application/json";
				httpparam type="header" name="Content-type" value="application/json";
				httpparam type="header" name="X-Postmark-Server-Token" value="#variables.apiKey#";
				httpparam type="body" encoded="no" value="#serializeJson(local.batch)#";
			}
			
			__checkForErrors(local.apiResults, 'Failed to send emails');
			
			local.apiResultMessages = deserializeJson(local.apiResults.filecontent);
			
			for( local.i = 1; local.i <= arrayLen(local.apiResultMessages); local.i++ ) {
				arrayAppend(variables.results, local.apiResultMessages[local.i]);
			}
		}
	}
}
