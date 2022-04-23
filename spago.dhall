{ name = "purescript-nanoid"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "foldable-traversable"
  , "maybe"
  , "prelude"
  , "psci-support"
  , "random"
  , "strings"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, license = "MIT"
, repository = "https://github.com/vycdev/purs-nanoid"
}
