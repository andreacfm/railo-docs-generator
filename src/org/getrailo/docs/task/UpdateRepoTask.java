package org.getrailo.docs.task;

import org.getrailo.docs.DocsEngine;

import java.io.IOException;
import java.util.TimerTask;

public class UpdateRepoTask extends TimerTask {

    DocsEngine engine;

    public UpdateRepoTask(DocsEngine engine) {
        this.engine = engine;
    }

    @Override
    public void run() {
        try {
            engine.update();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
