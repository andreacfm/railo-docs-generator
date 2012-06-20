package org.getrailo.docs;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.PullResult;
import org.eclipse.jgit.api.errors.*;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.storage.file.FileRepository;
import org.getrailo.docs.task.UpdateRepoTask;
import org.gitective.core.CommitUtils;

import java.io.File;
import java.io.IOException;
import java.util.Timer;

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

        Timer time = new Timer();
        time.schedule(new UpdateRepoTask(this), 0, 60 * 1000 );

    }

    public FileRepository getRepo() {
        return repo;
    }

    public void update() throws IOException{
        System.out.println("Up to date? => " + this.isUpToDate());
        if(!this.isUpToDate()){
            this.pull();
        }
    }


    public void pull(){
        try {
            System.out.println("-- pulling");
            PullResult res = new Git(this.repo).pull().call();
            System.out.println("Pulled with succes =>" +res.isSuccessful());
        } catch (WrongRepositoryStateException e) {
            e.printStackTrace();
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
        } catch (DetachedHeadException e) {
            e.printStackTrace();
        } catch (InvalidRemoteException e) {
            e.printStackTrace();
        } catch (CanceledException e) {
            e.printStackTrace();
        } catch (RefNotFoundException e) {
            e.printStackTrace();
        } catch (NoHeadException e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @return false if there new remote commit to be pulled
     */
    public Boolean isUpToDate() throws IOException{
        try {
            new Git(this.repo).fetch().call();
        } catch (InvalidRemoteException e) {
            e.printStackTrace();
        }
        System.out.println("***************************************Fetching");
        String latestLocalCommit = CommitUtils.getHead(this.repo).name();
        String latestRemoteCommit = CommitUtils.getRef(this.repo, "refs/remotes/origin/master").name();
        return latestLocalCommit.equals(latestRemoteCommit);
    }

}
