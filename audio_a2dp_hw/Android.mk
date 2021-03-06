LOCAL_PATH := $(call my-dir)

# Audio A2DP shared library for target
# ========================================================
include $(CLEAR_VARS)

ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
	LOCAL_CFLAGS += -DSAMPLE_RATE_48K
endif

LOCAL_SRC_FILES := \
	audio_a2dp_hw.c

LOCAL_C_INCLUDES += \
	. \
	$(LOCAL_PATH)/../ \
	$(LOCAL_PATH)/../utils/include

LOCAL_CFLAGS += -std=c99 $(bdroid_CFLAGS)

LOCAL_MODULE := audio.a2dp.default
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SHARED_LIBRARIES := libcutils liblog libutils
LOCAL_STATIC_LIBRARIES := libosi

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)