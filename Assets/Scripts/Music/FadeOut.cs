using System.Collections;
using UnityEngine.Audio;
using UnityEngine;

public class FadeOut : MonoBehaviour
{
    public int fadeOutTime = 1;
    public GameObject theme;
    public AudioSource p;


    void FixedUpdate() {
        theme = GameObject.Find("pMusic");
        if (theme) {
            p = theme.GetComponent<AudioSource>();

            if (p.volume > 0) {
                p.volume = p.volume - (Time.deltaTime / fadeOutTime);
            }
            else {
                Destroy(GameObject.Find("pMusic"));
                Destroy(this);
            }
        }
        else {
            Destroy(this);
        }
    }
}
