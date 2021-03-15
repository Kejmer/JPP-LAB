module Lab1a.IntroFilled where

import Prelude hiding (Maybe, Nothing, Just)

-- Enumeration Types:

data Direction = North | East | West | South
  deriving Show

turnClockwise :: Direction -> Direction
turnClockwise North = East
turnClockwise East = South
turnClockwise South = West
turnClockwise West = North

turnAround :: Direction -> Direction
turnAround = undefined

-- Union Types:

data Shape = Rectangle Double Double
           | Circle Double
           | Triangle Double Double Double
           deriving Show

area :: Shape -> Double
area (Rectangle a b) = a * b
area (Circle r) = 3.14 * r * r
area (Triangle a b c) = sqrt toRoot
  where
    toRoot = p * (p - a) * (p - b) * (p - c)
    p = (a + b + c) / 2
    -- Zwykle pomijamy typy w "where"

perimeter :: Shape -> Double
perimeter (Rectangle a b) = 2 * (a + b)
perimeter (Circle r) = 2 * 3.14 * r
perimeter (Triangle a b c) = a + b + c

-- Recursive Types:

data Nat = Z | S Nat
  deriving (Show, Eq)

add :: Nat -> Nat -> Nat
add Z x = x
add (S y) x = S (add y x)

isEven :: Nat -> Bool
isEven Z = True
isEven (S Z) = False
isEven (S (S x)) = isEven x

isOdd :: Nat -> Bool
isOdd Z = False
isOdd (S Z) = True
isOdd (S (S x)) = isOdd x

mult :: Nat -> Nat -> Nat
mult = undefined

-- Generic Types:

data Maybe x = Just x | Nothing
-- Wartość lub jej brak

safeDivide :: Int -> Int -> Maybe Int
safeDivide x 0 = Nothing
safeDivide x y = Just (x `div` y)
-- safeDivide x y = Just $ x `div` y

addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe = undefined

-- Generic, recursive types

data MyList a = Nil | Cons a (MyList a)
-- data [a] = [] | a:[a]

l1 :: [Int]
l1 = 1:2:3:[]

l2 :: [Int]
l2 = [1, 2, 3]

l3 :: MyList Int
l3 = Cons 1 (Cons 2 (Cons 3 Nil))

myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

myMyLength :: MyList a -> Nat
myMyLength = undefined

myMyLengthTest :: Bool
myMyLengthTest = myMyLength l3 == S (S (S Z))

listToMyList :: [a] -> MyList a
listToMyList = undefined

myListToList :: MyList a -> [a]
myListToList = undefined


myFilter :: (a -> Bool) -> ([a] -> [a])
myFilter f [] = []
myFilter f (x:xs) = part ++ myFilter f xs
    where part = [x | f x]


-- Częściowo oparty na Moodlu przedmiotu, częściowo na rozdziale 4 z książki: Edward Brady, Type-driven development with Idris











