package org.getrailo.docs;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.storage.file.FileRepository;

import java.io.File;
import java.io.IOException;

public class DocsRepo {

    private String remotePath;
    private String localPath;
    private FileRepository repo;

    public DocsRepo(String localPath, String remotePath) throws IOException{
        this.remotePath = remotePath;
        this.localPath = localPath;
        this.repo = new FileRepository(localPath + "/.git");
        setUp();
    }

    public void setUp(){
        if(!this.getRepo().getObjectsDirectory().exists()){
            Git.cloneRepository().setURI(remotePath).setDirectory(new File(localPath)).call();
        }

    }

    public FileRepository getRepo() {
        return repo;
    }


}
