///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 28.02.17
/// 
/// Input/Output Tape
///

#ifndef _TAPE_H_
#define _TAPE_H_

#include <deque>
#include <string>
#include <iostream>

#ifdef ENABLE_WILDCARD
  #ifndef WILDCARD
    #define WILDCARD '*'
  #endif
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
#ifdef TAPELIMIT
        if(mTape.size() >= TAPELIMIT && mHeadPos == 0) return;
#endif
        mHeadPos--;
#ifdef TAPE_LEFT_END
        if(mHeadPos < 0) mHeadPos = 0;
#else
        if(mHeadPos < 0) extendTapeLeft();
        moveHead(move + 1);
#endif
      }
      if(move > 0)
      {
#ifdef TAPELIMIT
        if(mTape.size() >= TAPELIMIT && mHeadPos == ((int)mTape.size() - 1)) return;
#endif
        mHeadPos++;
        if(mHeadPos >= (int)mTape.size()) extendTapeRight();
        moveHead(move - 1);
      }      
    }
    void forceWrite(char toWrite)
    {
      mTape[mHeadPos] = toWrite;
    }
    void write(char toWrite)
    {
#ifdef ENABLE_WILDCARD
      if(toWrite == WILDCARD) return; //don't change tape (wildcard)
#endif
      mTape[mHeadPos] = toWrite;
    }
    char read()
    {
      while(mHeadPos >= (int)mTape.size()) extendTapeRight();
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
    void loadHexInput(string path)
    {
      mTape.clear();
      ifstream file(path);
      string content;
      if(file.is_open())
      {
        string line;
        while(getline(file, line))
          content += line;
        file.close();
      }
      unsigned int index = 0;
      for(index = 0; index < content.length(); index+=2)
      {
        string twoByte = "0x"+content.substr(index,2);
        char c = (char)stoul(twoByte, NULL, 16);
        mTape.push_back(c);
      }
    }
#ifdef ENABLE_TOY
    void loadToyInput(string path)
    {
      mTape.clear();
      ifstream file(path);
      string content;
      if(file.is_open())
      {
        string line;
        while(getline(file, line))
        {
          stringsup::trim(line);
          //line starts with linenumber (two digits, then one :, then one space, then 4 chars for the command)
          if(line.length() < 8) continue;
          if(line[2] != ':' || line[3]!=' ') continue;
          
          int linenr = ((line[1]-0x30)+(line[0]-0x30))<<4;
          unsigned int atleastlong = linenr << 2;
          
          while(content.length() <= atleastlong) content+="0000";
          
          content[atleastlong] = line[4];
          content[atleastlong+1] = line[5];
          content[atleastlong+2] = line[6];
          content[atleastlong+3] = line[7];
        }
        file.close();
      }
      unsigned int index = 0;
      for(index = 0; index < content.length(); index+=2)
      {
        string twoByte = "0x"+content.substr(index,2);
        char c = (char)stoul(twoByte, NULL, 16);
        mTape.push_back(c);
      }
    }
#endif
    
    void clear()
    {
      mTape.clear();
      mTape.push_back(EMPTY);
      mHeadPos = 0;
    }
    
    void saveTape(const string &path, const string &input)
    {
      ofstream file(path);
      if(file.is_open())
      {
        file << input << endl;
        string content;
        content.append(mTape.begin(),mTape.end());
        file << content;
        file.close();
      }
    }
    
    void resetHead()
    {
      mHeadPos = 0;
    }
    void setHeadAtEnd()
    {
      mHeadPos = mTape.size() - 1;
    }
    string printTape()
    {
      return printTape(mFieldCount);
    }
    string printTape(int sizeOfFields)
    {
      string tape;
      int halfsize = sizeOfFields >> 1;
      int leftIndex = mHeadPos - halfsize;
      int maxIndex = leftIndex + sizeOfFields;
      int rightIndex = maxIndex;
      int padLeftCount = 0;
      if(maxIndex > (int)mTape.size()) rightIndex = mTape.size();
      
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
      ifstream file(path);
      if(file.is_open())
      {
        string line;
        int pos = mHeadPos+1;
        while(getline(file, line))
        {
          mTape.insert(mTape.begin() + pos, line.begin(), line.end());
          mTape.push_back('\n');
          pos+=line.size()+1;
        }
        mTape.push_back('$');
        file.close();
      }
      moveHead(1);
    }
    
    void writeFile()
    {
      string path = readFileNameFromTape();
      moveHead(1);
      ofstream file(path);
      if(file.is_open())
      {
        string content;
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
      string file;
      int tapeSize = mTape.size();
      while(mHeadPos < tapeSize && mTape[mHeadPos] != '$')
      {
        file+=mTape[mHeadPos];
        mHeadPos++;
      }
      if(mHeadPos >= tapeSize)
        mTape.push_back('$');
      return file;
    }
    
};

#endif