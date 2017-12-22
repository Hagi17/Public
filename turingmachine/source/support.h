///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 21.12.17
/// 
/// Additional string-functions (trim, replace, explode)
/// and ErrorInfo struct
///

#ifndef _SUPPORT_H_
#define _SUPPORT_H_

#include <algorithm> 
#include <cctype>
#include <locale>
#include <vector>

class stringsup
{
  public: 
  static void ltrim(std::string &s) {
    s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](int ch) {
        return !std::isspace(ch);
    }));
}
  
  // trim from end (in place)
  static void rtrim(std::string &s) {
      s.erase(std::find_if(s.rbegin(), s.rend(), [](int ch) {
          return !std::isspace(ch);
      }).base(), s.end());
  }
  
  // trim from both ends (in place)
  static void trim(std::string &s) {
      ltrim(s);
      rtrim(s);
  }
  
  static vector<string> explode(string& s, const char& c)
  {
    string buff;
    vector<string> v;
    
    for(auto n:s)
    {
      if(n != c) buff+=n; else
      if(n == c && !buff.empty()) { v.push_back(buff); buff = ""; }
    }
    if(!buff.empty()) v.push_back(buff);
    
    return v;
  }
  
  static string getFolderPath(const string &filePath)
  {
    size_t found = filePath.find_last_of("/\\");
    return filePath.substr(0,found);
  }
  
  static void testFilePaths(string& path, vector<string> incDir)
  {
    string plainPath = path;
    if(exists(path)) return;
    for(auto dir : incDir)
    {
      path = dir + "/"+ plainPath;
      if(exists(path)) return;
    }
    path = plainPath;
  }
  
  static bool exists(const string &filepath)
  {
    ifstream file(filepath);
    return file.good();
  }
  
  static void replace(std::string& str, const std::string& from, const std::string& to) {
    if(from.empty())
        return;
    size_t start_pos = 0;
    while((start_pos = str.find(from, start_pos)) != std::string::npos) {
        str.replace(start_pos, from.length(), to);
        start_pos += to.length(); // In case 'to' contains 'from', like replacing 'x' with 'yx'
    }
}
};

class ErrorInfo
{
  public: 
    ErrorInfo()
    {
      error = 0;
      lineno = -1;
      file = "";
    }
    int error;
    int lineno;
    string file;
};

#endif