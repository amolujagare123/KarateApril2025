package examples.users;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

class UsersRunner {
    
    @Test
    Karate testUsers() {
        return Karate.run("users")
                .relativeTo(getClass())
                .tags("@getUsers");
    }    

}
