{-# LANGUAGE OverloadedStrings #-}
import Hakyll

main :: IO ()
main = hakyll $ do
  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  match ("images/*" .||. "keys/*" .||. "keybase.txt") $ do
    route   idRoute
    compile copyFileCompiler

  match "templates/*" $ compile templateCompiler

  match "index.markdown" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls
