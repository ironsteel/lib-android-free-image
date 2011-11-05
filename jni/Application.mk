# The ARMv7 is significanly faster due to the use of the hardware FPU
APP_ABI := armeabi-v7a
APP_PLATFORM := android-9
APP_OPTIM := debug
APP_CFLAGS := -DDEBUG
LOCAL_ARM_MODE := thumb

APP_MODULES := free-image
APP_CPPFLAGS += -frtti -fexceptions
APP_STL := gnustl_static

#pass the following flag into ndk-build for more build info
#NDK_LOG=1