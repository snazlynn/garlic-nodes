using System.Collections;
using UnityEngine.Audio;
using UnityEngine;

public class FadeOut : MonoBehaviour
{
    public int fadeOutTime = 5; //in seconds
    public GameObject[] allTheme;
    public void findAudio() {
        StartCoroutine(findAudioAndFadeOut());
    }

    IEnumerator findAudioAndFadeOut() {
        allTheme = GameObject.FindGameObjectsWithTag("PlanetTheme");

        for (int i = 0; i < allTheme.Length; i++) {
            AudioSource theme = allTheme[i].GetComponent<AudioSource>();

            while (theme.volume > 0.01f) {
                theme.volume -= Time.deltaTime / fadeOutTime;
                yield return null;
            }

            theme.volume = 0;
            theme.Stop();
        }

        Destroy(this);
    }
}
