using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.IO;

namespace NactiData.Tests
{
    [TestClass]
    public class ProgramTests
    {
        [TestMethod]
        public void Test_InvalidNumberOfArguments()
        {
            var args = new[] { "1", "10" };
            using (var sw = new StringWriter())
            {
                Console.SetOut(sw);
                Program.Main(args);
                var output = sw.ToString().Trim();
                Assert.AreEqual("Error: The number of input parameters must be 3.", output);
            }
        }

        [TestMethod]
        public void Test_InvalidNumberFormat()
        {
            var args = new[] { "1", "ten", "5" };
            using (var sw = new StringWriter())
            {
                Console.SetOut(sw);
                Program.Main(args);
                var output = sw.ToString().Trim();
                Assert.AreEqual("Error: All parameters must be valid numbers.", output);
            }
        }

        [TestMethod]
        public void Test_DivisionByZero()
        {
            var args = new[] { "1", "10", "0" };
            using (var sw = new StringWriter())
            {
                Console.SetOut(sw);
                Program.Main(args);
                var output = sw.ToString().Trim();
                Assert.AreEqual("Error: The third number must not be zero (division by zero).", output);
            }
        }
    }
}
