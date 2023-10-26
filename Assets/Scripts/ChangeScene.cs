using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    [SerializeField]
    private string[] scenes;
    public int sceneIndex = 0;
    public int dateAffinityReq;

    private void OnCollisionEnter2D(Collision2D col)
    {
        if (gameObject.GetComponent<affinity>().val >= dateAffinityReq){
            SceneManager.LoadScene(scenes[scenes.Length+1]);
        }
        else{
            SceneManager.LoadScene(scenes[sceneIndex]);
        }
        gameObject.GetComponent<spawnPlanet>().lastScene = true;
        //gameObject.SetActive(false);
    }
}
