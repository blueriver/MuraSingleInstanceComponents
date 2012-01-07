component extends="mura.plugin.pluginGenericEventHandler" {
	
	public any function dspSingleInstanceComponent($){
		
		local.bean=$.getBean("content").set($.event("objectParams")).setType("Component");
		
		$.event("component",local.bean.getAllValues());
		
		if(len($.component("template")) and fileExists("#$.siteConfig('templateIncludeDir')#/components/#$.component('template')#")){
		
			savecontent variable="local.str"{
				include "#$.siteConfig('templateIncludePath')#/components/#$.component('template')#";
			}
			
			return local.str;
			
		} else {
			return $.setDynamicContent($.component('body'));
		}
		
	}
}
