package com.pocketpills.advertisingid.flutter_advertising_id

import com.google.android.gms.ads.identifier.AdvertisingIdClient
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.reactivex.Observable
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.functions.Consumer
import io.reactivex.schedulers.Schedulers

class FlutterAdvertisingIdPlugin(private val registrar: Registrar) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_advertising_id")
            channel.setMethodCallHandler(FlutterAdvertisingIdPlugin(registrar))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getAdvertisingId" -> {
                Observable.fromCallable { AdvertisingIdClient.getAdvertisingIdInfo(registrar.context()).id }
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe(Consumer<String> {
                            val adId = it
                            result.success("${adId}")
                        }, Consumer<Throwable> {
                            // nothing
                            result.error("", "", null)
                        })
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
