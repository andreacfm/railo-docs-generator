package org.getrailo.docs;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.storage.file.FileRepository;
import org.getrailo.docs.task.UpdateRepoTask;

import java.io.File;
import java.io.IOException;
import java.util.Timer;

public class RepoFactory {

    private static FileRepository instance;

    private RepoFactory() {

    }

    public static FileRepository init(String localPath, String remotePath, DocsEngine engine) throws IOException {

        if(instance != null){
            return instance;
        }

        instance = new FileRepository(localPath + "/.git");

        if(!instance.getObjectsDirectory().exists()){
            Git.cloneRepository().setURI(remotePath).setDirectory(new File(localPath)).call();
        }

        Timer time = new Timer();
        time.schedule(new UpdateRepoTask(engine), 0, 60 * 1000 );

        return instance;
    }

    public static FileRepository getInstance(){
        return instance;
    }
}
