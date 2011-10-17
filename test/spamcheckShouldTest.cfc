component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.spamcheck = createObject('component', 'postmark4cf.spamcheck').init();
	}
	
	public void function filterSuccess_short() {
		variables.spamcheck.filter("Here is the email that you requested.", "short");
	}
	
	public void function filterSuccess_long() {
		variables.spamcheck.filter("Here is the email that you requested.", "long");
	}
}
