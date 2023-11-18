using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnMoon : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        if (!Tracker.lastScene.Equals(""))
            transform.position = new Vector3(Tracker.startPositions[Tracker.lastScene], 0f, 0f);
    }
}