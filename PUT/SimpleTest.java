import edu.berkeley.cs.jqf.fuzz.Fuzz;
import edu.berkeley.cs.jqf.fuzz.JQF;
import org.junit.runner.RunWith;

@RunWith(JQF.class)
public class SimpleTest {
    
    private void checkEven(Integer a) {
        if (a % 2 == 0)
            System.out.println("Even");
        else
            System.out.println("Odd");
    }

    private void checkGreaterThanHundred(Integer a) {
        if (a > 100)
            System.out.println("Greater than 100");
        else
            System.out.println("Less than or equal to 100");
    }

    @Fuzz
    public void testSimpleTest(Integer a) {
        int valueOfA = a & 0xFF;
        System.out.println("------ Generated input: " + valueOfA + " ------");

        checkEven(valueOfA);
        checkGreaterThanHundred(valueOfA);
    }
}