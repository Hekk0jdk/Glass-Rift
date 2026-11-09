package game

import rl "vendor:raylib"

draw_hud :: proc() {

    center := rl.Vector2{
        f32(rl.GetScreenWidth()) / 2,
        f32(rl.GetScreenHeight()) / 2,
    }
    rl.DrawLineV(center - {8, 0}, center - {3, 0}, rl.WHITE)
    rl.DrawLineV(center + {3, 0}, center + {8, 0}, rl.WHITE)
    rl.DrawLineV(center - {0, 8}, center - {0, 3}, rl.WHITE)
    rl.DrawLineV(center + {0, 3}, center + {0, 8}, rl.WHITE)

    rl.DrawText(rl.TextFormat("FPS: %d", rl.GetFPS()), 10, 10, 20, rl.YELLOW)
}
