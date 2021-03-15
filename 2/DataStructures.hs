module Lab2a.DataStructures where

import qualified Data.Map as M
import qualified Data.Set as S


--------------------
-- Stos i Kolejka --
--------------------

newtype Stack a = Stack [a]

makeEmptyStack :: Stack a
makeEmptyStack = Stack []

topS :: Stack a -> Maybe a
topS (Stack (x:xs)) = Just x
topS (Stack []) = Nothing

nullS :: Stack a -> Bool
nullS (Stack []) = True
nullS _ = False

popS :: Stack a -> Stack a
popS (Stack (x:xs)) = Stack xs
popS _ = Stack []

pushS :: Stack a -> a -> Stack a
pushS (Stack l) el = Stack $ el:l

-- Dla chętnych: kolejka za pomocą dwóch stosów

data Queue a = Queue {
  qIn :: Stack a,
  qOut :: Stack a
  }

-- qIn :: Queue a -> Stack a
-- qOut :: Queue a -> Stack a

emptyQ :: Queue a -> Bool
emptyQ Queue {qIn = q1, qOut = q2} = nullS q1 && nullS q2
-- emptyQ (Queue q1 q2) = undefined

-- Można poczytać:
-- Record Wildcars:
-- emptyQ Queue{..} = undefined
-- https://ocharles.org.uk/blog/posts/2014-12-04-record-wildcards.html

---------------
-- Set i Map --
---------------

-- dokumentacja do Data.Map znajduje sie w module Data.Map.Strict (są takie same).
-- https://hackage.haskell.org/package/containers-0.6.2.1/docs/Data-Map-Strict.html
-- (można też wpisać Data.Map.Struct w hoogla)

-- dokumentacja Data.Set
-- https://hackage.haskell.org/package/containers-0.6.2.1/docs/Data-Set.html
-- (można też wpisać Data.Set w hoogla)

-- zastąp każdy napis z listy przez indeks jego pierwszego
-- pojawienia się na liście (numerujemy od zera)

renumerate :: [String] -> [Int]
renumerate ["a", "ba", "b", "ba", "a"] = [0, 1, 2, 1, 0]
renumerate list = renumerateHelper list M.empty 0
  where
    renumerateHelper :: [String] -> M.Map String Int -> Int -> [Int]
    renumerateHelper [] _ _ = []
    renumerateHelper (x:xs) m cnt =
      case M.lookup x m of
          Just n -> n : renumerateHelper xs m (cnt+1)
          Nothing -> cnt : renumerateHelper xs (M.insert x cnt m) (cnt+1)

-- normalnie w Data.Containers.ListUtils
-- nub w O(n log n)
nubOrd :: (Ord a) => [a] -> [a]
nubOrd = undefined

-- sprawdzamy czy można tak ułożyć literki w napisie `x`
-- (być może niektóre usuwając), by uzyskać napis `y`. O(n log n)
canBeObtainedFrom :: String -> String -> Bool
canBeObtainedFrom x y = undefined

---------------
-- Funktory ---
---------------

t1 = (+1) <$> [1, 2, 3]

t2 = (+1) <$> Just 5
t3 = (+1) <$> Nothing


f :: String -> Int
f "Jeden" = 1
f "Dwa" = 2
f "Trzy" = 3
f _ = 0

t4 = (+1) <$> f

-- Dla chętnych : Functors.hs
