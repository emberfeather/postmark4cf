component extends="base" {
	public component function init() {
		super.init('http://spamcheck.postmarkapp.com');
		
		return this;
	}
	
	public struct function filter(required string email, string options = "short") {
		// Send the request
		http url="#variables.baseUrl#/filter" method="post" result="local.apiResults" {
			httpparam type="header" name="Accept" value="application/json";
			httpparam type="header" name="Content-type" value="application/json";
			httpparam type="body" encoded="no" value="#serializeJson({
				'email': arguments.email,
				'options': arguments.options
			})#";
		}
		
		__checkForErrors(local.apiResults, 'Failed to test email filter');
		
		return deserializeJson(local.apiResults.filecontent);
	}
}
