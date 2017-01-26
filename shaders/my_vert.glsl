uniform vec2 offset;
varying vec2 vUv;

void main(){

  vUv = uv;

  // apply longitude offset
  vUv.x = vUv.x + offset.x;
  if (vUv.x > 1.0) {
    vUv.x = vUv.x - 1.0;
  }

  gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}
