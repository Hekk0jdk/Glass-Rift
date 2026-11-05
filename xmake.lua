add_rules("mode.debug", "mode.release")

add_requires("raylib")

target("Glass-Rift")
    set_languages("c23")
    set_kind("binary")
    add_packages("raylib")
    add_files("src/**.c")
