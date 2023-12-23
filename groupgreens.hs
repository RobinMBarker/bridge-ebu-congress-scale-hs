import System.Environment (getArgs)
import GroupAwards (groupGPs)

main::IO()
main = do 
            args <- getArgs
            let top :: Double   = read (args!!0)
            let last :: Double  = read (args!!1)
            let numPlaces:: Int = read (args!!2)
            let groups :: [Int] = map read $ drop 3 args
            print $ groupGPs top last numPlaces groups

