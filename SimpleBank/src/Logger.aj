import java.io.File;
import java.util.Calendar;

public aspect Logger {
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success() : call(moneyMakeTransaction());
    after() : success() {

    }
    pointcut successRet() : call(moneyWithdrawal());
    after() : success() {

    }

}