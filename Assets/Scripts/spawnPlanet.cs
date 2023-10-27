using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawnPlanet : MonoBehaviour
{
    public float respawnAngle;

    // Start is called before the first frame update

    void Start()
    {
        if (tracker.positions[name] == Vector3.zero){
            if (name != "Earth")
                transform.RotateAround(Vector3.zero, Vector3.forward, Random.Range(0, 360));
            else
                transform.RotateAround(Vector3.zero, Vector3.forward, -10);
        }
        else{
            transform.position = tracker.positions[name];
        }
        if (tracker.lastScene.Equals(name)){
            transform.RotateAround(Vector3.zero, Vector3.forward, respawnAngle);
        }
    }
}