shader_type canvas_item;

uniform float radius : hint_range(0.0, 100.0) = 16.0;

void fragment() {
    vec2 size = vec2(1.0); // Normalized UV space (0-1)
    vec2 uv = UV;

    // Abstand zur nächsten Ecke (links/rechts, oben/unten)
    vec2 corner = min(uv, 1.0 - uv);

    // Wenn Ecke außerhalb des Radius -> verwerfen
    if (corner.x < radius / size.x && corner.y < radius / size.y) {
        float dist = length(corner - vec2(radius / size.x, radius / size.y));
        if (dist > radius / size.x) {
            discard; // Pixel außerhalb der Rundung wird unsichtbar
        }
    }

    COLOR = texture(TEXTURE, UV);
}
