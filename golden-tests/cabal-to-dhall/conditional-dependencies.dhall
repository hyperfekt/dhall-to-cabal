let prelude = ./../../dhall/prelude.dhall

let types = ./../../dhall/types.dhall

in    prelude.defaults.Package
    ⫽ { cabal-version =
          prelude.v "2.0"
      , library =
          Some
          (   λ(config : types.Config)
            →       if config.impl
                         types.Compiler.GHC
                         ( prelude.unionVersionRanges
                             (prelude.thisVersion (prelude.v "8.2"))
                             (prelude.laterVersion (prelude.v "8.2"))
                         )
              
              then        if config.impl
                               types.Compiler.GHC
                               ( prelude.unionVersionRanges
                                   (prelude.thisVersion (prelude.v "8.4"))
                                   (prelude.laterVersion (prelude.v "8.4"))
                               )
                    
                    then    prelude.defaults.MainLibrary
                          ⫽ { build-depends =
                                [ { bounds =
                                      prelude.anyVersion
                                  , library-names =
                                      [ types.LibraryName.main-library ]
                                  , package =
                                      "A"
                                  }
                                , { bounds =
                                      prelude.anyVersion
                                  , library-names =
                                      [ types.LibraryName.main-library ]
                                  , package =
                                      "B"
                                  }
                                , { bounds =
                                      prelude.anyVersion
                                  , library-names =
                                      [ types.LibraryName.main-library ]
                                  , package =
                                      "C"
                                  }
                                ]
                            }
                    
                    else    prelude.defaults.MainLibrary
                          ⫽ { build-depends =
                                [ { bounds =
                                      prelude.anyVersion
                                  , library-names =
                                      [ types.LibraryName.main-library ]
                                  , package =
                                      "A"
                                  }
                                , { bounds =
                                      prelude.anyVersion
                                  , library-names =
                                      [ types.LibraryName.main-library ]
                                  , package =
                                      "B"
                                  }
                                ]
                            }
              
              else  if config.impl
                         types.Compiler.GHC
                         ( prelude.unionVersionRanges
                             (prelude.thisVersion (prelude.v "8.4"))
                             (prelude.laterVersion (prelude.v "8.4"))
                         )
              
              then    prelude.defaults.MainLibrary
                    ⫽ { build-depends =
                          [ { bounds =
                                prelude.anyVersion
                            , library-names =
                                [ types.LibraryName.main-library ]
                            , package =
                                "A"
                            }
                          , { bounds =
                                prelude.anyVersion
                            , library-names =
                                [ types.LibraryName.main-library ]
                            , package =
                                "C"
                            }
                          ]
                      }
              
              else    prelude.defaults.MainLibrary
                    ⫽ { build-depends =
                          [ { bounds =
                                prelude.anyVersion
                            , library-names =
                                [ types.LibraryName.main-library ]
                            , package =
                                "A"
                            }
                          ]
                      }
          )
      , license =
          types.License.Unspecified
      , name =
          "Name"
      , version =
          prelude.v "1"
      }