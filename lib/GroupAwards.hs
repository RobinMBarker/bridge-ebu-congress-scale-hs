module GroupAwards where

import GreenPoint

tiedAwards :: RealFloat a => [a] -> [Int] -> [a]
groupAwards :: RealFloat a => a -> a -> Int -> [Int] -> [a]
groupMPs :: (RealFloat a, Integral b) => 
                            a -> a -> Int -> [Int] -> [b]
groupGPs :: RealFloat a => a -> a -> Int -> [Int] -> [a]

groupMPs t l n gs = map toMP $ groupAwards t l n gs
groupGPs t l n gs = map toGP $ groupAwards t l n gs

groupAwards t l n gs = map (max l) $ tiedAwards (awards t l n) gs

tiedAwards mps grps = tied 0 grps
    where   l = length mps
            award n | n > l = 0 | otherwise = mps!!(n-1)
            tied _ [] = []
            tied n (g:gs) | n >= l  = []
                    | otherwise     =   
                        (sum [award (n+i)|i<-[1..g]])/
                            (fromIntegral g)
                        : tied (n+g) gs
