component accessors="true"{

    property repo;

    variables.LOCAL_PATH = expandPath('/repo');
    variables.REMOTE_PATH = "git://github.com/andreacfm/railo_docs_test.git";

    public void function init(){
        variables.repo = createObject("java", "org.getrailo.docs.DocsEngine");
        variables.repo.init(variables.LOCAL_PATH, variables.REMOTE_PATH);
    }

}