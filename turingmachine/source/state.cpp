///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.17
/// 
/// state-class implementation
///

#include <string>
#include <memory>

#include "state.h"

using std::string;
using TM::State;

//------------------------------------------------------------------------------
State::State(const string& name) : mName(name)
{
}
//------------------------------------------------------------------------------
State::~State()
{
  while(!mActions.empty())
  {
    //delete mActions.back();
    mActions.pop_back();
  }
}
//------------------------------------------------------------------------------
#ifndef DISABLE_EXTENSIONS
int State::InternalFunction(const char& readChar)
{
  int index = 0;
  int wildCardIndex = -1;
  int mActionsSize = (int)mActions.size();
  for(index = 0; index < mActionsSize; index++)
  {
    std::shared_ptr<Transition> tupel = mActions[index];
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
#endif
//------------------------------------------------------------------------------
bool State::operate(const char& readChar, char& writeChar, int& newState, int& move, 
        bool& breakPoint)
{
  int index = 0;
#ifndef DISABLE_WILDCARD
  int wildCardIndex = -1;
#endif
  int mActionsSize = (int)mActions.size();
  for(index = 0; index < mActionsSize; index++)
  {
    std::shared_ptr<Transition> tupel = mActions[index];
#ifndef DISABLE_WILDCARD
    if(tupel->acceptsAny())
      wildCardIndex = index;
    else 
#endif
    if(tupel->acceptsChar(readChar))
    {
      tupel->operate(writeChar, newState, move);
      if(tupel->hasBreakPoint()) breakPoint = true;
      return true;
    }
  }
  if(index >= mActionsSize)
    index = -1;
#ifndef DISABLE_WILDCARD
  if(index == -1 && wildCardIndex > -1)
  {
    mActions[wildCardIndex]->operate(writeChar, newState, move);
    if(mActions[wildCardIndex]->hasBreakPoint()) breakPoint = true;
    return true;
  }
#endif
  return false;
}
//------------------------------------------------------------------------------
void State::addTransition(std::shared_ptr<Transition>& way)
{
  mActions.push_back(way);
}