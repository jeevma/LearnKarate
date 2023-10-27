package examples.airline;

import com.intuit.karate.junit5.Karate;

class AirlineRunner {
    
    @Karate.Test
    Karate testAirline() {
        return Karate.run("airline").relativeTo(getClass());
    }    

}
