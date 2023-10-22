using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rotateBackground : MonoBehaviour
{
    public GameObject moon;

    // Update is called once per frame
    void Update()
    {
        
        transform.RotateAround(Vector3.zero, Vector3.back, (30f*Time.deltaTime));
    }
}