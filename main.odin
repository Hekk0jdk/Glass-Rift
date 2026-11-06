package main

import "core:fmt"
import rl "vendor:raylib"

main :: proc() {
    // Init game window with sizes.
    rl.InitWindow(800, 450, "Glass-Rift")
    rl.SetTargetFPS(60)
    rl.DisableCursor()

    // Create game camera.
    camera := rl.Camera{
        position   = {0.0, 0.0, 2.0},
        target     = {2.0, 2.0, 2.0},
        up         = {0.0, 1.0, 0.0},
        fovy       = 45.0,
        projection = .PERSPECTIVE,
    }

    // Base game cycle while window is opened.
    for !rl.WindowShouldClose()
    {
    	rl.UpdateCamera(&camera, rl.CameraMode.FIRST_PERSON);

        rl.BeginDrawing()
        rl.ClearBackground(rl.BLACK)

        rl.BeginMode3D(camera)
        rl.DrawCube({2.0, 2.0, 2.0}, 1, 1, 1, rl.RED)
        rl.EndMode3D()
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
