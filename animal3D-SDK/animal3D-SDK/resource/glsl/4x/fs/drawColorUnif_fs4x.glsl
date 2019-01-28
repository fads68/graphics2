/*
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
	
	drawColorUnif_fs4x.glsl
	Draw uniform solid color.
*/

#version 410

// ****TO-DO: 
//	1) declare uniform variable for color; see demo code for hints
//	2) assign uniform variable to output color

uniform vec4 uColor;

out vec4 rtFragColor;

void main()
{
	rtFragColor = uColor;
}