# Objective-C Delegate Crash on Deallocation

This repository demonstrates a common, subtle bug in Objective-C related to memory management and delegate patterns.  The bug arises when calling methods on a weak delegate that is in the process of deallocation.  A `weak` reference prevents retain cycles, but doesn't ensure the object still exists.

The solution involves checking for nil before calling the delegate method.

## Bug

The `bug.m` file shows the problematic code. The `MyViewController` calls a method on its weak delegate, which can lead to a crash if the delegate is deallocating.

## Solution

The `bugSolution.m` file provides a corrected version, which checks for `nil` before calling the delegate method.  This prevents the crash.

## How to reproduce

1. Clone this repository.
2. Open the project in Xcode.
3. Run the app.  The original buggy code will likely crash.  Then run the solution. It should not crash. 