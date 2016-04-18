LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := pvrsrvinit.c
LOCAL_LDFLAGS := -L $(TARGET_OUT_VENDOR)/lib
ifeq ($(TARGET_BOARD_OMAP_CPU),4470)
LOCAL_LDFLAGS += -lsrv_init_SGX544_112 -lsrv_um_SGX544_112
pvrsrvinit: $(TARGET_OUT_VENDOR)/lib/libsrv_init_SGX544_112.so
pvrsrvinit: $(TARGET_OUT_VENDOR)/lib/libsrv_um_SGX544_112.so
else
LOCAL_LDFLAGS += -lsrv_init_SGX540_120 -lsrv_um_SGX540_120
pvrsrvinit: $(TARGET_OUT_VENDOR)/lib/libsrv_init_SGX540_120.so
pvrsrvinit: $(TARGET_OUT_VENDOR)/lib/libsrv_um_SGX540_120.so
endif
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE := pvrsrvinit
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

