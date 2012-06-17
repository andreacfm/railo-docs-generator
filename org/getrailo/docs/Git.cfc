component accessors="true"{

    property repo;

    variables.LOCAL_PATH = "/Users/andrea/dev/code/railo/docs/repo";
    variables.REMOTE_PATH = "git://github.com/andreacfm/railo_docs_test.git";

    public void function init(){
        //var jars = "/lib/jgit.jar, /lib/railo-docs-repo.jar, /lib/jgit.ant.jar";
        variables.repo = createObject("java", "org.getrailo.docs.DocsRepo");
        variables.repo.init(variables.LOCAL_PATH, variables.REMOTE_PATH);
    }

}