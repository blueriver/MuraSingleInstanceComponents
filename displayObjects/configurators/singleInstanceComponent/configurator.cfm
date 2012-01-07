<cfscript>
	$=application.serviceFactory.getBean("MuraScope").init(session.siteID);
		
	params=$.event("params");
		
	if(isJSON(params)){
		params=deserializeJSON(params);
	} else {
		params=structNew();
	}
		
	if(not structKeyExists(params,"body")){
		params.body="";
	}
		
	if(not structKeyExists(params,"template")){
		params.template="";
	}
	
	rsTemplates=$.getBean("contentUtility").getTemplates(session.siteID,"component");
</cfscript>
<cfoutput>
	<div id="availableObjectParams"	
		data-object="plugin" 
		data-name="Single Instance Component" 
		data-objectid="#$.event('objectID')#">
		<dl class="singleColumn">
			<dt>Body</dt>
			<dd><textarea id="instanceBody" name="body" class="objectParam htmlEditor">#HTMLEditFormat(params.body)#</textarea></dd>
			<dt>Template</dt>
			<dd><select name="template" class="dropdown objectParam">
				<option value="">none</option>
				<cfloop query="rsTemplates">
				<cfif right(rsTemplates.name,4) eq ".cfm">
				<cfoutput>
				<option value="#rsTemplates.name#" <cfif params.template eq rsTemplates.name>selected</cfif>>#rsTemplates.name#</option>
				</cfoutput>
				</cfif></cfloop>
				</select>
			</dd>
		</dl>			
	</div>			
</cfoutput>