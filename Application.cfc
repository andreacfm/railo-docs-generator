component extends="org.corfield.framework" output="false"{
	
    import "org.getrailo.*";

    variables.framework = {
        generateSES = true,
        routes = [
            { "/tags/view/:tag" = "/tags/view/tag/:tag" },
        ]
    };


    function setupApplication(){
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