using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour {
	public GameObject target;
	
    void Start(){
        gameObject.SetActive(true);
    }

    void Update(){
        transform.position = new Vector3(target.transform.position.x, target.transform.position.y, transform.position.z);
    }
}