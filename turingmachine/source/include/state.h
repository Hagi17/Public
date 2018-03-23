///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.17
/// 
/// class for encupsulation of a State
///

#ifndef _STATE_H_
#define _STATE_H_

#include <vector>
#include <string>
#include <memory>

#include "transition.h"

using std::string;
using std::vector;
using std::shared_ptr;

namespace TM
{
  //----------------------------------------------------------------------------
  // class representing the current state of the turing machine
  //
  class State
  {
    public:
      //------------------------------------------------------------------------
      // Standard Constructor
      //
      State(const string& name);
      //------------------------------------------------------------------------
      // Standard Destructor
      //
      virtual ~State();
      //------------------------------------------------------------------------
      // Standard Copy Constructor
      //
      State(const State& another) = delete;
      //------------------------------------------------------------------------
      // Standard operator=
      //
      State& operator=(const State& another) = delete;
      //------------------------------------------------------------------------
      // returns the Internal Function corresponding to the given char 
      //  (=transition) on the tape
      //
#ifndef DISABLE_EXTENSIONS
      int InternalFunction(const char& readChar);
#endif
      //------------------------------------------------------------------------
      // transend to the next state
      // @param readChar input character on the tape
      // @param writeChar (output) character to be written on the tape
      // @param newState (output) next state
      // @param move (output) head movement to be executed
      // @param breakPoint (output) indicates whethter this transition 
      //         has an active breakPoint
      //
      // returns if any transition was made
      //
      bool operate(const char& readChar, char& writeChar, int& newState, 
        int& move, bool& breakPoint);
      //------------------------------------------------------------------------
      // return the name of the current state
      // 
      const string getName() const { return mName; }
      //------------------------------------------------------------------------
      // add a transition to this state
      //
      void addTransition(shared_ptr<Transition>& way);
      
    private:
      //------------------------------------------------------------------------
      // name of the state
      //
      string mName;
      //------------------------------------------------------------------------
      // list of all transitions
      //
      vector<shared_ptr<Transition>> mActions;
  };

}

#endif