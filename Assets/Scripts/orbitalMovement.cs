using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    public float speed;
    bool move = false;
    Vector3 targetPos;

    // Update is called once per frame
    void Update()
    {
        if ((Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow)) && !(move) && transform.position.x > 12f){
            targetPos = transform.position + (Vector3.left * 10f);
            move = true;
        }
        
        if ((Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow)) && !(move) && transform.position.x < 92f){
            targetPos = transform.position + (Vector3.right * 10f);
            move = true;
        }

        if (move){
            transform.position = Vector3.MoveTowards(transform.position, targetPos, speed * Time.deltaTime);
        }

        if (transform.position == targetPos){
            move = false;
        }
    }
}