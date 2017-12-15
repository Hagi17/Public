///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 15.12.17
/// 
/// Input/Output Tape
///

#ifndef _TAPE_H_
#define _TAPE_H_

#include <deque>
#include <string>

#ifndef WILDCARD
#define WILDCARD '*'
#endif
#ifndef EMPTY
#define EMPTY '_'
#endif

using namespace std;

class Tape
{
  public:
    Tape()
    {
      mFieldCount = 60;
      mHeadPos = 0;
      mTape.clear();
      mTape.push_back(EMPTY);
    }
    ~Tape()
    {
    }
    
    void moveHead(int move)
    {
      if(move < 0)
      {
        mHeadPos--;
        if(mHeadPos < 0) extendTapeLeft();
        moveHead(move + 1);
      }
      if(move > 0)
      {
        mHeadPos++;
        if(mHeadPos >= mTape.size()) extendTapeRight();
        moveHead(move - 1);
      }      
    }
    
    void write(char toWrite)
    {
      if(toWrite == WILDCARD) return; //don't change tape (wildcard)
      mTape[mHeadPos] = toWrite;
    }
    char read()
    {
      while(mHeadPos >= mTape.size()) extendTapeRight();
      return mTape[mHeadPos];
    }
    void setPrintTapeFieldCount(int count)
    {
      mFieldCount = count;
    }
    void loadInput(string input)
    {
      mTape.clear();
      mTape.insert(mTape.begin(), input.begin(), input.end());
    }
    
    void clear()
    {
      mTape.clear();
      mTape.push_back(EMPTY);
      mHeadPos = 0;
    }
    
    void saveTape(string path, string input)
    {
      ofstream file(path);
      if(file.is_open())
      {
        file << input << endl;
        string content = "";
        content.append(mTape.begin(),mTape.end());
        file << content;
        file.close();
      }
    }
    
    void resetHead()
    {
      mHeadPos = 0;
    }
    string printTape()
    {
      return printTape(mFieldCount);
    }
    string printTape(int sizeOfFields)
    {
      string tape = "";
      int halfsize = sizeOfFields >> 1;
      int leftIndex = mHeadPos - halfsize;
      int maxIndex = leftIndex + sizeOfFields;
      int rightIndex = maxIndex;
      int padLeftCount = 0;
      if(maxIndex > mTape.size()) rightIndex = mTape.size();
      
      if(leftIndex < 0)
      {
        tape.append(-leftIndex, EMPTY);
        padLeftCount = -leftIndex;
        leftIndex = 0;
      }
      tape.insert(tape.begin() + padLeftCount, mTape.begin()+leftIndex, 
        mTape.begin()+rightIndex);
      stringsup::replace(tape, "\n"," ");
      stringsup::replace(tape, "\r"," ");
      stringsup::replace(tape, "\b"," ");
      tape.append(maxIndex - rightIndex, EMPTY);
      return tape;
    }
  
    void readFile()
    {
      string path = readFileNameFromTape();
      moveHead(1);
      ifstream file(path);
      if(file.is_open())
      {
        string line;
        int pos = mHeadPos;
        while(getline(file, line))
        {
          mTape.insert(mTape.begin() + pos, line.begin(), line.end());
          mTape.push_back('\n');
          pos+=line.size()+1;
        }
        mTape.push_back('$');
        file.close();
      }
    }
    
    void writeFile()
    {
      string path = readFileNameFromTape();
      moveHead(1);
      ofstream file(path);
      if(file.is_open())
      {
        string content = "";
        content.append(mTape.begin()+mHeadPos,mTape.end());
        size_t found = content.find("$");
        if (found!= string::npos)
          content = content.substr(0, found);
        file << content;
        file.close();
      }
    }
  
  private:
    int mHeadPos;
    int mFieldCount;
    deque<char> mTape;
    
    void extendTapeLeft()
    {
      mTape.push_front(EMPTY);
      mHeadPos++; // move head right, to ensure same position as before
    }
    void extendTapeRight()
    {
      mTape.push_back(EMPTY);
    }

    string readFileNameFromTape()
    {
      string file = "";
      while(mHeadPos < mTape.size() && mTape[mHeadPos] != '$')
      {
        file+=mTape[mHeadPos];
        mHeadPos++;
      }
      if(mHeadPos >= mTape.size())
        mTape.push_back('$');
      return file;
    }
    
};

#endif