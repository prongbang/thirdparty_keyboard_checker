package com.prongbang.thirdparty_keyboard_checker

import android.content.Context
import android.content.pm.ApplicationInfo
import android.provider.Settings
import android.view.inputmethod.InputMethodManager

interface ThirdPartyKeyboardChecker {
    fun check3rdKeyboard(): Boolean
}

class ThirdPartyKeyboardCheckerImpl(
    private val context: Context
) : ThirdPartyKeyboardChecker {

    override fun check3rdKeyboard(): Boolean {

        val inputMethodManager =
            context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager

        // Get installed input methods of device
        val inputMethodList = inputMethodManager.enabledInputMethodList
        for (i in 0 until inputMethodList.size) {

            // Get the user's default input method
            val imi = inputMethodList[i]
            val method = Settings.Secure.getString(
                context.contentResolver,
                Settings.Secure.DEFAULT_INPUT_METHOD
            )

            if (imi.id == method) {

                // Indicate whether application is installed in the device's system image
                val flagSystem =
                    imi.serviceInfo.applicationInfo.flags and ApplicationInfo.FLAG_SYSTEM

                if (flagSystem != 1) {
                    return true
                }

            }

        }

        return false
    }
}