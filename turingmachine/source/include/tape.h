///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// Input/Output Tape - Header file
///

#ifndef _TAPE_H_
#define _TAPE_H_

#include <deque>
#include <string>

#ifndef DISABLE_WILDCARD
  #ifndef WILDCARD
    #define WILDCARD '*'
  #endif
#endif
#ifndef EMPTY
#define EMPTY '_'
#endif

using std::string;
using std::deque;

namespace TM
{
  //----------------------------------------------------------------------------
  // class representing the tape of the turing machine
  //
  class Tape
  {
    public:
      //------------------------------------------------------------------------
      // Standard Constructor
      //
      Tape();
      //------------------------------------------------------------------------
      // Standard Destructor
      //
      virtual ~Tape();
      //------------------------------------------------------------------------
      // Standard Copy Constructor
      //
      Tape(const Tape& another);
      //------------------------------------------------------------------------
      // operator = 
      //
      Tape& operator=(const Tape& another);
      //------------------------------------------------------------------------
      // move Read/Write Head by move
      //
      void moveHead(const int& move);
      //------------------------------------------------------------------------
      // write the character on the tape (always)
      //
      void forceWrite(const char& toWrite);
      //------------------------------------------------------------------------
      // write the character on the tape (except for wildcards)
      //
      void write(const char& toWrite);
      //------------------------------------------------------------------------
      // read the character of the tape
      //
      const char read();
      //------------------------------------------------------------------------
      // preset the number of characters to be outputted 
      // when displaying the tape
      //
      void setPrintTapeFieldCount(const int& count);
      //------------------------------------------------------------------------
      // load the tape from the given file
      //
      void loadInput(const string& input);
      //------------------------------------------------------------------------
      // load the tape from the given file (in hexnotation)
      //
      void loadHexInput(const string& path);
#ifndef DISABLE_TOY
      //------------------------------------------------------------------------
      // load the tape from the given file (toy code)
      //
      void loadToyInput(const string& path);
#endif
      //------------------------------------------------------------------------
      // clear the tape
      //
      void clear();
      //------------------------------------------------------------------------
      // save the tape and the given input to the file
      //
      void saveTape(const string &path, const string &input) const;
      //------------------------------------------------------------------------
      // reset the head position to 0 (tape start)
      //
      void resetHead();
      //------------------------------------------------------------------------
      // set the head to the tape end
      //
      void setHeadAtEnd();
      //------------------------------------------------------------------------
      // return the tape content (preset size)
      //
      const string printTape();
      //------------------------------------------------------------------------
      // return the tape content (given size)
      //
      const string printTape(const int& sizeOfFields);
      //------------------------------------------------------------------------
      // read the file (file path is on tape)
      //
      void readFile();
      //------------------------------------------------------------------------
      // write tape content into the file (file path is on tape)
      //
      void writeFile();
    
    private:
      //------------------------------------------------------------------------
      // position of read/write head
      //
      int mHeadPos;
      //------------------------------------------------------------------------
      // number of characters to be printed
      //
      int mFieldCount;
      //------------------------------------------------------------------------
      // tape content
      //
      deque<char> mTape;
    
      //------------------------------------------------------------------------
      // extend the tape to the left
      //
      void extendTapeLeft();
      //------------------------------------------------------------------------
      // extend the tape to the right
      //
      void extendTapeRight();
  
      //------------------------------------------------------------------------
      // read the filename of the tape
      //
      const string readFileNameFromTape();
      
  };

}

#endif