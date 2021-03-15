module Lab3a.BST where
  
import qualified Data.DList as DL

data BST a = Empty | Node (BST a) a (BST a)
   deriving (Show, Eq)
   
-- Napisać własne instancje Show i Eq

toList :: BST a -> [a]
toList = undefined
-- Wierzchołki w kolejności in-order
-- Żeby było efektywniej można użyć DList,
-- która zapewnia konkatenację w czasie stałym.
-- (Za to konwersja na zwykłą listę oraz oblicznie
-- pierwszego elementu zajmują czas liniowy).
   
rotate :: BST a -> BST a
rotate (Node left x (Node rleft y rright)) = 
  Node (Node left x rleft) y rright
  
insert :: (Ord a) => BST a -> a -> BST a
insert = undefined
-- nie trzymamy powtórzeń -- jeśli element już jest w drzewie, to nic nie robimy

fromList :: (Ord a) => [a] -> BST a
fromList = undefined

member :: (Ord a) => BST a -> a -> Bool
member = undefined

remove :: (Ord a) => BST a -> a -> BST a
remove = undefined

-- przydadzą się też funkcje

removeRoot :: (Ord a) => BST a -> BST a
removeRoot = undefined

removeMaxMaybe :: (Ord a) => BST a -> Maybe (a, BST a)
removeMaxMaybe = undefined
-- dla pustego drzewa zwracamy Nothing
-- dla pełnego drzewa zwracamy Just (maksymalny element, drzewo z usuiętym maksymalnym elementem)

-- Na koniec tworzymy moduł Sorting z funkcją sort, która
-- sortuje poprzez BST
