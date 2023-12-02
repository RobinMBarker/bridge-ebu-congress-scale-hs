import GreenPoint

answer, expect :: [Double];
expect = [4.00, 2.32, 1.68, 1.34, 1.13, 0.96, 0.78, 0.60, 0.43, 0.25]

answer = greenpoints 4 0.25 10

ans8, exp8 :: [Double]
exp8 = [13, 7, 5, 4, 13/4, 5/2, 7/4, 1]
ans8 = awards 13 1 8

main::IO()
main = do 
            print answer
            print (answer == expect)
            print ans8
            print (ans8 == exp8)

