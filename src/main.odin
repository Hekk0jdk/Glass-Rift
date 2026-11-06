package main

import "core:fmt"
import rl "vendor:raylib"

main :: proc() {
    // Init game window with sizes.
    rl.InitWindow(800, 450, "Glass-Rift")
    rl.SetTargetFPS(60);

    // Create game camera.
    camera := rl.Camera{
        position   = {0.0, 0.0, 2.0},
        target     = {2.0, 2.0, 2.0},
        up         = {0.0, 1.0, 0.0},
        fovy       = 45.0,
        projection = .PERSPECTIVE,
    }

    // Base game cycle while window is opened.
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.BeginMode3D(camera)
        rl.DrawCube({2.0, 2.0, 2.0}, 1, 1, 1, rl.RED)
        rl.EndMode3D()
        rl.EndDrawing()

        // Keyboard keys for player movement.
        if rl.IsKeyDown(.RIGHT) {
            camera.position.x += 0.1
            camera.target.x += 0.1
        }
        if rl.IsKeyDown(.LEFT) {
            camera.position.x -= 0.1
            camera.target.x -= 0.1
        }
    }

    rl.CloseWindow()
}