uniform float uSize;
uniform float uTime;

attribute vec3 aRandom;
attribute float aScale;

varying vec3 vColor;

void main()
        {
            /**
             * Position
             */
            vec4 modelPosition = modelMatrix * vec4(position, 1.0);

            // Spin
            float angle = atan(modelPosition.x, modelPosition.z);
            float distanceToCenter = length(modelPosition.xz);
            float angleOffset = (1.0 / distanceToCenter) * uTime * 0.9;

            angle += angleOffset;
            modelPosition.x = cos(angle) * distanceToCenter;
            modelPosition.z = sin(angle) * distanceToCenter;

            //Randomness
            modelPosition.x += aRandom.x;
            modelPosition.y += aRandom.y;
            modelPosition.z += aRandom.z;


            vec4 viewPosition = viewMatrix * modelPosition;
            vec4 projectedPosition = projectionMatrix * viewPosition;
            gl_Position = projectedPosition;

            /**
             * Size
             */
            gl_PointSize = aScale * uSize;
            gl_PointSize *= ( 1.0 / - viewPosition.z ); //from three node module, point size attenuation (doesnt stay same size when zommed)

            /**
            * Color
            */
            vColor = color;
        }