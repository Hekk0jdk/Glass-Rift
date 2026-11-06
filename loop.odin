package game

import rl "vendor:raylib"

// Gam lifecycle.
run :: proc() {
    // Initialization camera state.
    camera := camera_state_init()

    for !rl.WindowShouldClose()
    {
    	camera_update(&camera)

        rl.BeginDrawing()
        rl.ClearBackground(rl.BLACK)

        rl.BeginMode3D(camera_to_raylib(&camera))

        rl.DrawPlane(ZERO_VECTOR3, {10.0, 10.0}, rl.RED)

        rl.EndMode3D()

        rl.EndDrawing()
    }
}