package org.getrailo.docs;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.PullResult;
import org.eclipse.jgit.api.errors.*;
import org.eclipse.jgit.storage.file.FileRepository;
import org.gitective.core.CommitUtils;
import java.io.IOException;

public class DocsEngine {

    private String remotePath;
    private String localPath;
    private FileRepository repo;

    public DocsEngine(String localPath, String remotePath) throws IOException{
        this.remotePath = remotePath;
        this.localPath = localPath;
        this.repo = RepoFactory.init(localPath, remotePath, this);
    }

    public void update() throws IOException{
        System.out.println(">>>>> Fetching");
        System.out.println("- Up to date? => " + this.isUpToDate());
        if(!this.isUpToDate()){
            this.pull();
        }
    }


    public void pull(){
        try {
            System.out.println("- Pulling");
            PullResult res = new Git(this.repo).pull().call();
            System.out.println("- Pulled with succes =>" +res.isSuccessful());
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
        String latestLocalCommit = CommitUtils.getHead(this.repo).name();
        String latestRemoteCommit = CommitUtils.getRef(this.repo, "refs/remotes/origin/master").name();
        return latestLocalCommit.equals(latestRemoteCommit);
    }

}
