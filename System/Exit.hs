-----------------------------------------------------------------------------
-- |
-- Module      :  System.Exit
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- Exiting the program.
--
-----------------------------------------------------------------------------

module System.Exit
    ( 
      ExitCode(ExitSuccess,ExitFailure)
    , exitWith      -- :: ExitCode -> IO a
    , exitFailure   -- :: IO a
  ) where

import Prelude

#ifdef __GLASGOW_HASKELL__
import GHC.IOBase
#endif

#ifdef __HUGS__
import Hugs.System
#endif

#ifdef __NHC__
import System
  ( ExitCode(..)
  , exitWith
  )
#endif

-- ---------------------------------------------------------------------------
-- exitWith

-- `exitWith code' terminates the program, returning `code' to the
-- program's caller.  Before it terminates, any open or semi-closed
-- handles are first closed.

#ifdef __GLASGOW_HASKELL__
exitWith :: ExitCode -> IO a
exitWith ExitSuccess = throw (ExitException ExitSuccess)
exitWith code@(ExitFailure n) 
  | n == 0 = ioException (IOError Nothing InvalidArgument "exitWith" "ExitFailure 0" Nothing)
  | otherwise = throw (ExitException code)
#endif  /* __GLASGOW_HASKELL__ */

exitFailure :: IO a
exitFailure = exitWith (ExitFailure 1)
