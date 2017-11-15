package com.paul.energyarima;

import com.workday.insights.timeseries.arima.Arima;
import com.workday.insights.timeseries.arima.struct.ForecastResult;
import com.workday.insights.timeseries.arima.struct.ArimaParams;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Hello world!
 *
 */
public class App
{    
    private static final int PREDICTION_DAYS = 3;
    private static final int OBSERVED_DAYS = 50;
    private static final String FILE_NAME = "benchmarks/ph3.txt";    
    
    private static final int TIME_SPAN = 5; //minutes        
    private static final int NUM_PREDICTIONS = (PREDICTION_DAYS*24*60)/TIME_SPAN;
    private static final int NUM_OBSERVATIONS = (OBSERVED_DAYS*24*60)/TIME_SPAN;
        
    static double[] readBenchmarks(int n, BufferedReader reader) throws FileNotFoundException, IOException
    {
        double[] benchmarks = new double[n];
        
        int i=0;
        String line = null;
        while((line = reader.readLine()) != null)
        {
            benchmarks[i] = Double.parseDouble(line);
            
            if(i == n-1)
            {
                break;
            }
            
            i++;
        }
        
        return benchmarks;
    }
    
    /**
     * Compute the Mean Absolute Error
     *
     * @param observed The data that we observed, but didn't use in training
     * the model, aka. the test data
     * @param predicted The data predicted by the model,
     * preferably these two arrays have the same length
     * 
     * @return the mean absolute error
     */
    static double computeMAE(double[] observed, double[] predicted)
    {
        assert predicted.length == observed.length;
        
        double mae = 0;
        for(int i=0; i<observed.length; i++)
        {
            mae += Math.abs(observed[i] - predicted[i]);
        }
        
        return mae/observed.length;
    }
    
    public static void main( String[] args ) throws IOException
    {
        assert PREDICTION_DAYS > 0;
        assert OBSERVED_DAYS > 0;
        assert PREDICTION_DAYS + OBSERVED_DAYS <= 150;
        
        // Prepare input timeseries data.        
        FileReader fr = new FileReader(FILE_NAME);
        BufferedReader bfr = new BufferedReader(fr);
        
        double[] trainData = readBenchmarks(NUM_OBSERVATIONS, bfr);
        double[] testData = readBenchmarks(NUM_PREDICTIONS, bfr);
        
        // Set ARIMA model parameters.
        int p = 3;
        int d = 0;
        int q = 3;
        int P = 1;
        int D = 1;
        int Q = 0;
        int m = 0;

        ArimaParams params = new ArimaParams(p, d, q, P, D, Q, m);

        // Obtain forecast result. The structure contains forecasted values and performance metric etc.
        ForecastResult forecastResult = Arima.forecast_arima(trainData, NUM_PREDICTIONS, params);

        // Read forecast values
        double[] forecastData = forecastResult.getForecast(); // in this example, it will return { 2 }
        
        // You can obtain upper- and lower-bounds of confidence intervals on forecast values.
        // By default, it computes at 95%-confidence level. This value can be adjusted in ForecastUtil.java
        double[] uppers = forecastResult.getForecastUpperConf();        
        double[] lowers = forecastResult.getForecastLowerConf();

        // You can also obtain the root mean-square error as validation metric.
        double rmse = forecastResult.getRMSE();

        // It also provides the maximum normalized variance of the forecast values and their confidence interval.
        double maxNormalizedVariance = forecastResult.getMaxNormalizedVariance();

        // Finally you can read log messages.
        String log = forecastResult.getLog();

        System.out.println(log);
        
//        System.out.println("Forecast data:");        
//        for(double forecastPoint : forecastData)
//        {
//            System.out.print(forecastPoint + " ");
//        }
        
//        System.out.println();
//        System.out.println("Lower confidence:");        
//        for(double lowerConf : lowers)
//        {
//            System.out.print(lowerConf + " ");
//        }
//        
//        System.out.println();
//        System.out.println("Upper confidence:");        
//        for(double upperConf : uppers)
//        {
//            System.out.print(upperConf + " ");
//        }
        
        System.out.println();
        System.out.println("Root Mean Square Error: " + rmse);                
        System.out.println("Max Normalized Variance: " + maxNormalizedVariance);     
                
        System.out.println("Mean Absolute Error: " + computeMAE(testData, forecastData));
    }
}
