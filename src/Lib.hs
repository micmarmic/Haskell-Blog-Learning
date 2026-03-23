module Lib
    ( html_, render_, append_, h1_, p_
    ) where

newtype Html = Html String deriving Show
newtype Structure = Structure String deriving Show

getStructureString :: Structure -> String
getStructureString (Structure str) = str

type Style = String
type Title = String


-- append one structure to another like <> with strings
append_ :: Structure -> Structure -> Structure
append_ (Structure str1) (Structure str2) = Structure (str1 <> str2)

render_ :: Html -> String
render_ (Html str) = str

el_ :: String -> String -> String
el_ tag content = 
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">" <> "\n"

h1_ :: String -> Structure
h1_ = Structure . el_ "h1"

p_ :: String -> Structure
p_ = Structure . el_ "p"

style_ :: String -> String
style_ = el_ "style"

title_ :: String -> String
title_ = el_ "title"

html_ :: Title -> Style -> Structure -> Html
html_ title style content = 
  Html
    ("<!DOCTYPE html>\n" <> 
      (el_ "html" $
        (el_ "head" $ title_ title <> style_ style) <> 
        (el_ "body" (getStructureString content))))

    --  ((el_ "head" $ (el_ "title" title) <> (el_ "style" style)) <> (el_ "body" content)))

