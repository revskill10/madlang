{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

-- | Module with the type of a random token
module Text.Madlibs.Internal.Types where

import qualified Data.Text as T
import Control.Monad.State
import Data.Functor.Identity
import Control.Lens hiding (List, Context)
import Data.Function

-- | datatype for a double representing a probability
type Prob = Double

-- | dataype for a key aka token name
type Key = T.Text

-- | Pretoken, aka token as first read in
data PreTok = Name T.Text | PreTok T.Text 
    deriving (Show)

-- | datatype for a token returning a random string
data RandTok = List [(Prob, RandTok)] | Value T.Text 
    deriving (Show, Eq)

-- | Make `RandTok` a monoid so we can append them together nicely (since they do generate text). 
--
-- > (Value "Hello") <> (List [(0.5," you"), (0.5, " me")])
-- > (List [(0.5,"Hello you"), (0.5, "Hello me")])
instance Monoid RandTok where
    mempty = Value ""
    mappend (Value v1) (Value v2) = Value (T.append v1 v2)
    mappend (List l1) v@(Value v1) = List $ map (over (_2) (`mappend` v)) l1 
    mappend v@(Value v2) (List l2) = List $ map (over (_2) (`mappend` v)) l2
    mappend l@(List l1) (List l2) = List $ [ (p, l `mappend` tok) | (p,tok) <- l2 ]

-- | State monad providing context, i.e. function we've already called before
type Context a = State [(Key, RandTok)] a

-- | Compare inside the state monad using only the underlying objects
instance (Eq a) => Eq (Context a) where
    (==) a b = (on (==) (flip evalState [])) a b