package com.example.iraqi_chemists_syndicate_law

import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)

        val data: Uri? = intent.data
        if (data != null && data.path?.contains("/reset-password") == true) {
            val email = data.getQueryParameter("email")
            val token = data.getQueryParameter("token")

            // ابعتيهم لـ Flutter عن طريق MethodChannel أو SharedPreferences أو أي طريقة بتستخدميها
        }
    }
}
