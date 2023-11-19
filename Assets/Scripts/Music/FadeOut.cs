using System.Collections;
using UnityEngine.Audio;
using UnityEngine;

public class FadeOut : MonoBehaviour
{
    public int fadeOutTime = 10;
    public GameObject[] allTheme;
    void Start() {
        allTheme = GameObject.FindGameObjectsWithTag("PlanetTheme");
    }

    void FixedUpdate() {
        
        for (int i = 0; i < allTheme.Length; i++) {
            AudioSource theme = allTheme[i].GetComponent<AudioSource>();

            if (theme.volume > 0) {
                theme.volume = theme.volume - (Time.deltaTime / fadeOutTime + 1);
            }
        }

        Destroy(this);
    }
}
