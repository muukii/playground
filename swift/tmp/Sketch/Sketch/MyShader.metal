//
//  MyShader.metal
//  Sketch
//
//  Created by muukii on 2019/04/21.
//  Copyright © 2019 muukii. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex(
                           const device packed_float3 *vertex_array [[buffer(0)]],
                           unsigned int vid [[vertex_id]]) {
  return float4(vertex_array[vid], 1.0);
}
