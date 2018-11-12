component {

    this.name = "quick";
    this.author = "Eric Peterson";
    this.webUrl = "https://github.com/coldbox-modules/quick";
    this.dependencies = [ "qb", "str" ];
    this.cfmapping = "quick";
    this.autoMapModels = false;

    function configure() {
        settings = {
            defaultGrammar = "AutoDiscover",
            automaticValidation = true
        };

        interceptorSettings = {
            customInterceptionPoints = [
                "quickPreLoad",
                "quickPostLoad",
                "quickPreSave",
                "quickPostSave",
                "quickPreInsert",
                "quickPostInsert",
                "quickPreUpdate",
                "quickPostUpdate",
                "quickPreDelete",
                "quickPostDelete"
            ]
        };

		interceptors = [
			{ class="#moduleMapping#.interceptors.QuickVirtualInheritanceInterceptor" }
        ];

        binder.map( "quick.models.BaseEntity" )
            .to( "#moduleMapping#.models.BaseEntity" );
    }

    function onLoad() {
        binder.map( "QuickQB@quick" )
            .to( "qb.models.Query.QueryBuilder" )
            .initArg( name = "grammar", dsl = "#settings.defaultGrammar#@qb" )
            .initArg( name = "utils", dsl = "QueryUtils@qb" )
            .initArg( name = "returnFormat", value = "array" );
    }
}
