package game

import "core:fmt"
import rl "vendor:raylib"

main :: proc() {
    // Init game window with sizes.
    rl.InitWindow(800, 450, "Glass-Rift")
    defer rl.CloseWindow()

    rl.SetTargetFPS(60)
    rl.DisableCursor()

    run()
}
