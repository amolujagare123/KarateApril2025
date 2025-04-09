package DemoScenarios;

import com.intuit.karate.junit5.Karate;

public class DemoRunner {

    @Karate.Test
    public Karate testRunner()
    {
        return Karate.run("DemoScenario")
                .relativeTo(getClass())
                .tags("@valueTravel")
                ;
    }
}
