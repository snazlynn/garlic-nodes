using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KeepBetweenScenes : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    private static KeepBetweenScenes instance = null;
    public static KeepBetweenScenes Instance {
        get {return instance; }
    }

    void Awake() {
        if (instance != null && instance != this) {
            Destroy(this.gameObject);
            return;
        }
        else {
            instance = this;
        }
        DontDestroyOnLoad(this.gameObject);
    }
}
