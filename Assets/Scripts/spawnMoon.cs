using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawnMoon : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        if (tracker.moonRadius > 0)
            transform.position = new Vector3(tracker.moonRadius, 0f, 0f);
    }
}
