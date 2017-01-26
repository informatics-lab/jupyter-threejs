uniform sampler2D dataTexture;
uniform vec2 dataShape;
uniform sampler2D colorMap;
varying vec2 vUv;

float remapValueToRange(float val, float low1, float high1, float low2, float high2) {
  if (val < 0.1) {
    return 0.0;
  }
  return low2 + (val - low1) * (high2 - low2) / (high1 - low1);
}

void main() {

  float dataValue = texture2D(dataTexture, vUv).r;
  vec4 colorLookup = texture2D(colorMap, vec2(dataValue, 0.5));
  vec4 color = vec4(colorLookup.r, colorLookup.g, colorLookup.b, remapValueToRange(dataValue, 0.0, 1.0, 0.3, 0.8));
  gl_FragColor = color;

}