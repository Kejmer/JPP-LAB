module Lab3a.OrderedList(OrderedList, fromList, toList, insert, remove) where
  
import qualified Data.List as L
import Debug.Trace
  
newtype OrderedList a = OL [a]
  deriving (Show, Eq)

instance Functor OrderedList where
  fmap f (OL x) = OL $ f <$> x
  
fromList :: (Ord a) => [a] -> OrderedList a
fromList = OL . L.sort

toList :: OrderedList a -> [a]
toList (OL x) = x

-- Insert -- O(n)
insert :: (Ord a) => OrderedList a -> a -> OrderedList a
insert (OL x) elem = OL $ insertAux x elem
  where
    insertAux = undefined

-- Remove -- O(n)
remove :: (Ord a) => OrderedList a -> a -> OrderedList a
remove (OL x) elem = OL $ removeAux x elem
  where
    removeAux [] elem = []
    removeAux (x:xs) elem
      | x >= elem = x:xs
      | x == elem = xs
      | otherwise = x : removeAux xs elem
-- Debugging

instance (Ord a) => Semigroup (OrderedList a) where
  (OL x) <> (OL y) = undefined
  
-- musi zachodzić
-- (a <> (b <> c)) = ((a <> b) <> c)
          
instance (Ord a) => Monoid (OrderedList a) where
  mempty = undefined
  
-- musi zachodzić
-- (mempty <> a) = (a <> mempty) = a
