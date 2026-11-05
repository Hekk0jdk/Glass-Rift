#include <raylib.h>

int main(void)
{
    InitWindow(800, 450, "Glass-Rift");
    SetTargetFPS(60);

    Camera camera = {
        .position   = {0.0f, 0.0f, 2.0f},
        .target     = {2.0f, 2.0f, 2.0f},
        .up         = {0.0f, 1.0f, 0.0f},
        .fovy       = 45.0f,
        .projection = CAMERA_PERSPECTIVE,
    };

    while (!WindowShouldClose())
    {
        BeginDrawing();
            BeginMode3D(camera);
            DrawCube((Vector3){2.0f, 2.0, 2.0f}, 1, 1, 1, RED);
            EndMode3D();
        EndDrawing();

        if (IsKeyDown(KEY_RIGHT)) {
            camera.position.x += 0.1f;
            camera.target.x += 0.1f;
        }
        if (IsKeyDown(KEY_LEFT)) {
            camera.position.x -= 0.1f;
            camera.target.x -= 0.1f;
        }

    }

    CloseWindow();
    return 0;
}
