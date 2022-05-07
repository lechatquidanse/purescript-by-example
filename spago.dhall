{ name = "my-project"
, dependencies =
  [ "console", "control", "effect", "lists", "maybe", "numbers", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
