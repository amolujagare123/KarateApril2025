package JobPortal;

import com.intuit.karate.junit5.Karate;

public class JobPortalRunner {

    @Karate.Test
    public Karate testRunner()
    {
        return Karate.run("jobPortal")
                .relativeTo(getClass())
                .tags("@DemoDataProvider")
                ;
    }
}
