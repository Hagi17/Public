///
/// Turing Machine Simulator
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// error information - header file
///

#ifndef _ERRORINFO_H_
#define _ERRORINFO_H_

namespace TMSim
{
  struct ErrorInfo
  {
    public: 
      ErrorInfo() : error(0), lineno(-1), file("")
      {
      }
      int error;
      int lineno;
      string file;
  };
}

#endif