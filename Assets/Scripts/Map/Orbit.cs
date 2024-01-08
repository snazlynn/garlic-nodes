using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class orbit : MonoBehaviour
{
    public float moonSpeed;
    public Camera cam;
    public float launchSpeed;
    private GameObject planet;
    private float planetSpeed = 0f;
    private Vector2 launchVector;
    private Vector2 rbDirection;
    private Dictionary<string, Vector2> planetDirections;
    bool clockwise;

    void Start(){
        planetDirections = new Dictionary<string, Vector2>();
        planetDirections.Add("Mercury", Vector2.zero);
        planetDirections.Add("Venus", Vector2.zero);
        planetDirections.Add("Earth", Vector2.zero);
        planetDirections.Add("Mars", Vector2.zero);
        planetDirections.Add("Jupiter", Vector2.zero);
        planetDirections.Add("Saturn", Vector2.zero);
        planetDirections.Add("Uranus", Vector2.zero);
        planetDirections.Add("Neptune", Vector2.zero);
        planetDirections.Add("Pluto", Vector2.zero);
    }

    void OnCollisionEnter2D(Collision2D col){
        GetComponent<Rigidbody2D>().velocity = Vector2.zero;
        GetComponent<Rigidbody2D>().isKinematic = true;
        planet = col.gameObject;
        clockwise = Vector2.SignedAngle(planetDirections[planet.name], rbDirection) > 0f;
        Tracker.orbiting = planet.name;
        cam.GetComponent<CameraController>().target = planet;
        planetSpeed = planet.GetComponent<Rotate>().rotateSpeed;
    }

    void Update(){
        if(!Tracker.orbiting.Equals("") && clockwise){
            launchVector = new Vector2((transform.position-planet.transform.position).normalized.y, (transform.position-planet.transform.position).normalized.x*-1f);
            Debug.DrawRay(transform.position, launchVector*10.0f, Color.green);
            transform.RotateAround(Vector3.zero, Vector3.forward, planetSpeed * Time.deltaTime);
            transform.RotateAround(planet.transform.position, Vector3.back, moonSpeed * Time.deltaTime);
        }
        else if(!Tracker.orbiting.Equals("") && !clockwise){
            launchVector = new Vector2((transform.position-planet.transform.position).normalized.y*-1f, (transform.position-planet.transform.position).normalized.x);
            Debug.DrawRay(transform.position, launchVector*10.0f, Color.green);
            transform.RotateAround(Vector3.zero, Vector3.forward, planetSpeed * Time.deltaTime);
            transform.RotateAround(planet.transform.position, Vector3.forward, moonSpeed * Time.deltaTime);
        }
        else{
            rbDirection = GetComponent<Rigidbody2D>().velocity;
        }
        planetDirections["Mercury"] = GameObject.Find("Mercury").transform.position-transform.position;
        planetDirections["Venus"] = GameObject.Find("Venus").transform.position-transform.position;
        planetDirections["Earth"] = GameObject.Find("Earth").transform.position-transform.position;
        planetDirections["Mars"] = GameObject.Find("Mars").transform.position-transform.position;
        planetDirections["Jupiter"] = GameObject.Find("Jupiter").transform.position-transform.position;
        planetDirections["Saturn"] = GameObject.Find("Saturn").transform.position-transform.position;
        planetDirections["Uranus"] = GameObject.Find("Uranus").transform.position-transform.position;
        planetDirections["Neptune"] = GameObject.Find("Neptune").transform.position-transform.position;
        planetDirections["Pluto"] = GameObject.Find("Pluto").transform.position-transform.position;
        if(Input.GetKeyDown(KeyCode.Space) && !Tracker.orbiting.Equals("")){
            GetComponent<Rigidbody2D>().isKinematic = false;
            StartCoroutine(launch());
        }
    }

    IEnumerator launch(){
        cam.GetComponent<CameraController>().target = gameObject;
        Tracker.orbiting = "";
        GetComponent<Rigidbody2D>().AddForce(launchVector*launchSpeed);
        planet.GetComponent<Collider2D>().enabled = false;
        yield return new WaitForSeconds(0.1f);
        planet.GetComponent<Collider2D>().enabled = true;
    }
}
