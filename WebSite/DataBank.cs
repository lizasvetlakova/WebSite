using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSite
{
    public class DataBank
    {
        public static int Counter = 0;
        public static decimal SummaN = 0;
        public static int flagN = 0;

        public static string FormatData(string data)
        {
            string text = data.Substring(0, data.Length - 8);
            return text;
        }
    }
}