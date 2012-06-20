component extends="org.corfield.framework" output="false"{
	
    import "org.getrailo.*";

    variables.framework = {
        generateSES = true,
        routes = [
            { "/tags/view/:tag" = "/tags/view/tag/:tag" },
        ]
    };


    function setupApplication(){
        createObject("java", "org.eclipse.jgit.api.Git", "lib/jgit.jar");
        createObject("java", "org.getrailo.docs.DocsEngine", "lib/railo-docs.jar");
        createObject("java", "org.gitective.core.CommitUtils", "lib/gitective-core-0.9.9.jar");
        setBeanFactory(new Ioc("/org/getrailo/docs"));
        getBeanFactory().load();
    }

    function onError(exception, event){
        if(structkeyexists(url, "debug") and url.debug){
            throw(exception);
            abort;
        }
        super.onError(exception, event);
    }

}