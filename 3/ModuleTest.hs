module Lab3a.ModuleTest where
  
import qualified Lab3a.OrderedList as OrdL

myHead :: OrdL.OrderedList a -> a
--myHead (OL (x:xs)) = x # Tak się nie da -- konstruktor OL jest ukryty
myHead l = head $ OrdL.toList l


l1 :: OrdL.OrderedList Int
l1 = OrdL.fromList [1, 2, 3]

l2 :: OrdL.OrderedList Int
l2 = OrdL.fromList [3, 4, 5]

l3 :: OrdL.OrderedList Int
l3 = l1 <> l2
-- Instancje eksportujemy zawsze
