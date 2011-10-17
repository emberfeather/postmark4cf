<cfsilent>
	<cfparam name="title" default="Home" />
	<cfparam name="pathRoot" default="" />
	<cfparam name="content" default="" />
	<cfparam name="scripts" default="" />
</cfsilent>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		
		<title><cfoutput>#title# : postmark4cf</cfoutput></title>
		
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Josefin+Sans+Std+Light&subset=latin" media="all" /> 
		<link rel="stylesheet" type="text/css" href="<cfoutput>#pathRoot#</cfoutput>theme/styles/reset.css" media="all" /> 
		<link rel="stylesheet" type="text/css" href="<cfoutput>#pathRoot#</cfoutput>theme/styles/960.css" media="all" /> 
		<link rel="stylesheet" type="text/css" href="<cfoutput>#pathRoot#</cfoutput>theme/styles/styles.css" media="all" /> 
	</head>
	
	<body>
		<div class="container_12">
			<header>
				<div class="grid_12">
					<h1><cfoutput>postmark4cf : #title#</cfoutput></h1>
				</div>
				
				<div class="clear"><!-- clear --></div>
			</header>
			
			<div class="content">
				<div class="grid_12">
					<cfoutput>#content#</cfoutput>
				</div>
				
				<div class="clear"><!-- clear --></div>
			</div>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<cfoutput>#scripts#</cfoutput>
	</body>
</html>
