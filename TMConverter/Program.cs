using System;
using System.Collections.Generic;
using System.IO;

namespace TMConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length < 2)
            {
                Console.WriteLine("Usage: <inputfile> <outputfile>");
                return;
            }

            var fi = new FileInfo(args[0]);

            var lines = File.ReadAllLines(args[0]);
            var newContent = new List<string>();

            var newline = "";

            if (fi.Extension == ".tm")
            {
                var acceptstate = new List<string>();
                foreach (var line in lines)
                {
                    Console.Write(line);
                    if (string.IsNullOrWhiteSpace(line))
                    {

                        newContent.Add(line);
                        continue;
                    }
                    if (line.StartsWith("//") || line.StartsWith("init:"))
                    {
                        newContent.Add(";" + line);
                        continue;
                    }
                    if (line.StartsWith("accept:"))
                    {
                        acceptstate.Add(line.Substring(7).Trim());
                        continue;
                    }
                    var parts = line.Split(',');
                    if (parts.Length != 5) continue;
                    if (acceptstate.Contains(parts[0]))
                    {
                        parts[0] = "halt-" + parts[0];
                        parts[3] = "*";
                    }
                    if (acceptstate.Contains(parts[4])) parts[4] = "halt-" + parts[4];
                    parts[3] = parts[3].Replace('<', 'l').Replace('>', 'r').Replace('-', '*');
                    newContent.Add(string.Join(" ", parts));
                    Console.WriteLine("new: " + newline);
                    newline = "";
                }
            }
            else
            {
                foreach (var line in lines)
                {
                    Console.Write(line);
                    if (line.StartsWith("//") || line.StartsWith("name:") || line.StartsWith("init:") ||
                        line.StartsWith("accept:")
                        || string.IsNullOrWhiteSpace(line))
                    {
                        newContent.Add(line);
                        Console.WriteLine(" - added");
                        continue;
                    }
                    var parts = line.Split(',');
                    if (string.IsNullOrWhiteSpace(newline) && parts.Length == 2)
                    {
                        newline = line + ",";

                        Console.WriteLine(" - 1. part");
                    }
                    else if (parts.Length == 3)
                    {
                        newline += parts[1] + "," + parts[2] + "," + parts[0];
                        newContent.Add(newline);
                        Console.WriteLine(" - 2. part");
                        Console.WriteLine("new: " + newline);
                        newline = "";

                    }
                }
            }
            File.WriteAllLines(args[1], newContent);
        }
    }
}
