component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.postmark = createObject('component', 'postmark4cf.postmark').init('POSTMARK_API_TEST');
	}
	
	/*
	public void function activateBounceSuccess() {
		variables.postmark.activateBounce(1000);
	}
	
	public void function getBounceSuccess() {
		variables.postmark.getBounce(1000);
	}
	
	public void function getBounceDumpSuccess() {
		variables.postmark.getBounceDump(1000);
	}
	
	public void function getBouncesSuccess() {
		variables.postmark.getBounces();
	}
	
	public void function getBounceTagsSuccess() {
		variables.postmark.getBounceTags();
	}
	
	public void function getDeliveryStatsSuccess() {
		variables.postmark.getDeliveryStats();
	}
	*/
	
	public void function sendSuccess() {
		variables.postmark.addMessage({
			"From" : "sender@example.com",
			"To" : "receiver@example.com",
			"Cc" : "copied@example.com",
			"Bcc": "blank-copied@example.com",
			"Subject" : "Test",
			"Tag" : "Invitation",
			"HtmlBody" : "<b>Hello</b>",
			"TextBody" : "Hello",
			"ReplyTo" : "reply@example.com",
			"Headers" : [{ "Name" : "CUSTOM-HEADER", "Value" : "value" }]
		});
		
		variables.postmark.send();
	}
}
