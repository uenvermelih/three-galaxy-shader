varying vec3 vColor;

void main()
        {
            // Disc pattern
            // float strength = distance(gl_PointCoord, vec2(0.5));
            // strength = step(0.5, strength);
            // strength = 1.0 - strength;

            //Fade out disc
            float strength = distance(gl_PointCoord, vec2(0.5));
            strength = 0.5 - strength;

            //Final color
            vec3 color = mix(vec3(0.0), vColor, strength);

            gl_FragColor = vec4(vec3(color), 1.0);
        }