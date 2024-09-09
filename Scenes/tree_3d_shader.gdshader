shader_type canvas_item;


uniform float fade_start = 0.5;  // Start fading at 1 meter
uniform float fade_end = 0.45;   // Fully invisible at 0.45 meters
uniform vec3 camera_position;

void fragment() {
    // Calculate the distance between the camera and the current pixel
    float dist = distance(camera_position.xy, SCREEN_UV);

    // Calculate the fade factor based on distance
    float fade_factor = clamp((dist - fade_end) / (fade_start - fade_end), 0.0, 1.0);

    // Set the alpha (transparency) based on the fade factor
    COLOR.a *= fade_factor;
}
