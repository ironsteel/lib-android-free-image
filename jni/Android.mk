LOCAL_PATH := $(BT_HOME)/src

include $(CLEAR_VARS)

LOCAL_MODULE := bullet-physics

MY_SOURCES := 	$(wildcard $(LOCAL_PATH)/LinearMath/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletCollision/BroadphaseCollision/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletCollision/CollisionDispatch/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletCollision/CollisionShapes/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletCollision/Gimpact/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletCollision/NarrowPhaseCollision/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletDynamics/Character/*.cpp) \
				$(wildcard $(LOCAL_PATH)/BulletDynamics/ConstraintSolver/*.cpp)	\
				$(wildcard $(LOCAL_PATH)/BulletDynamics/Dynamics/*.cpp)	\
				$(wildcard $(LOCAL_PATH)/BulletDynamics/Vehicle/*.cpp)	\
				$(wildcard $(LOCAL_PATH)/BulletSoftBody/*.cpp)				
				
LOCAL_SRC_FILES := $(MY_SOURCES:$(LOCAL_PATH)%=%)

$(info LOCAL_PATH - $(LOCAL_PATH))
$(info MY_SOURCES - $(MY_SOURCES))
$(info LOCAL_SRC_FILES - $(LOCAL_SRC_FILES))

LOCAL_ARM_MODE := arm
LOCAL_STATIC_LIBRARIES := libzip libpng   
LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%) -O3 -DANDROID_NDK -Werror
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -ldl -llog -lz -lGLESv2

include $(BUILD_STATIC_LIBRARY)
