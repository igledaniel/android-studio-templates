<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

    <!--
         ACCESS_COARSE/FINE_LOCATION permissions are needed to use the
         'MyLocation' functionality.
     -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>

    <application>

        <activity android:name="${relativePackage}.${activityClass}"
            android:label="@string/title_${simpleName}">
            <#if parentActivityClass != "">
            <meta-data android:name="android.support.PARENT_ACTIVITY"
                android:value="${parentActivityClass}" />
            </#if>
            <#if isLauncher && !(isLibraryProject!false)>
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
            </#if>

        </activity>
    </application>

</manifest>
