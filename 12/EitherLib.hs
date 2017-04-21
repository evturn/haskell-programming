lefts' :: [Either a b] -> [a]
lefts' = foldr f []
  where
    f (Left a) xs  = a : xs
    f (Right b) xs = xs

rights' :: [Either a b] -> [b]
rights' = foldr f []
  where
    f (Left a) xs  = xs
    f (Right b) xs = b : xs

partitionEithers' :: [Either a b ] -> ([a], [b])
partitionEithers' = foldr f ([], [])
  where
    f (Left a) (xs, ys)  = (a:xs, ys)
    f (Right b) (xs, ys) = (xs, b:ys)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right b) = Just (f b)

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' = doIt
  where
    doIt f1 _ (Left a)  = f1 a
    doIt _ f2 (Right b) = f2 b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' = doIt
  where
    doIt _ (Left a)  = Nothing
    doIt f (Right b) = Just (f b)