///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 28.02.17
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
      while(!mActions.empty())
      {
        delete mActions.back();
        mActions.pop_back();
      }
    }
    int InternalFunction(char readChar)
    {
      int index = 0;
      int wildCardIndex = -1;
      int mActionsSize = (int)mActions.size();
      for(index = 0; index < mActionsSize; index++)
      {
        Transition* tupel = mActions[index];
        if(tupel->acceptsAny())
          wildCardIndex = index;
        else if(tupel->acceptsChar(readChar))
          return tupel->InternalFunction();
      }
      if(index >= mActionsSize)
        index = -1;
      if(index == -1 && wildCardIndex > -1)
      {
        return mActions[wildCardIndex]->InternalFunction();
      }
      return -2;
    }
    bool operate(char readChar, char& writeChar, int& newState, int& move, 
      bool& breakPoint)
    {
      int index = 0;
      int wildCardIndex = -1;
      int mActionsSize = (int)mActions.size();
      for(index = 0; index < mActionsSize; index++)
      {
        Transition* tupel = mActions[index];
        if(tupel->acceptsAny())
          wildCardIndex = index;
        else if(tupel->acceptsChar(readChar))
        {
          tupel->operate(writeChar, newState, move);
          if(tupel->hasBreakPoint()) breakPoint = true;
          return true;
        }
      }
      if(index >= mActionsSize)
        index = -1;
      if(index == -1 && wildCardIndex > -1)
      {
        mActions[wildCardIndex]->operate(writeChar, newState, move);
        if(mActions[wildCardIndex]->hasBreakPoint()) breakPoint = true;
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