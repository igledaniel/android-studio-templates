<?xml version="1.0"?>
<recipe>
    <dependency mavenUrl="com.mapzen:mapzen-android-sdk:1.1.0" />
    <dependency mavenUrl="com.android.support:appcompat-v7:${targetApi}.+" />

    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <instantiate from="root/res/layout/activity_map.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <merge from="root/res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <merge from="root/res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

    <instantiate from="root/src/app_package/MapActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <merge from="root/debugRes/values/mapzen.xml.ftl"
             to="${escapeXmlAttribute(debugResOut)}/values/mapzen.xml" />

    <merge from="root/releaseRes/values/mapzen.xml.ftl"
             to="${escapeXmlAttribute(releaseResOut)}/values/mapzen.xml" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <!-- Display the API key instructions. -->
    <open file="${escapeXmlAttribute(debugResOut)}/values/mapzen.xml" />
</recipe>
