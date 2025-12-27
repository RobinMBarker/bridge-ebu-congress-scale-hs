import System.Environment (getArgs)
import GreenPoint (greenmasterpoints)


main::IO()
main = do 
            args <- getArgs
            let top         = read (args!!0)    :: Double
            let lst         = read (args!!1)    :: Double
            let numPlaces   = read (args!!2)    :: Int
            print $ (greenmasterpoints top lst numPlaces :: [Int])

