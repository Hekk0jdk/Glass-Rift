package game

import rl "vendor:raylib"
import "core:math"

WALK_SPEED :: 4.0
RUN_SPEED  :: 8.0
MOUSE_SENS :: 0.002

CameraState :: struct {
    pos:   rl.Vector3,
    yaw:   f32,
    pitch: f32,
}

camera_state_init :: proc() -> CameraState {
    return CameraState{
        pos   = {0.0, 1.8, 2.0},
        yaw   = 0.0,
        pitch = 0.0,
    }
}

camera_update :: proc(camera: ^CameraState) {
    delta := rl.GetMouseDelta()
    camera.yaw += delta.x * MOUSE_SENS
    camera.pitch -= delta.y * MOUSE_SENS

    camera.pitch = clamp(camera.pitch, -1.5, 1.5)
    forward := calculate_forward(camera)

    right := rl.Vector3{ math.cos(camera.yaw), 0, math.sin(camera.yaw) }

    speed: f32 = WALK_SPEED
    if rl.IsKeyDown(.LEFT_SHIFT) {
        speed = RUN_SPEED
    }

    move := rl.Vector3{0, 0, 0}
    if rl.IsKeyDown(.W) { move += forward }
    if rl.IsKeyDown(.S) { move -= forward }
    if rl.IsKeyDown(.D) { move += right }
    if rl.IsKeyDown(.A) { move -= right }

    if rl.Vector3Length(move) > 0 {
        move = rl.Vector3Normalize(move)
        camera.pos += move * speed * rl.GetFrameTime()
    }
}

camera_to_raylib :: proc(camera: ^CameraState) -> rl.Camera3D {
    forward := calculate_forward(camera)
    return rl.Camera3D{
        position   = camera.pos,
        target     = camera.pos + forward,
        up         = {0, 1, 0},
        fovy       = 90.0,
        projection = .PERSPECTIVE,
    }
}

calculate_forward :: proc(camera: ^CameraState) -> rl.Vector3 {
    return rl.Vector3{
        math.cos(camera.pitch) * math.sin(camera.yaw),
        math.sin(camera.pitch),
        -math.cos(camera.pitch) * math.cos(camera.yaw),
    }
}
