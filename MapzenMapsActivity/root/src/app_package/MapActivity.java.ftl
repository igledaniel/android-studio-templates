package ${packageName};

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.mapzen.android.graphics.MapFragment;
import com.mapzen.android.graphics.MapzenMap;
import com.mapzen.android.graphics.OnMapReadyCallback;

public class ${activityClass} extends AppCompatActivity implements OnMapReadyCallback {

    private static final int PERMISSIONS_REQUEST_CODE = 1;
    private static final int NUMBER_OF_PERMISSIONS = 1;

    private MapzenMap mapzenMap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
        // Obtain the MapFragment and get notified when the map is ready to be used.
        MapFragment mapFragment = (MapFragment) getSupportFragmentManager().findFragmentById(
                R.id.map_fragment);
        mapFragment.getMapAsync(this);
    }


    /**
     * This callback is triggered when the map is ready to be used. It is where
     * we can add markers and lines, listeners, or move the camera/adjust the
     * zoom.
     */
     @Override
    public void onMapReady(MapzenMap mapzenMap) {
        this.mapzenMap = mapzenMap;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            checkRuntimePermissions();
        } else {
            initializeMap();
        }
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions,
                                                     int[] grantResults) {
        switch (requestCode) {
            case PERMISSIONS_REQUEST_CODE:
                if (grantResults.length == NUMBER_OF_PERMISSIONS
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    initializeMap();
                }
                break;
            default:
                break;
        }
    }


    private void initializeMap() {
        mapzenMap.setMyLocationEnabled(true);
    }

    private void checkRuntimePermissions() {
        if (permissionNotGranted()) {
            requestPermission();
        } else {
            initializeMap();
        }
    }

    private boolean permissionNotGranted() {
        return (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED);
    }

    private void requestPermission() {
        ActivityCompat.requestPermissions(this, new String[] {
                Manifest.permission.ACCESS_FINE_LOCATION
        }, PERMISSIONS_REQUEST_CODE);
    }
}
