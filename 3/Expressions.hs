module Lab3a.Expressions where
    
data Exp 
  = EInt Int             -- stała całkowita       
  | EAdd Exp Exp         -- e1 + e2
  | ESub Exp Exp         -- e1 - e2
  | EMul Exp Exp         -- e1 * e2
  | EVar String          -- zmienna
--  | ELet String Exp Exp  -- let var = e1 in e2
  deriving (Eq)

precedence :: Exp -> Int
precedence (EInt _) = 3
precedence (EAdd _ _) = 1
precedence _ = undefined
-- dopisać pozostałe wartości


-- 3 * (5 + 5)
-- 5 + (5 + 5) --> 5 + 5 + 5

instance Show Exp where
    show = showAux 0
      where
        showAux i elem = addParens i (precedence elem) $ showAuxAux elem
        
        -- do zrobienia:
        
        showAuxAux exp = undefined
        -- wyświetlanie bez zewnętrznych nawiasów
        
        addParens p1 p2 exp = undefined
        -- dodawanie nawiasów jeśli jest to potrzebne
        
-- instance Num Exp where ...
        
simplifyOnce :: Exp -> Exp
-- tutaj można dopisać różne optymalizacje, które nie powinny być rekurencyjne
simplifyOnce x = x

simplify :: Exp -> Exp
simplify = undefined
-- rekurencyjne "przepchnięcie" simplify once
