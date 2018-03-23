///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// class for encupsulation of a 5-Tupel (Transition) - implementation
///

#include <cctype>

#include "transition.h"

using TM::Transition;

//------------------------------------------------------------------------------
Transition::Transition(const char& input, const char& output, const char& move, 
      const unsigned long& steps, const int& newState, const int& curState, 
      const bool& hasBreakpoint, int intF, bool ignoreCase) 
      :
      mInput(input), mOutput(output), mSteps(steps), mNewstate(newState),
      mCurrstate(curState), mIntF(intF), mHasBreakpoint(hasBreakpoint),
      mIgnoreCase(ignoreCase)
{
  if(move != NO_MOVE && move != MOVE_LEFT && move != MOVE_RIGHT)
    mMove = NO_MOVE;
  else
    mMove = move;
#ifdef DISABLE_EXTENSIONS
      mIntF = -2;
#endif
}
//------------------------------------------------------------------------------
Transition::~Transition()
{
}
//------------------------------------------------------------------------------
void Transition::operate(char& writeChar, int& newState, int& move) const
{
  writeChar = mOutput;
  newState = mNewstate;
  move = getMove();
  if(move > 0) move = (int)mSteps;
  else if(move < 0) move = - ((int)mSteps);
}
//------------------------------------------------------------------------------
const bool Transition::acceptsChar(const char& input) const
{
  if(mInput == input) return true;
  if(mIgnoreCase && (std::toupper(input) == std::toupper(mInput)))
    return true;
  return acceptsAny();
}
//------------------------------------------------------------------------------
const int Transition::getMove() const
{
  if(mMove == NO_MOVE) return 0;
  if(mMove == MOVE_RIGHT) return 1;
  if(mMove == MOVE_LEFT) return -1;
  return 0;
}