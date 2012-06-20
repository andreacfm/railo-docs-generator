import org.apache.commons.io.FileUtils;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.*;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.storage.file.FileRepositoryBuilder;
import org.getrailo.docs.DocsEngine;
import org.junit.*;
import junit.framework.JUnit4TestAdapter;

import java.io.File;
import java.io.IOException;
import static org.junit.Assert.*;

public class DocsRepoTest {
    public static junit.framework.Test suite() {
        return new JUnit4TestAdapter(DocsRepoTest.class);
    }


    DocsEngine docsRepo;
    String localPath;
    String remotePath;

    @Before
    public void setUp() throws IOException{

        String path = new File(".").getCanonicalPath();
        FileUtils.deleteDirectory(new File(path + "/tmp"));
        localPath = path + "/tmp/local/";
        remotePath = path + "/tmp/remote/";
        FileRepositoryBuilder builder = new FileRepositoryBuilder();
        Repository repository = builder.setGitDir(new File(remotePath))
                .readEnvironment() // scan environment GIT_* variables
                .findGitDir()
                .build();

        docsRepo = new DocsEngine(localPath, remotePath);
    }

    @After
    public void tearDown() throws IOException{
        //FileUtils.deleteDirectory(new File(localPath));
    }

    @Test
    public void testRepositoryExists(){
        assertTrue(this.docsRepo.getRepo().getObjectsDirectory().exists());
    }

    @Test
    public void testRepositoryUpToDate() throws IOException{
        this.commitNewFile("out.txt");
        assertFalse(this.docsRepo.isUpToDate());
    }


    private void commitNewFile(String fileName) throws IOException{
        File newFile = new File(localPath + "/" + fileName);
        newFile.createNewFile();
        Git git = new Git(docsRepo.getRepo());

        try {
            git.add().addFilepattern(".").call();
        } catch (NoFilepatternException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        try {
            git.commit().setMessage("my commit").call();
        } catch (NoHeadException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (NoMessageException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (ConcurrentRefUpdateException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (WrongRepositoryStateException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        try {
            git.push().call();
        } catch (InvalidRemoteException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

}
