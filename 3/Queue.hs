module Lab3a.Queue where
  
import qualified Lab3a.Stack as S
import Prelude hiding (null, reverse)

reverse :: S.Stack a -> S.Stack a
reverse = reverseAux S.empty
 where
  reverseAux acc x = case S.top x of
    Nothing -> acc
    Just e -> reverseAux (S.push acc e) (S.pop x)

data Queue a = Queue {
  inStack :: S.Stack a,
  lastInStack :: Maybe a,
  outStack :: S.Stack a}
  deriving Show
  

empty :: Queue a
empty = Queue {
  inStack = S.empty,
  lastInStack = Nothing,
  outStack = S.empty
}

null :: Queue a -> Bool
null (Queue {inStack = is, outStack = os}) =
  S.null is && S.null os
-- Niektóre pola możemy pomninąć
  
front :: Queue a -> Maybe a
front q = case S.top $ outStack q of
  Just x -> Just x
  Nothing -> lastInStack q
  
pop :: Queue a -> Queue a
pop (Queue {inStack=is, outStack=os, lastInStack=lis})
  | S.null os = Queue {
                        inStack = S.empty,
                        outStack = S.pop $ reverse is,
                        lastInStack = Nothing }
  | otherwise = Queue {
                        inStack = is,
                        outStack = S.pop os,
                        lastInStack = lis }
                        
push :: Queue a -> a -> Queue a
push (Queue {inStack=is, outStack=os, lastInStack=lis}) elem =
  Queue {
    inStack = S.push is elem,
    outStack = os,
    lastInStack = nlastInStack
  } where
      nlastInStack = case lis of
        Nothing -> Just elem
        Just x -> Just x
