/*
	This file modified by Avery Dibble with permission of author.
	Copyright 2011-2019 Daniel S. Buckstein

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

/*
	animal3D SDK: Minimal 3D Animation Framework
	By Daniel S. Buckstein
	
	passPhongAttribs_transform_vs4x.glsl
	Transform position attribute and pass attributes related to Phong shading 
		model down the pipeline.
*/

#version 410

// ****TO-DO: 
//	1) declare separate uniforms for MV and P matrices
//	2) transform object-space position to eye-space
//	3) transform eye-space position to clip space, store as output
//	4) declare normal attribute
//		-> look in 'a3_VertexDescriptors.h' for the correct location index
//	5) declare normal MV matrix
//	6) transform object-space normal to eye-space using the correct matrix
//	7) declare texcoord attribute
//	8) declare varyings for lighting data
//	9) copy lighting data to varyings

layout (location = 0) in vec4 aPosition;
layout (location = 2) in mat4 aNormal;
layout (location = 8) in vec2 aTexCoord;
uniform mat4 uMV;
uniform mat4 uP;

out vec4 clipSpace;
out vec2 texCoord0;

uniform vec4 uLightPos;
uniform vec4 uLightColor;
uniform vec4 uLightSz;
uniform float uLightCt;

out vec4 lightPos;
out vec4 lightColor;
out vec4 lightSz;
out float lightCt;
void main()
{
	lightPos = uLightPos;
	lightColor = uLightColor;
	lightSz = uLightSz;
	lightCt = uLightCt;
	gl_Position = uMV * aPosition;
	gl_Position = uP * gl_Position;
	texCoord0 = aTexCoord;

	mat4 normalSpace = uMV * aNormal;
	clipSpace = normalSpace * aPosition;
	//clipSpace = suP * clipSpace;
}