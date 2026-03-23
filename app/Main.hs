module Main (main) where

import Lib

main :: IO ()
main = do
  putStrLn ""
  putStrLn ""
  putStrLn $ html_ "Title" "h1 {color: green}" (h1_ "Hello" <> p_ "This is a paragraph")