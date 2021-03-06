{-# LANGUAGE NoImplicitPrelude #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  Foreign
-- Copyright   :  (c) The FFI task force 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  ffi@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- A collection of data types, classes, and functions for interfacing
-- with another programming language.
--
-----------------------------------------------------------------------------

module Foreign
        ( module Data.Bits
        , module Data.Int
        , module Data.Word
        , module Foreign.Ptr
        , module Foreign.ForeignPtr
        , module Foreign.StablePtr
        , module Foreign.Storable
        , module Foreign.Marshal

        -- | 'unsafePerformIO' is exported here for backwards
        -- compatibility reasons only.  For doing local marshalling in
        -- the FFI, use 'unsafeLocalState'.  For other uses, see
        -- 'System.IO.Unsafe.unsafePerformIO'.
        , unsafePerformIO
        ) where

import Data.Bits
import Data.Int
import Data.Word
import Foreign.Ptr
import Foreign.ForeignPtr
import Foreign.StablePtr
import Foreign.Storable
import Foreign.Marshal

import System.IO.Unsafe (unsafePerformIO)
