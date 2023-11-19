using System.Collections;
using UnityEngine;
using UnityEngine.Audio;

public class FadeIn : MonoBehaviour
{
    public int fadeInTime = 5; //in seconds
    public GameObject bgTemp;
    public AudioSource currTheme;
    public AudioSource bg;

    void Start() {
        currTheme = GetComponent<AudioSource>(); 
        bgTemp = GameObject.FindGameObjectWithTag("bgTheme");
        bg = bgTemp.GetComponent<AudioSource>();

        //start playing planet theme at time of bg theme
        currTheme.Play();
        currTheme.time = bg.time;
    }

    void FixedUpdate () {
        if (GetComponent<AudioSource>().volume < 1) {
            GetComponent<AudioSource>().volume = GetComponent<AudioSource>().volume + (Time.deltaTime / (fadeInTime + 1));
        }
        else {
            Destroy(this);
        }
    }
}
