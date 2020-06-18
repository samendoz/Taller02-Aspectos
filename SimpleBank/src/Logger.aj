import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Calendar;

public aspect Logger {
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success() : call(void moneyMakeTransaction());
    after() : success() {
    	writeLog("Deposito");
    }
    pointcut successRet() : call(void moneyWithdrawal());
    after() : successRet() {
    	writeLog("Withdrawal  ");
    }
    void writeLog(String transactionType){
    	String line = "Transaccion: " + transactionType + "; Hora de la transaccion: " + cal.get(Calendar.HOUR_OF_DAY)+":"+ cal.get(Calendar.MINUTE) + "\n";
    	try {
    		Files.write(file.toPath(), line.getBytes(),  StandardOpenOption.CREATE, StandardOpenOption.WRITE, StandardOpenOption.APPEND);
    	}catch (IOException ex) {
            System.out.println("no hay linea");
        }finally{
    	System.out.print(line);
        }
    }
}
