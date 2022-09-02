//did you know raccoons carry rabies?


//i didn't lol
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ExecutionException;

public class Multiply {
  public static double multiply(double a, double b) throws InterruptedException, ExecutionException {
    Callable<Double> callable = () -> doMultiply(a, b);
    
    FutureTask<Double> futureTask = new FutureTask<>(callable);
    
    Thread thread = new Thread(futureTask);
    thread.start();
    
    return futureTask.get();
  }
  
  private static double doMultiply(double a, double b) {
    return a * b;
  }
}