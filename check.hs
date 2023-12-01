import GreenPoint

answer, expect :: [Double];
expect = [4.00, 2.32, 1.68, 1.34, 1.13, 0.96, 0.78, 0.60, 0.43, 0.25]

answer = greenpoints 4 0.25 10

main::IO()
main = do 
            print answer
            print (answer == expect)

