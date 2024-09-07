Project: NactiData
Author: Dávid Husár
Date: 7.9.2024

Description:
------------
This is a command-line application written in C# that takes 3 numerical input arguments and outputs:
1. The sum of the three numbers.
2. The product of the three numbers.
3. The sum of the first two numbers divided by the third number.

The application also includes error handling for:
- Ensuring all three input parameters are valid numbers.
- Preventing division by zero when calculating the result.

Requirements:
-------------
- .NET Framework 4.7.2 or newer (should be included with Visual Studio).
- Visual Studio Community Edition or newer for building and running the project.

How to Run:
-----------
1. Open Visual Studio and build the solution by clicking **Build > Build Solution**.
2. After building, navigate to the directory where `NactiData.exe` is located (`bin/Debug` or `bin/Release` folder).
3. Open Command Prompt and run the application with three numbers as arguments:

   Example:

   NactiData.exe 1 10 5

   Output:

   Sum of all 3 numbers: 16
   Product of all 3 numbers: 50
   Sum of the first two numbers divided by the third: 2.2

4. If incorrect input arguments are provided, an error message will appear such as:
- "Error: The number of input parameters must be 3."
- "Error: All parameters must be valid numbers."
- "Error: The third number must not be zero (division by zero)."

How to Test:
-----------------------
You can run them using Visual Studio:
1. Open **Test Explorer** by clicking **Test > Test Explorer**.
2. Run all tests to verify the correctness of the application.
