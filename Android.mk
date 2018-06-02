#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
                   src/setkey_fileio/setkey_fileio.c  \
        	   src/setkey_fileio/rtnl_socket.c  \
		   src/setkey_fileio/setkey_xfrm.c  \
		   src/setkey_fileio/setkey_xfrm_parse.c  \
		   src/setkey_fileio/utils_xfrm.c 

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH) \
        $(LOCAL_PATH)/src/setkey_fileio  \



LOCAL_SHARED_LIBRARIES := libcutils libcrypto
LOCAL_CFLAGS := -DANDROID_CHANGES -DHAVE_CONFIG_H
LOCAL_CFLAGS += -Wno-sign-compare -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wall

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
LOCAL_CFLAGS += -DINIT_ENG_BUILD
endif
LOCAL_MODULE := libipsec_ims
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
include $(MTK_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
                   src/setkey_fileio/setkey_fileio.c  \
        	   src/setkey_fileio/rtnl_socket.c  \
		   src/setkey_fileio/setkey_xfrm.c  \
		   src/setkey_fileio/setkey_xfrm_parse.c  \
		   src/setkey_fileio/utils_xfrm.c   \

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH) \
        $(LOCAL_PATH)/src/setkey_fileio  \



LOCAL_SHARED_LIBRARIES := libcutils libcrypto liblog

LOCAL_CFLAGS := -DANDROID_CHANGES -DHAVE_CONFIG_H
LOCAL_CFLAGS += -Wno-sign-compare -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wall
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
LOCAL_CFLAGS += -DINIT_ENG_BUILD
endif

LOCAL_MODULE := libipsec_ims_shr
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
include $(MTK_SHARED_LIBRARY)


include $(CLEAR_VARS)


LOCAL_SRC_FILES := \
                   test.c 



LOCAL_MODULE := test_xfrm

LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libc libcutils liblog libipsec_ims_shr


LOCAL_C_INCLUDES := $(LOCAL_PATH)/src     \
                     $(LOCAL_PATH)/src/setkey_fileio  


include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)



LOCAL_SRC_FILES := \
                   src/ipsec_rule_monitor/ipxfrm.cpp   \
		   src/ipsec_rule_monitor/xfrm_state.cpp \
		   src/ipsec_rule_monitor/xfrm_policy.cpp \
		   src/ipsec_rule_monitor/ipsec_multilayer.cpp  \
		   src/ipsec_rule_monitor/xfrm_forward.cpp  \
		   src/ipsec_rule_monitor/netutils_wrapper_interface.cpp

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
LOCAL_CFLAGS += -DINIT_ENG_BUILD
endif

LOCAL_MODULE := ipsec_mon

LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libc libcutils liblog libforkexecwrap

LOCAL_SHARED_LIBRARIES += libipsec_ims_shr

LOCAL_C_INCLUDES := $(LOCAL_PATH)/src     \
                     $(LOCAL_PATH)/src/ipsec_rule_monitor/include
LOCAL_CFLAGS := -Wall
LOCAL_CFLAGS += -DMOBIKE
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
LOCAL_INIT_RC := ipsec_mon.rc
include $(MTK_EXECUTABLE)

include $(call first-makefiles-under,$(LOCAL_PATH)/src)

