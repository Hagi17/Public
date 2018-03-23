///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// class for encupsulation of a 5-Tupel (Transition) - header file
///

#ifndef _TRANSITION_H_
#define _TRANSITION_H_

#define WILDCARD '*'
#define EMPTY '_'
#define MOVE_RIGHT '>'
#define MOVE_LEFT '<'
#define NO_MOVE '-'

namespace TM
{
  //----------------------------------------------------------------------------
  // class representing a transition
  //
  class Transition
  {
    public:
      //------------------------------------------------------------------------
      // Standard Constructor
      // @param input the character to signal the selection of this transition 
      //          when read
      // @param output the character to be written on tape if this transition is
      //          selected
      // @param move the head-movement in combination with this transition
      // @param steps the number of steps the head moves
      // @param newState the next State
      // @param curState the old State
      // @param hasBreakPoint indicates if this transition has a breakpoint
      // @param intF internal function
      // @param ignoreCase indicates whethter this transition ignores case on 
      //          input
      //
      Transition(const char& input, const char& output, const char& move, 
        const unsigned long& steps, const int& newState, const int& curState, 
        const bool& hasBreakpoint, int intF = -2, bool ignoreCase = false);
      //------------------------------------------------------------------------
      // Standard Denstructor
      //
      virtual ~Transition();
      //------------------------------------------------------------------------
      // Standard Copy Constructor
      //
      Transition(const Transition& another) = delete;
      //------------------------------------------------------------------------
      // Standard operator=
      //
      Transition& operator=(const Transition& another) = delete;
      //------------------------------------------------------------------------
      // returns the move indicator
      //
      const char moveChar() const { return mMove; }
#ifndef DISABLE_EXTENSIONS
      //------------------------------------------------------------------------
      // returns the internal function address
      //
      const int InternalFunction() const { return mIntF; }
#endif
      //------------------------------------------------------------------------
      // return the outputs of this transition
      //
      void operate(char& writeChar, int& newState, int& move) const;
      //------------------------------------------------------------------------
      // returns if this transition has a breakpoint
      //
      const bool hasBreakPoint() const { return mHasBreakpoint; }
      //------------------------------------------------------------------------
      // returns if this transition accepts the given character
      //
      const bool acceptsChar(const char& input) const;
      //------------------------------------------------------------------------
      // returns if this transition accepts any character
      //
#ifndef DISABLE_WILDCARD
      const bool acceptsAny() const { return mInput == WILDCARD; }
#else
      const bool acceptsAny() const { return false; }
#endif
    private:
      //------------------------------------------------------------------------
      // input character
      //
      char mInput;
      //------------------------------------------------------------------------
      // output character
      //
      char mOutput;
      //------------------------------------------------------------------------
      // movement indicator (<: left, >: right, -:stay)
      //
      char mMove; 
      //------------------------------------------------------------------------
      // number of steps
      //
      unsigned long mSteps;
      //------------------------------------------------------------------------
      // new state
      //
      int mNewstate;
      //------------------------------------------------------------------------
      // current state
      //
      int mCurrstate;
      //------------------------------------------------------------------------
      // internal function
      //
      int mIntF;
      //------------------------------------------------------------------------
      // has breakpoint
      //
      bool mHasBreakpoint;
      //------------------------------------------------------------------------
      // ignores case on input
      //
      bool mIgnoreCase;
    
      //------------------------------------------------------------------------
      // returns the movement indicator as integer
      //
      const int getMove() const;
  };
}

#endif