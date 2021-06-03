use bevy::prelude::*;

/* Constants */
const BOARD_HEIGHT: u32 = 9;
const BOARD_WIDTH: u32 = 12;
const PIXEL_SIZE: u32 = 1;
const WINDOW_SCALE_FACTOR: f32 = 50.;

/* Component Types */
struct SnakeHead;
// struct SnakeBody;
// struct Food;
struct Position {
    x: u32,
    y: u32
}
struct Materials {
    head: Handle<ColorMaterial>,
    // body: Handle<ColorMaterial>,
    // food: Handle<ColorMaterial>
}

/* Systems */
fn snake_movement(key_input: Res<Input<KeyCode>>, mut head_pos: Query<&mut Position, With<SnakeHead>>) {
    for mut pos in head_pos.iter_mut() {
        if key_input.pressed(KeyCode::Left) {
            pos.x -= 1;
        }
        if key_input.pressed(KeyCode::Right) {
            pos.x += 1;
        }
        if key_input.pressed(KeyCode::Down) {
            pos.y -= 1;
        }
        if key_input.pressed(KeyCode::Up) {
            pos.y += 1;
        }
    }
}

fn initial_setup(mut commands: Commands, mut materials: ResMut<Assets<ColorMaterial>>) {
    commands.spawn_bundle(OrthographicCameraBundle::new_2d());
    commands.insert_resource(Materials {
        head: materials.add(Color::rgb(1.0, 1.0, 1.0).into())
    });
}

fn spawn_snake(mut commands: Commands, materials: Res<Materials>) {
    commands
        .spawn_bundle(SpriteBundle {
            material: materials.head.clone(),
            sprite: Sprite::new(Vec2::new(PIXEL_SIZE as f32, PIXEL_SIZE as f32)),
            ..Default::default()
        })
        .insert(Position {
            x: BOARD_WIDTH / 2,
            y: BOARD_HEIGHT / 2
        })
        .insert(SnakeHead);
}

fn window_scaling(windows: Res<Windows>, mut q: Query<&mut Sprite>) {
    let window = windows.get_primary().unwrap();
    for mut sprite in q.iter_mut() {
        sprite.size = Vec2::new(
            PIXEL_SIZE as f32 / BOARD_WIDTH as f32 * window.width() as f32,
            PIXEL_SIZE as f32 / BOARD_HEIGHT as f32 * window.height() as f32,
        );
    }
}

fn position_translation(windows: Res<Windows>, mut q: Query<(&Position, &mut Transform)>) {
    fn convert(pos: f32, bound_window: f32, bound_game: f32) -> f32 {
        let tile_size = bound_window / bound_game;
        pos / bound_game * bound_window - (bound_window / 2.) + (tile_size / 2.)
    }
    let window = windows.get_primary().unwrap();
    for (pos, mut transform) in q.iter_mut() {
        transform.translation = Vec3::new(
            convert(pos.x as f32, window.width() as f32, BOARD_WIDTH as f32),
            convert(pos.y as f32, window.height() as f32, BOARD_HEIGHT as f32),
            0.0,
        );
    }
}

/* Entry */
fn main() {
    App::build()
        .insert_resource(WindowDescriptor {
            width: BOARD_WIDTH as f32 * WINDOW_SCALE_FACTOR,
            height: BOARD_HEIGHT as f32 * WINDOW_SCALE_FACTOR,
            ..Default::default()
        })
        .add_startup_system(initial_setup.system())
        .add_startup_stage("spawn_snake", SystemStage::single(spawn_snake.system()))
        .add_system(snake_movement.system())
        .add_system_set_to_stage(
            CoreStage::PostUpdate,
            SystemSet::new()
                .with_system(position_translation.system())
                .with_system(window_scaling.system()),
        )
        .add_plugins(DefaultPlugins)
        .run();
}
