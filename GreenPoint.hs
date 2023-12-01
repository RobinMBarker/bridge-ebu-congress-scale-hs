{-
 - n = numAwards
t = TopAward
LA = LowAward
If n = 2 Then
    GreenRankAward(1) = RoundSym(t, 2)
    GreenRankAward(2) = RoundSym(LA, 2)
Else
    k = (t - LA) * (Sqr(n / 2) - 1)
    l = Sqr(n / 2) - 2
    X1 = (n - Sqr(n / 2) + 2) / 2
    Y1 = k / (l + X1)
    For p = 1 To n
    Curve = k / (p + l)
    StraightLine = (Y1 * (n - p) / (n - X1))
    If p > X1 Then DecAward = LA + StraightLine Else DecAward = LA + Curve
    GreenRankAward(p) = RoundSym(DecAward, 2)
    Next p
End If
-}
module GreenPoint where

round2dp :: RealFrac a => a -> a
round2dp x = (fromInteger (round (x*100)))/100

awards :: RealFloat a => a -> a -> Int -> [a]
awards top last num | num <= 2  = take num [top, last]
                    | otherwise = map (last +) $ map award [1..num]
    where   n = fromIntegral num
            l = (sqrt (n/2)) - 2
            k = (top-last)*(l+1)
            x = (n-l)/2
            y = k/(x + l)
            award i | p > x    = y * (n - p)/(n - x)
                    | otherwise = k / (p + l)
                where p = fromIntegral i


greenpoints :: RealFloat a => a -> a -> Int -> [a] 
greenpoints t l n = map round2dp $ awards t l n

