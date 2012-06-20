import org.apache.commons.io.FileUtils;
import org.getrailo.docs.Markdown;
import org.junit.*;
import junit.framework.JUnit4TestAdapter;

import java.io.File;
import java.io.IOException;
import static org.junit.Assert.*;


public class MarkdownTest {
    public static junit.framework.Test suite() {
        return new JUnit4TestAdapter(MarkdownTest.class);
    }

    Markdown converter;

    @Before
    public void setUp() throws IOException{
        String path = new File(".").getCanonicalPath() + "/javascripts/showdown.js";
        converter = new Markdown(path);
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testSimpleConversion() throws  IOException{
        String md = FileUtils.readFileToString(new File(new File(".").getCanonicalPath() + "/test/resources/test.md"));
        String html = converter.toHtml(md);
        assertTrue(html.matches("<h3.*>title<\\/h3>"));
    }
}
