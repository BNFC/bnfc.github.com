{-
    BNF Converter: Haskell string sharing
    Copyright (C) 2004-2007  Author:  Björn Bringert

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-}
module MkSharedString where

sharedString :: String -> b -> String
sharedString shareMod _ = unlines 
    [
     "module " ++ shareMod ++ " (shareString) where",
     "",
     "import Data.HashTable as H",
     "import System.IO.Unsafe (unsafePerformIO)",
     "",
     "{-# NOINLINE stringPool #-}",
     "stringPool :: HashTable String String",
     "stringPool = unsafePerformIO $ new (==) hashString",
     "",
     "{-# NOINLINE shareString #-}",
     "shareString :: String -> String",
     "shareString s = unsafePerformIO $ do",
     "  mv <- H.lookup stringPool s",
     "  case mv of",
     "       Just s' -> return s'",
     "       Nothing -> do",
     "                  H.insert stringPool s s",
     "                  return s"
    ]
