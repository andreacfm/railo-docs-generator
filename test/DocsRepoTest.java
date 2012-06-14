import org.apache.commons.io.FileUtils;
import org.getrailo.docs.DocsRepo;
import org.junit.*;
import junit.framework.JUnit4TestAdapter;

import java.io.File;
import java.io.IOException;
import static org.junit.Assert.*;

public class DocsRepoTest {
    public static junit.framework.Test suite() {
        return new JUnit4TestAdapter(DocsRepoTest.class);
    }


    DocsRepo docsRepo;
    String localPath;
    String remotePath;

    @Before
    public void setUp() throws IOException{
        localPath = new File(".").getCanonicalPath() + "/tmp/railo-docs-repo";
        FileUtils.deleteDirectory(new File(localPath));
        remotePath = "git://github.com/andreacfm/railo_docs_test.git";
        docsRepo = new DocsRepo(localPath, remotePath);
    }

    @After
    public void tearDown() throws IOException{
        FileUtils.deleteDirectory(new File(localPath));
    }

    @Test
    public void testRepositoryExists(){
        assertTrue(this.docsRepo.getRepo().getObjectsDirectory().exists());
    }
}
