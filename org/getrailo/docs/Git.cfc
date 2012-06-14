component accessors="true"{

    property repo;

    variables.LOCAL_PATH = "/Users/andrea/dev/code/railo/docs/repo";
    variables.REMOTE_PATH = "git://github.com/andreacfm/railo_docs_test.git";

    function init(){
        variables.repo = createObject("java", "org.eclipse.jgit.storage.file.FileRepository","/lib/org.eclipse.jgit-1.3.0.jar,/lib/org.eclipse.jgit.ant-1.3.0.jar");
        variables.repo.init("#variables.LOCAL_PATH#/.git");
    }

}