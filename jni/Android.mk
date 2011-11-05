LOCAL_PATH := $(OGRE)

include $(CLEAR_VARS)

LOCAL_MODULE := ogre-3d

LOCAL_C_INCLUDES :=  $(LOCAL_PATH)/include \
					 $(LOCAL_PATH)/OgreMain/include \
					 $(LOCAL_PATH)/Components/RTShaderSystem/include \
					 $(LOCAL_PATH)/RenderSystems/GLES2/include \
					 $(LOCAL_PATH)/RenderSystems/GLES2/src/GLSLES/include \
					 $(LOCAL_PATH)/RenderSystems/GLES2/include/Android \
					 $(LOCAL_PATH)/Plugins/ParticleFX/include \
					 $(BOOST_ROOT) \

MY_SOURCES := 	$(wildcard $(LOCAL_PATH)/OgreMain/src/*.cpp) \
				$(wildcard $(LOCAL_PATH)/OgreMain/src/Android/*.cpp) \
				$(wildcard $(LOCAL_PATH)/OgreMain/src/Threading/*.cpp) \
				$(wildcard $(LOCAL_PATH)/Components/RTShaderSystem/src/*.cpp) \
				$(wildcard $(LOCAL_PATH)/RenderSystems/GLES2/src/*.cpp) \
				$(wildcard $(LOCAL_PATH)/RenderSystems/GLES2/src/GLSLES/src*.cpp) \
				$(wildcard $(LOCAL_PATH)/RenderSystems/GLES2/src/Android/*.cpp) \
				$(wildcard $(LOCAL_PATH)/PlugIns/ParticleFX/src/*.cpp) 	
				
LOCAL_SRC_FILES := $(MY_SOURCES:$(LOCAL_PATH)%=%)


LOCAL_ARM_MODE := arm
LOCAL_STATIC_LIBRARIES := libzip libpng libfreeimage libft2
LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%) -O3 -DFREEIMAGE_LIB=1 -DOGRE_NONCLIENT_BUILD=1 -DANDROID_NDK -Werror -frtti -fexceptions
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -ldl -llog -lz -lGLESv2

$(info ***************INFO***************)
$(info LOCAL_PATH - $(LOCAL_PATH))
$(info LOCAL_CFLAGS - $(LOCAL_CFLAGS))
$(info LOCAL_LDLIBS - $(LOCAL_LDLIBS))
$(info ***************END INFO***********)


include $(BUILD_STATIC_LIBRARY)
