{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))

import Hakyll

main :: IO ()
main = hakyll $ do
    _ <- match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    _ <- match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    _ <- match "templates/*" $ compile templateCompiler

    _ <- match "keys/*" $ do
        route   idRoute
        compile copyFileCompiler

    match (list ["index.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pageCompiler
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler
