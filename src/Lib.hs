module Lib
    ( html_, h1_, p_
    ) where

newtype Html = Html String deriving Show
newtype Structure = Structure String deriving Show

-- append one structure to another like <> with strings
append_ :: Structure -> Structure -> Structure
append_ (Structure str1) (Structure str2) = Structure (str1 <> str2)

render_ :: Html -> String
render_ (Html str) = str

el :: String -> String -> String
el tag content = 
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

h1_ :: String -> String
h1_ = el "h1"

p_ :: String -> Structure
p_ = Structure . el "p"

body_ :: String -> String
body_ = el "body"

style_ :: String -> String
style_ = el "style"

headEl_ :: String -> String
headEl_ = el "head"

head_ :: String -> String -> String
head_ title style = headEl_ $ title_ title <> style_ style

title_ :: String -> String
title_ = el "title"

html_ :: String -> String -> String -> String
html_ title style bodyContent = "<!DOCTYPE html>\n<html>" <> head_ title style <> body_ bodyContent <>  "</html>"

