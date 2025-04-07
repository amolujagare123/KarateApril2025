package SampleAPI;

import com.intuit.karate.junit5.Karate;

public class SampleRunner {

    @Karate.Test
    public Karate sampleRun()
    {
        return Karate.run("sample")
                .relativeTo(getClass())
                .tags("@createDP")
                ;
    }
}
