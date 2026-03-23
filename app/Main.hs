module Main (main) where

import Lib

main :: IO ()
main = do
  putStrLn ""
  putStrLn ""
  putStrLn $ render_ $ html_ "Title" "h1 {color: green}" (append_ (h1_ "Hello") (p_ "This is a paragraph"))