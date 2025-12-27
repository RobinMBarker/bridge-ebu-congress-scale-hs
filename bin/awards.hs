import System.Environment (getArgs)
import GreenPoint (greenmasterpoints)


main::IO()
main = do 
            args <- getArgs
            let top :: Double   = read (args!!0)
            let last :: Double  = read (args!!1)
            let numPlaces:: Int = read (args!!2)
            print $ greenmasterpoints top last numPlaces

