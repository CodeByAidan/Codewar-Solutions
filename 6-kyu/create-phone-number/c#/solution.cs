using System;

public class Kata
{
  public static string CreatePhoneNumber(int[] numbers)
  {
    string arrays = (numbers[0]+""+numbers[1]+""+numbers[2]+""+numbers[3]+""+numbers[4]+""+numbers[5]+""+numbers[6]+""+numbers[7]+""+numbers[8]+""+numbers[9]);

    return "("+arrays.Substring(0,3)+")"+" "+arrays.Substring(3,3)+"-"+arrays.Substring(6,4);
  }
}
