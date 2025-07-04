## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions
## are met:
##  * Redistributions of source code must retain the above copyright
##    notice, this list of conditions and the following disclaimer.
##  * Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in the
##    documentation and/or other materials provided with the distribution.
##  * Neither the name of NVIDIA CORPORATION nor the names of its
##    contributors may be used to endorse or promote products derived
##    from this software without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ''AS IS'' AND ANY
## EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
## CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
## PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
## OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##
## Copyright (c) 2008-2025 NVIDIA Corporation. All rights reserved.

#
# Build PhysXPvdSDK
#

SET(PHYSXPVDSDK_LIBTYPE STATIC)

# this is only needed for NVTX
IF (PX_GENERATE_GPU_PROJECTS AND PX_USE_NVTX)
	SET(PHYSXPVDSDK_PLATFORM_INCLUDES
		${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES}
	)
ENDIF()

# Use generator expressions to set config specific preprocessor definitions
SET(PHYSXPVDSDK_COMPILE_DEFS 
	# Common to all configurations
	${PHYSX_ANDROID_COMPILE_DEFS};PX_PHYSX_STATIC_LIB;${PHYSX_LIBTYPE_DEFS};${PHYSXGPU_LIBTYPE_DEFS}

	$<$<CONFIG:debug>:${PHYSX_ANDROID_DEBUG_COMPILE_DEFS};>
	$<$<CONFIG:checked>:${PHYSX_ANDROID_CHECKED_COMPILE_DEFS};>
	$<$<CONFIG:profile>:${PHYSX_ANDROID_PROFILE_COMPILE_DEFS};>
	$<$<CONFIG:release>:${PHYSX_ANDROID_RELEASE_COMPILE_DEFS};>
)

IF(PX_GENERATE_GPU_STATIC_LIBRARIES)
	SET(PHYSXPVDSDK_PLATFORM_LINKED_LIBS PhysXGpu)
ENDIF()
