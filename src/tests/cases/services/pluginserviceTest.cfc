<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	    :	Luis Majano
Date        :	September 3, 2007
Description :
	plugin service test cases.

Modification History:
01/18/2007 - Created
----------------------------------------------------------------------->
<cfcomponent name="pluginserviceTest" extends="coldbox.system.extras.baseTest" output="false">

	<cffunction name="setUp" returntype="void" access="private" output="false">
		<cfscript>
		//Setup ColdBox Mappings For this Test
		setAppMapping("/coldbox");
		setConfigMapping(ExpandPath(instance.AppMapping & "/config/coldbox.xml.cfm"));
		//Call the super setup method to setup the app.
		super.setup();
		</cfscript>
	</cffunction>
	
	<cffunction name="testNewInstanceViaController" access="public" returntype="void" output="false">
		<cfscript>
		var plugin = getController().getPlugin("logger",false,true);
		assertComponent(plugin);
		</cfscript>
	</cffunction>
	
	<cffunction name="testNormalPluginViaController" access="public" returntype="void" output="false">
		<cfscript>
		var plugin = getController().getPlugin("logger",false);
		assertComponent(plugin);
		</cfscript>
	</cffunction>
	
	<cffunction name="testPluginByConvention" access="public" returntype="void" output="false">
		<cfscript>
		var plugin = getController().getPluginService().get("dateNoAutowire",true);
		assertComponent(plugin);
		</cfscript>
	</cffunction>
	
	<cffunction name="testPluginByConfiguration" access="public" returntype="void" output="false">
		<cfscript>
		var plugin = getController().getPluginService().get("myclientstorage",true);
		assertComponent(plugin);
		</cfscript>
	</cffunction>
	
</cfcomponent>