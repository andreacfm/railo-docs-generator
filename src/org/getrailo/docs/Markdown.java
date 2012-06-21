package org.getrailo.docs;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import java.io.*;

public class Markdown {


    private ScriptEngine jsEngine;

    public Markdown(String showDownPath) {
        ScriptEngineManager manager = new ScriptEngineManager();
        jsEngine = manager.getEngineByName("js");
        try {
            jsEngine.eval(new InputStreamReader(new FileInputStream(showDownPath)));
        } catch (ScriptException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String toHtml(String markdownString) {
        String result = "";
        try {
            Object showdownConverter = jsEngine.eval("new Showdown.converter()");
            result = ((Invocable) jsEngine).invokeMethod(
                    showdownConverter,
                    "makeHtml",
                    markdownString
            ) + "";
        } catch (ScriptException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

        return result;
    }
}
