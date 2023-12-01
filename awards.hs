import System.Environment (getArgs)
import GreenPoint (greenpoints)


main::IO()
main = do 
            args <- getArgs
            let top :: Double   = read (args!!0)
            let last :: Double  = read (args!!1)
            let numPlaces:: Int = read (args!!2)
            print $ greenpoints top last numPlaces
