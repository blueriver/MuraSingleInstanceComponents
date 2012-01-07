<!--
   Copyright 2012 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->
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