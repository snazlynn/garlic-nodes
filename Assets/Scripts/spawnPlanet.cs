using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawnPlanet : MonoBehaviour
{
    public bool lastScene = false;
    public float respawnAngle;

    // Start is called before the first frame update
    void Start()
    {
        if (name != "Earth")
            transform.RotateAround(Vector3.zero, Vector3.forward, Random.Range(0, 360));
        DontDestroyOnLoad(this);
    }

    void OnEnable()
    {
        if (lastScene){
            transform.RotateAround(Vector3.zero, Vector3.forward, respawnAngle);
        }
        lastScene = false;
    }
}
