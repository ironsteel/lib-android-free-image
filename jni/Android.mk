LOCAL_PATH := $(FREEIMAGE_ROOT)/Source

include $(CLEAR_VARS)

LOCAL_MODULE := free-image

LOCAL_C_INCLUDES := $(LOCAL_PATH)/Metadata \
					$(LOCAL_PATH)/DeprecationManager \
					$(LOCAL_PATH)/OpenEXR/IlmImf \
					$(LOCAL_PATH)/OpenEXR/Imath \
					$(LOCAL_PATH)/OpenEXR/Iex \
					$(LOCAL_PATH)/OpenEXR/Half \
					$(LOCAL_PATH)/OpenEXR/IlmThread 
					
MY_SOURCES := 	$(wildcard $(LOCAL_PATH)/LibJPEG/*.c) \
				$(wildcard $(LOCAL_PATH)/LibPNG/*.c) \
				$(wildcard $(LOCAL_PATH)/FreeImage/*.cpp) \
				$(wildcard $(LOCAL_PATH)/DeprecationManager/*.cpp) \
				$(wildcard $(LOCAL_PATH)/Metadata/*.cpp) \
				$(wildcard $(LOCAL_PATH)/FreeImageToolkit/*.cpp) 

#ignore these platform specific source files
MY_SOURCES := $(subst $(LOCAL_PATH)/LibJPEG/jmemdos.c,,$(MY_SOURCES))
MY_SOURCES := $(subst $(LOCAL_PATH)/LibJPEG/jmemdosa.c,,$(MY_SOURCES))
MY_SOURCES := $(subst $(LOCAL_PATH)/LibJPEG/jmemmac.c,,$(MY_SOURCES))
MY_SOURCES := $(subst $(LOCAL_PATH)/LibPNG/pngvalid.c,,$(MY_SOURCES))

LOCAL_SRC_FILES := $(MY_SOURCES:$(LOCAL_PATH)%=%)

LOCAL_CFLAGS += -DFREEIMAGE_LIB=1 -DPNG_STATIC=1 -DSTDC_HEADERS=1 

LOCAL_ARM_MODE := arm

$(info ***************BUILDING free-image ***************)

include $(BUILD_STATIC_LIBRARY)
