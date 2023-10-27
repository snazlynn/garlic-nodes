using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawnMoon : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        if (!tracker.lastScene.Equals(""))
            transform.position = new Vector3(tracker.startPositions[tracker.lastScene], 0f, 0f);
    }
}