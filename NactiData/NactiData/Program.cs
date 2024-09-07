using System;

namespace NactiData
{
    public class Program
    {
        public static void Main(string[] args)
        {
            try
            {
                // Verify that exactly 3 command-line arguments are provided
                if (args.Length != 3)
                {
                    throw new ArgumentException("The number of input parameters must be 3.");
                }

                // Attempt to parse the command-line arguments as double values
                if (!double.TryParse(args[0], out double num1) ||
                    !double.TryParse(args[1], out double num2) ||
                    !double.TryParse(args[2], out double num3))
                {
                    throw new ArgumentException("All parameters must be valid numbers.");
                }

                // Perform calculations
                double sum = num1 + num2 + num3;
                double product = num1 * num2 * num3;
                double division;

                // Handle division by zero scenario
                if (num3 == 0)
                {
                    throw new DivideByZeroException("The third number must not be zero (division by zero).");
                }
                else
                {
                    division = (num1 + num2) / num3;
                }

                // Output the results to the console
                Console.WriteLine($"Sum of all 3 numbers: {sum}");
                Console.WriteLine($"Product of all 3 numbers: {product}");
                Console.WriteLine($"Sum of the first two numbers divided by the third: {division}");
            }
            catch (Exception ex)
            {
                // Output any error messages that occur during execution
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}
