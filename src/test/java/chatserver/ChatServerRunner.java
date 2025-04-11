package chatserver;

import com.intuit.karate.junit5.Karate;

public class ChatServerRunner {

    @Karate.Test
    public Karate sampleRun()
    {
        return Karate.run("chatServer")
                .relativeTo(getClass())
              //  .tags("@drawCard")
                ;
    }
}
