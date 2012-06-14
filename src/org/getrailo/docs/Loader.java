/*

DUMMY TEST !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

*/

package org.getrailo.docs;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.*;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.storage.file.FileRepository;
import org.gitective.core.CommitUtils;

import java.io.File;
import java.io.IOException;

public class Loader {

    private String remotePath, localPath;
    private Repository remoteRepo, localRepo;
    private Git git;

    public void run() throws IOException{
        localPath = "/Users/andrea/dev/code/railo/railo_docs_test";
        remotePath = "git://github.com/andreacfm/railo_docs_test.git";
        remoteRepo = new FileRepository(remotePath);

        //Git git = Git.cloneRepository().setURI(remotePath).setDirectory(new File(localPath)).call();
        Repository repo = new FileRepository(localPath + "/.git");
        Git git = new Git(repo);
        RevCommit latestCommit = CommitUtils.getHead(repo);
        System.out.println("HEAD commit is " + latestCommit.name());

        try {
            System.out.println(git.fetch().setRemote("origin").call());
        } catch (InvalidRemoteException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

/*
        try {
            git.pull().call();
        } catch (InvalidRemoteException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (WrongRepositoryStateException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (NoHeadException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (CanceledException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (RefNotFoundException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (DetachedHeadException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
*/

        RevCommit latestRemoteCommit = CommitUtils.getRef(repo, "refs/remotes/origin/master");

        System.out.println("HEAD commit is " + latestRemoteCommit.name());

    }

}
