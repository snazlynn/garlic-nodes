using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gravity : MonoBehaviour
{
    public Transform player;
    Rigidbody2D playerBody;
    public float intensity;
    private float distanceToPlayer;
    Vector2 pullForce;

    // Start is called before the first frame update
    void Start()
    {
        playerBody = player.GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Tracker.orbiting.Equals("")){
            distanceToPlayer = Vector2.Distance(player.position, transform.position);
            pullForce = (transform.position - player.position).normalized / distanceToPlayer * intensity;
            playerBody.AddForce(pullForce, ForceMode2D.Force);
        }
    }
}
