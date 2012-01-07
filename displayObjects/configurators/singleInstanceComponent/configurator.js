function initSECConfigurator(data){
		
	initConfigurator(
		data,
		{
			url:'../plugins/SingleInstanceComponents/displayObjects/configurators/singleInstanceComponent/configurator.cfm',
			pars:'',
			title: 'Single Instance Component',
			init: function(){
				jQuery("#instanceBody").ckeditor( { toolbar: 'Default',customConfig : 'config.js.cfm' },htmlEditorOnComplete);
			},
			destroy: function(){
				
				if (typeof(CKEDITOR.instances.instanceBody) == 'object') {
					CKEDITOR.instances.instanceBody.destroy();
				}
			},
			validate: function(){
				return true;	
				}
		}
	);
			
	return true;
}