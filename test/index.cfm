<cfsilent>
	<cfset title = 'Unit Test Results' />
	<cfset pathRoot = '../' />
	
	<cfset directoryRunner = createObject('component', 'mxunit.runner.DirectoryTestSuite') />

	<cfset results = directoryRunner.run(
		directory = expandPath('.'),
		recurse = true,
		componentPath = 'test'
	) />
	
	<cfset content = results.getResultsOutput('rawhtml') />
	
	<cfset scripts = '<script src="#pathRoot#theme/script/jquery.test.js"></script>' />
</cfsilent>

<cfinclude template="../theme/index.cfm" />
