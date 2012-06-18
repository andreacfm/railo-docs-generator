package org.getrailo.docs;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.storage.file.FileRepository;
import org.gitective.core.CommitUtils;

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


    public void pull(){
        new Git(this.repo).pull();
    }

    /**
     *
     * @return false if there new remote commit to be pulled
     */
    public Boolean isUpToDate() throws IOException{
        RevCommit latestLocalCommit = CommitUtils.getHead(this.repo);
        RevCommit latestRemoteCommit = CommitUtils.getRef(this.repo, "refs/remotes/origin/master");
        return latestLocalCommit == latestRemoteCommit;
    }

}
