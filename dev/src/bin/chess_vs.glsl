// Copyright (c) 2016 The vulkano developers
// Licensed under the Apache License, Version 2.0
// <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT
// license <LICENSE-MIT or http://opensource.org/licenses/MIT>,
// at your option. All files in the project carrying such
// notice may not be copied, modified, or distributed except
// according to those terms.

#version 450

#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_450pack : enable

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 normal;

layout(location = 0) out vec3 v_normal;
layout(location = 1) out vec3 base_color;
layout(location = 2) out vec3 frag_pos;
layout(location = 3) out vec3 view_pos;

layout(push_constant) uniform FigureColor {
	vec3 col;
} m_color;

layout(set = 0, binding = 0) uniform Data {
    mat4 world;
    mat4 view;
    mat4 proj;
	vec3 camera;
} uniforms;

void main() {
    mat4 worldview = uniforms.view * uniforms.world;

	gl_Position = uniforms.proj * uniforms.view * uniforms.world * vec4(position, 1.0);
	frag_pos = vec3(uniforms.world * vec4(position, 1.0f));
	v_normal = normal;

	base_color = m_color.col;
	view_pos = uniforms.camera;

}