module ReplaceExperiment where

replaceWithP :: b -> Char
replaceWithP = const 'p'

lms :: [Maybe [Char]]
lms = [Just "Ave", Nothing, Just "sure dude."]

replaceWithP' :: [Maybe [Char]] -> Char
replaceWithP' = replaceWithP

liftedReplace :: Functor f => f a -> f Char
liftedReplace = fmap replaceWithP

liftedReplace' :: [Maybe [Char]] -> [Char]
liftedReplace' = liftedReplace

twiceLifted :: (Functor f1, Functor f) =>
               f (f1 a) -> f (f1 Char)
twiceLifted = (fmap . fmap) replaceWithP

twiceLifted' :: [Maybe [Char]] -> [Maybe Char]
twiceLifted' = twiceLifted

thriceLifted :: (Functor f2, Functor f1, Functor f) =>
                f (f1 (f2 a)) -> f (f1 (f2 Char))
thriceLifted = (fmap . fmap . fmap) replaceWithP

thriceLifted' :: [Maybe [Char]] -> [Maybe [Char]]
thriceLifted' = thriceLifted

main :: IO ()
main = do
  putStr "replaceWithP' lms:   "
  print (replaceWithP' lms)

  putStr "liftedReplace lms:   "
  print (liftedReplace lms)

  putStr "liftedReplace' lms:  "
  print (liftedReplace lms)

  putStr "twiceLifted lms:     "
  print (twiceLifted lms)

  putStr "twiceLifted' lms:    "
  print (twiceLifted' lms)

  putStr "thriceLifted lms:    "
  print (thriceLifted lms)

  putStr "thriceLifted' lms:   "
  print (thriceLifted' lms)


-- replaceWithP' lms:   'p'
-- liftedReplace lms:   "ppp"
-- liftedReplace' lms:  "ppp"
-- twiceLifted lms:     [Just 'p',Nothing,Just 'p']
-- twiceLifted' lms:    [Just 'p',Nothing,Just 'p']
-- thriceLifted lms:    [Just "ppp",Nothing,Just "pppppppppp"]
-- thriceLifted' lms:   [Just "ppp",Nothing,Just "pppppppppp"]