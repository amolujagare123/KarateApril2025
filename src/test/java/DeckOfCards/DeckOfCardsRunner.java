package DeckOfCards;

import com.intuit.karate.junit5.Karate;

public class DeckOfCardsRunner {

    @Karate.Test
    public Karate sampleRun()
    {
        return Karate.run("DeckOfCards")
                .relativeTo(getClass())
               // .tags("@update")
                ;
    }
}
