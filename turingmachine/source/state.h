///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 15.12.17
/// 
/// class for encupsulation of a State
///

#ifndef _STATE_H_
#define _STATE_H_

#include <vector>
#include <string>

#include "transition.h"

using namespace std;

class State
{
  public:
  
    State(string name)
    {
      mName = name;
      mActions = vector<Transition*>();
    }
    ~State()
    {
      while(mActions.size() > 0)
      {
        delete mActions.back();
        mActions.pop_back();
      }
    }
    bool operate(char readChar, char& writeChar, int& newState, int& move)
    {
      int index = 0;
      int wildCardIndex = -1;
      for(index = 0; index < mActions.size(); index++)
      {
        Transition* tupel = mActions[index];
        if(tupel->inputChar() == readChar)
        {
          tupel->operate(writeChar, newState, move);
          return true;
        }
        if(tupel->inputChar() == WILDCARD)
        {
          wildCardIndex = index;
        }
      }
      if(index >= mActions.size())
        index = -1;
      if(index == -1 && wildCardIndex > -1)
      {
        mActions[wildCardIndex]->operate(writeChar, newState, move);
        return true;
      }
      return false;
    }
    string getName()
    {
      return mName;
    }
    void addTransition(Transition* way)
    {
      mActions.push_back(way);
    }
  private:
    string mName;
    
    vector<Transition*> mActions;
};

#endif