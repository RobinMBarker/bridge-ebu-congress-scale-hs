import System.Environment (getArgs)
import GreenPoint (greenpoints)


main::IO()
main = do 
            args <- getArgs
            let top         = read (args!!0) :: Double
            let lst         = read (args!!1) :: Double
            let numPlaces   = read (args!!2) :: Int
            print $ greenpoints top lst numPlaces
