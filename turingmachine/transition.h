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
    Transition(char input, char output, int move, int newState, int curState)
    {
      mInput = input;
      mOutput = output;
      if(move != NO_MOVE && move != MOVE_LEFT && move != MOVE_RIGHT)
        mMove = NO_MOVE;
      else
        mMove = move;
      mNewstate = newState;
      mCurrstate = curState;
    }
    ~Transition()
    {
      
    }
    char inputChar()
    {
      return mInput;
    }
    char getOutput()
    {
      return mOutput;
    }
    int getMove()
    {
      if(mMove == NO_MOVE) return 0;
      if(mMove == MOVE_RIGHT) return 1;
      if(mMove == MOVE_LEFT) return -1;
    }
    char moveChar()
    {
      return mMove;
    }
    int getNewState()
    {
      return mNewstate;
    }
    void operate(char& writeChar, int& newState, int& move)
    {
      writeChar = mOutput;
      newState = mNewstate;
      move = getMove();
    }
  private:
    char mMove; 
    char mInput;
    
    char mOutput;
    int mNewstate;
    int mCurrstate;
};

#endif