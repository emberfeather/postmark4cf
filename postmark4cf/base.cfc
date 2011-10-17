component {
	public component function init( required string baseUrl ) {
		variables.baseUrl = arguments.baseUrl;
		
		return this;
	}
	
	/**
	 * Checks for API errors
	 **/
	private void function __checkForErrors( required struct response, string message = 'Failed to communicate with Postmark' ) {
		if(arguments.response.status_code != 200) {
			local.apiError = deserializeJson(arguments.response.fileContent);
			
			throw(message="#arguments.message#", detail="#local.apiError.message#", errorcode="#local.apiError.errorcode#");
		}
	}
}
