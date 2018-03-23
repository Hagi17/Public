///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// Additional string-functions (trim, replace, explode)
/// and ErrorInfo struct
///

#include <algorithm>
#include <string>
#include <vector>
#include <fstream>

#include "support.h"

using std::string;
using std::isspace;
using std::find_if;
using std::vector;

namespace TM
{
  namespace StringSupport
  {
    //--------------------------------------------------------------------------
    void ltrim(string& s) {
      s.erase(s.begin(), find_if(s.begin(), s.end(), [](int ch) {
          return !isspace(ch);
      }));
    }
    //--------------------------------------------------------------------------
    void rtrim(string& s) {
        s.erase(find_if(s.rbegin(), s.rend(), [](int ch) {
            return !isspace(ch);
        }).base(), s.end());
    }
    //--------------------------------------------------------------------------
    void trim(string& s) {
        ltrim(s);
        rtrim(s);
    }
    //--------------------------------------------------------------------------
    vector<string> explode(string& s, const char& delim)
    {
      string buff;
      vector<string> v;
      
      for(auto n:s)
      {
        if(n != delim) buff+=n; else
        if(n == delim && !buff.empty()) { v.push_back(buff); buff = ""; }
      }
      if(!buff.empty()) v.push_back(buff);
      
      return v;
    }
    //--------------------------------------------------------------------------
    string getFolderPath(const string& filePath)
    {
      size_t found = filePath.find_last_of("/\\");
      return filePath.substr(0,found);
    }
    //--------------------------------------------------------------------------
    void testFilePaths(string& path, vector<string> incDir)
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
    //--------------------------------------------------------------------------
    bool exists(const string& filepath)
    {
      std::ifstream file(filepath);
      return file.good();
    }
    //--------------------------------------------------------------------------
    void replace(string& str, const string& from, const string& to) 
    {
      if(from.empty())
          return;
      size_t start_pos = 0;
      while((start_pos = str.find(from, start_pos)) != string::npos) {
          str.replace(start_pos, from.length(), to);
          start_pos += to.length(); 
          // In case 'to' contains 'from', like replacing 'x' with 'yx'
      }
    }
  }
}