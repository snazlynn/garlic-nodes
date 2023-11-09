using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OrbitPlanet : MonoBehaviour
{

    [SerializeField] float rotateSpeed = 1.0f;

    GameObject earth;
    Transform planet;
    Rigidbody2D rb;

    // Start is called before the first frame update
    void Start()
    {
        earth = GameObject.Find("Earth");
        planet = earth.GetComponent<Transform>();
        rb = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        transform.RotateAround(planet.position, Vector3.forward, rotateSpeed * Time.deltaTime);
        Debug.Log(rb.velocity.ToString());
    }
}
