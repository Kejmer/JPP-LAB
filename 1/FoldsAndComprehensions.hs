module FoldsAndComprehensionsDone where

-------------------------
-- List Comprehensions --
-------------------------

divisibleBySevenTo :: Int -> [Int]
divisibleBySevenTo x =
  [x | x <- [1..x], x `mod` 7 == 0]

pairsThatSumTo :: Int -> [(Int, Int)]
pairsThatSumTo x =
  [(a,b) | a <- [0..x], b <- [0..x], a + b == x]

pairsThatSumTo' :: Int -> [(Int, Int)]
pairsThatSumTo' x =
  [(a, x - a) | a <- [0..x]]

-----------  
-- Folds --
-----------

-- Powiedzmy, że chcemy policzyć wszystkie elementy listy:
--     [1, 2, 3, 4, 5]
-- Są dwa naturalne sposoby jej ponawiasowania

--    (((((0 + 1) + 2) + 3) + 4) + 5)
--    (1 + (2 + (3 + (4 + (5 + 0)))))


suml :: [Int] -> Int
--suml l = foldl (\acc x -> acc + x) 0 l
--suml l = foldl (+) 0 l
suml = sum

-- dla każdego x, f x = g x
-- jest równoważne z
-- f = g

sumr :: [Int] -> Int
--sumr l = foldr (\x acc -> acc + x) 0 l
--sumr l = foldr (+) 0 l
sumr = sum


-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- Ciekawostka:
-- foldl1 :: (a -> a -> a) -> [a] -> a
-- foldr1 :: (a -> a -> a) -> [a] -> a

------------------------------------------------
-- Łagodne wprowadzenie do Typeclass i Hoogla --
------------------------------------------------

reverse2 :: [a] -> [a]
reverse2 l = foldl (\acc x -> x : acc) [] l

elem2 :: (Eq a) => a -> [a] -> Bool
f2 el acc x = acc || (el == x)
elem2 el = foldl (f2 el) False

count2 el = foldl (\acc x -> acc + if x == el then 1 else 0) 0

-- count :: a-> [a] -> Int
-- sort :: [a] -> [a]
