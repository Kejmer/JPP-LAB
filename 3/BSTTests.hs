a = Empty
b = fromList [4, 3, 2, 5, 7, 12, 1, 34]

not $ a == b

b == b

toList b == [1,2,3,4,5,7,12,34]

toList (remove 5 b) == [1,2,3,4,7,12,34]

toList (remove 7 b) == [1,2,3,4,5,12,34]

toList (remove 4 b) == [1,2,3,5,7,12,34]

toList (remove 12 b) == [1,2,3,4,5,7,34]

c = remove 7 b

toList (insert 8 c) == [1,2,3,4,5,8,12,34]
