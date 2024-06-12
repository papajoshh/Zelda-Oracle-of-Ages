shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float speed = 0.1;
uniform float amplitudeX = 0.05;
uniform float ampltiudeY = 0.05;
uniform float frequency = 10.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    float time = TIME * speed;

    // Aplicar la distorsión vertical
	uv.x += sin(uv.y * frequency + time) * amplitudeX;
    uv.y += sin(uv.x * frequency + time) * ampltiudeY;

    // Obtener el color del texel con la distorsión aplicada
    vec4 color = texture(SCREEN_TEXTURE, uv);
    COLOR = color;
}