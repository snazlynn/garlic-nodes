using System.Collections;
using UnityEngine;
using UnityEngine.Audio;

public class FadeIn : MonoBehaviour
{
    public int fadeInTime = 3;
    public GameObject bgTemp;
    public AudioSource currTheme;
    public AudioSource bg;

    void Start() {
        currTheme = GetComponent<AudioSource>(); 
        bgTemp = GameObject.FindGameObjectWithTag("bgTheme");
        bg = bgTemp.GetComponent<AudioSource>();
    }

    void FixedUpdate () {
        //start playing planet theme at time of bg theme
        currTheme.Play();
        currTheme.time = bg.time;
        if (GetComponent<AudioSource>().volume < 1) {
            GetComponent<AudioSource>().volume = GetComponent<AudioSource>().volume + (Time.deltaTime / (fadeInTime + 1));
            DontDestroyOnLoad(currTheme);
        }
        else {
            Destroy(this);
        }
    }
}
