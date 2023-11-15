using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnPlanet : MonoBehaviour
{
    public float respawnAngle;

    // Start is called before the first frame update

    void Start()
    {
        if (Tracker.positions[name] == Vector3.zero){
            if (!name.Equals("Earth"))
                transform.RotateAround(Vector3.zero, Vector3.forward, Random.Range(0, 360));
        }
        else{
            transform.position = Tracker.positions[name];
        }
        /*if (tracker.lastScene.Equals(name)){
            transform.RotateAround(Vector3.zero, Vector3.forward, respawnAngle);
        }*/
    }
}