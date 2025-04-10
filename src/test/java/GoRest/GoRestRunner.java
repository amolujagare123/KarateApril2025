package GoRest;

import com.intuit.karate.junit5.Karate;

public class GoRestRunner {

    @Karate.Test
    public Karate testRunner()
    {
        return Karate.run("Gorest")
                .relativeTo(getClass())
          //      .tags("@createSV")
                ;
    }
}
