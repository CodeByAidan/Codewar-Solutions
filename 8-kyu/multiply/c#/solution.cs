using System.Collections.Generic;
using System.Linq;
using System;
public class CustomMath {
    public static int multiply(int a, int b)
    {
      string numbera = string.Empty;
      string numberb = string.Empty;
      List<List<char>> list = new List<List<char>>();
      List<char> result = new List<char>();

      while (a > 0)
      {
        numbera = a % 2 + numbera;
        a /= 2;
      }

      while (b > 0)
      {
        numberb = b % 2 + numberb;
        b /= 2;
      }
      
      for (int i = numbera.Length - 1; i >= 0; i--)
      {
        if (numbera[i] == '1')
        {
          List<char> chars = new List<char>(numberb);
          for (int y = 1; y < numbera.Length - i; y++)
          {
            chars.Add('0');
          }
          list.Add(chars);
        }
      }

      if (list.LastOrDefault() != null)
      {
        for (int i = 0; i < list.Count - 1; i++)
        {
          int listiCount = list[i].Count;
          for (int y = 0; y < list.Last().Count - listiCount; y++)
          {
            list[i].Insert(0, '0');
          }
        }
        for (int i = 0; i < list.Last().Count; i++)
        {
          result.Add((char)(list.Sum(x => x.ElementAt(i) - '0') + '0'));
        }
      }

      int c = result.Count - 1;
      while (c >= 0)
      {
        if (result[c] == '0' || result[c] == '1')
          c--;
        else
        {
          char temp = (char)((result[c] - '0') / 2);
          result[c] = (char)((result[c] - '0') % 2 + '0');
          if (c == 0)
          {
            result.Insert(0, temp);
          }
          else
          {
            result[c - 1] += temp;
            c--;
          }

        }
      }

      return (int)result.Reverse<char>().Select((x, i) => new { x, i }).Sum(x => x.x == '1' ? Math.Pow(2, (double)x.i) : 0);
    }
}




// I forgot :(

// how do you add 2 numbers?