module Lab3a.Stack(Stack, empty, top, null, pop, push) where
  
import Prelude hiding (null)

newtype Stack a = Stack [a]
  deriving Show

empty :: Stack a
empty = Stack []

top :: Stack a -> Maybe a
top (Stack (x:xs)) = Just x
top (Stack []) = Nothing

null :: Stack a -> Bool
null (Stack []) = True
null _ = False

pop :: Stack a -> Stack a
pop (Stack (x:xs)) = Stack xs
pop (Stack []) = Stack []

push :: Stack a -> a -> Stack a
push (Stack l) elem  = Stack $ elem:l
