package main

import "core:fmt"
import rl "vendor:raylib"

ZERO_VECTOR3 :: rl.Vector3{0, 0, 0}
ZERO_VECTOR2 :: rl.Vector2{0, 0}

main :: proc() {
    // Init game window with sizes.
    rl.InitWindow(800, 450, "Glass-Rift")
    rl.SetTargetFPS(60)
    rl.DisableCursor()

    // Create game camera.
    camera := rl.Camera{
        position   = {0.0, 1.8, 2.0}, // Y set to 180 cm.
        target     = ZERO_VECTOR3,
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
        rl.DrawPlane(ZERO_VECTOR3, {10.0, 10.0}, rl.RED)
        rl.EndMode3D()
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
