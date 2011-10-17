<cfcomponent output="false">
	<cfset this.name = 'restricted' />
	<cfset this.applicationTimeout = createTimeSpan(2, 0, 0, 0) />
	<cfset this.clientManagement = false />
	<cfset this.sessionManagement = false />
	
	<cffunction name="onRequest" returnType="void">
		<cfargument name="targetPage" type="String" required=true/>
		
		<!--- Add the forbidden header --->
		<cfheader statuscode="403" statustext="Forbidden" />
	</cffunction>
</cfcomponent>
