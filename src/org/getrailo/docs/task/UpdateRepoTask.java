package org.getrailo.docs.task;

import org.getrailo.docs.DocsRepo;

import java.io.IOException;
import java.util.TimerTask;

public class UpdateRepoTask extends TimerTask {

    DocsRepo repo;

    public UpdateRepoTask(DocsRepo repo) {
        this.repo = repo;
    }

    @Override
    public void run() {
        try {
            repo.update();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
