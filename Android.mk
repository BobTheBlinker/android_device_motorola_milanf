# Copyright (C) 2023 The LineageOS Project

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),milanf)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
