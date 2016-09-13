{-# LANGUAGE FlexibleInstances #-}

module Data.RDF.Graph.HashS_Test (triplesOf',uniqTriplesOf',empty',mkRdf') where

import Data.RDF.Types
import Data.RDF.Graph.HashMapS (HashS)
import Data.RDF.GraphTestUtils
import qualified Data.Map as Map
import Control.Monad

import Test.QuickCheck

instance Arbitrary HashS

instance Arbitrary (RDF HashS) where
  arbitrary = liftM3 mkRdf arbitraryTs (return Nothing) (return $ PrefixMappings Map.empty)
  --coarbitrary = undefined

empty' :: RDF HashS
empty' = empty

mkRdf' :: Triples -> Maybe BaseUrl -> PrefixMappings -> RDF HashS
mkRdf' = mkRdf

triplesOf' :: RDF HashS -> Triples
triplesOf' = triplesOf

uniqTriplesOf' :: RDF HashS -> Triples
uniqTriplesOf' = uniqTriplesOf