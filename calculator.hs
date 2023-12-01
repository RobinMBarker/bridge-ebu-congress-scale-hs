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

round2dp :: RealFrac a => a -> a
round2dp x = (fromInteger (round (x*100)))/100

awards :: RealFloat a => a -> a -> Int -> [a]
awards top last n   | n <= 2    = take n [top, last]
                    | otherwise = map (last +) $ map award [1..n]
    where   n_ = fromIntegral n
            l = (sqrt (n_/2)) - 2
            k = (top-last)*(l+1)
            x = (n_-l)/2
            y = k/(x + l)
            award p | p_ > x    = y * (n_ - p_)/(n_ - x)
                    | otherwise = k / (p_ + l)
                where p_ = fromIntegral p


answer, expect :: [Double];
expect = [4.00, 2.32, 1.68, 1.34, 1.13, 0.96, 0.78, 0.60, 0.43, 0.25]

answer = map round2dp $ awards 4 0.25 10

main::IO()
main = do 
            print answer
            print (answer == expect)

