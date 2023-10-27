using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    [SerializeField]
    private string scene;

    private void OnCollisionEnter2D(Collision2D col)
    {
            SceneManager.LoadScene(scene);
        
        tracker.lastScene = gameObject.name;

        tracker.positions["Mercury"] = GameObject.Find("Mercury").GetComponent<Transform>().position;
        tracker.positions["Venus"] = GameObject.Find("Venus").GetComponent<Transform>().position;
        tracker.positions["Earth"] = GameObject.Find("Earth").GetComponent<Transform>().position;
        tracker.positions["Mars"] = GameObject.Find("Mars").GetComponent<Transform>().position;
        tracker.positions["Jupiter"] = GameObject.Find("Jupiter").GetComponent<Transform>().position;
        tracker.positions["Saturn"] = GameObject.Find("Saturn").GetComponent<Transform>().position;
        tracker.positions["Uranus"] = GameObject.Find("Uranus").GetComponent<Transform>().position;
        tracker.positions["Neptune"] = GameObject.Find("Neptune").GetComponent<Transform>().position;
        tracker.positions["Pluto"] = GameObject.Find("Pluto").GetComponent<Transform>().position;
    }
}