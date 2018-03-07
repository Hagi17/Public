///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 28.02.17
/// 
/// class for encupsulation of a 5-Tupel (Transition)
///

#ifndef _TRANSITION_H_
#define _TRANSITION_H_

#include <vector>
#include <deque>
#include <string>
#include <iostream>
#include <algorithm>

#define WILDCARD '*'
#define EMPTY '_'
#define MOVE_RIGHT '>'
#define MOVE_LEFT '<'
#define NO_MOVE '-'

using namespace std;

class Transition
{
  public:
    Transition(char input, char output, char move, unsigned long steps, int newState, int curState,
      bool hasBreakpoint, int intF = -2, bool ignoreCase = false)
    {
      mInput = input;
      mOutput = output;
      if(move != NO_MOVE && move != MOVE_LEFT && move != MOVE_RIGHT)
        mMove = NO_MOVE;
      else
        mMove = move;
      mSteps = steps;
      mNewstate = newState;
      mCurrstate = curState;
#ifdef ENABLE_EXTENSIONS
      mIntF = intF;
#else
      mIntF = -2;
#endif
      mHasBreakpoint = hasBreakpoint;
      mIgnoreCase = ignoreCase;
    }
    ~Transition()
    {
      
    }
    char moveChar()
    {
      return mMove;
    }
#ifdef ENABLE_EXTENSIONS
    int InternalFunction()
    {
      return mIntF;
    }
#endif
    void operate(char& writeChar, int& newState, int& move)
    {
      writeChar = mOutput;
      newState = mNewstate;
      move = getMove();
      if(move > 0) move = (int)mSteps;
      else if(move < 0) move = - ((int)mSteps);
    }
    bool hasBreakPoint() 
    {
      return mHasBreakpoint;
    }
    bool acceptsChar(char input)
    {
      if(mInput == input) return true;
      if(mIgnoreCase && (toupper(input) == toupper(mInput)))
        return true;
      return acceptsAny();
    }
    bool acceptsAny()
    {
#ifdef ENABLE_WILDCARD
      return mInput == WILDCARD;
#else
      return false;
#endif
    }
  private:
  
    int getMove()
    {
      if(mMove == NO_MOVE) return 0;
      if(mMove == MOVE_RIGHT) return 1;
      if(mMove == MOVE_LEFT) return -1;
      return 0;
    }
    char mMove; 
    char mInput;
    unsigned long mSteps;
    
    bool mHasBreakpoint;
    bool mIgnoreCase;
    
    char mOutput;
    int mNewstate;
    int mCurrstate;
    int mIntF;
};

#endif