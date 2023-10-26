using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawnPlanet : MonoBehaviour
{
    public float respawnAngle;

    // Start is called before the first frame update
    void Awake()
    {
        if (tracker.rotations[name] == Quaternion.identity)
        {
            if (name != "Earth")
                transform.RotateAround(Vector3.zero, Vector3.forward, Random.Range(0, 360));
        }
        else
            transform.rotation = tracker.rotations[name];
    }

    void Start()
    {
        if (tracker.lastScene.Equals(name))
        {
            transform.RotateAround(Vector3.zero, Vector3.forward, respawnAngle);
        }
    }
}
