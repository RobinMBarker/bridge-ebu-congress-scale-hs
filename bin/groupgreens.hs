import System.Environment (getArgs)
import GroupAwards (groupGPs)

main::IO()
main = do 
            args <- getArgs
            let top         = read (args!!0) :: Double
            let lst         = read (args!!1) :: Double
            let numPlaces   = read (args!!2) :: Int
            let groups  = map read $ drop 3 args :: [Int]
            print $ groupGPs top lst numPlaces groups

