import System.Environment (getArgs)
import GreenPoint (greenpoints)


main::IO()
main = do 
            ss <- getArgs
            print $ greenpoints (read (ss!!0)) (read (ss!!1)) (read (ss!!2))

