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

roundHalfUp :: (RealFrac a, Integral b) => a -> b
roundHalfUp x | x >= 0 = floor (x + 0.5)

round2dp :: RealFrac a => a -> a
round2dp x = (fromInteger (roundHalfUp (x*100)))/100

awards :: RealFloat a => a -> a -> Int -> [a]
awards top last n | n <= 2      = take n [top, last]
                  | otherwise   = map (last +) $
                                    map award [1..n]
    where   x2 = fromIntegral n
            x0 = 2 - (sqrt (x2/2)) 
            k = (top-last)*(1-x0)
            curve x = k / (x - x0)
            x1 = (x0 + x2)/2
            m = k/((x1 - x0)*(x2 - x1))   
            line x = m * (x2 - x)
            award p | x > x1    = line x
                    | otherwise = curve x
                where x = fromIntegral p


greenpoints :: RealFloat a => a -> a -> Int -> [a] 
greenpoints t l n = map round2dp $ awards t l n

