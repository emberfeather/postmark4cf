<cfsilent>
	<cfset title = 'Home' />
	<cfset pathRoot = '' />
	<cfset scripts = '' />
	
	<cfsavecontent variable="content">
		<cfoutput>
			<div class="grid_12">
				<p>
					Welcome to the postmark4cf project!
				</p>
			</div>
			
			<!--- 
			<div class="grid_6">
				<dl>
					<dt>
						<a href="<cfoutput>#pathRoot#</cfoutput>example/index.cfm">
							Examples
						</a>
					</dt>
					
					<dd>
						See examples of the postmark4cf in action!
					</dd>
				</dl>
			</div>
			 --->
			
			<div class="grid_6">
				<dl>
					<!--- 
					<dt>
						<a href="<cfoutput>#pathRoot#</cfoutput>profile/index.cfm">
							Profiling
						</a>
					</dt>
					
					<dd>
						Test out just how fast postmark4cf runs on your engine.
					</dd>
					 --->
					
					<dt>
						<a href="<cfoutput>#pathRoot#</cfoutput>test/index.cfm">
							Unit Tests
						</a>
					</dt>
					
					<dd>
						Run the MXUnit Tests in your browser.
					</dd>
				</dl>
			</div>
		</cfoutput>
	</cfsavecontent>
</cfsilent>

<cfinclude template="theme/index.cfm" />
