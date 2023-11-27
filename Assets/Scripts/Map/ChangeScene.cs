using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    [SerializeField]
    private string scene;

    private void OnCollisionEnter2D(Collision2D col)
    {
        Debug.Log("ON COLLISION");
        SceneManager.LoadScene(scene);
        //DialogueManager.GetInstance().EnterDialogueMode();
            
        
        Tracker.lastScene = gameObject.name;

        Tracker.positions["Mercury"] = GameObject.Find("Mercury").GetComponent<Transform>().position;
        Tracker.positions["Venus"] = GameObject.Find("Venus").GetComponent<Transform>().position;
        Tracker.positions["Earth"] = GameObject.Find("Earth").GetComponent<Transform>().position;
        Tracker.positions["Mars"] = GameObject.Find("Mars").GetComponent<Transform>().position;
        Tracker.positions["Jupiter"] = GameObject.Find("Jupiter").GetComponent<Transform>().position;
        Tracker.positions["Saturn"] = GameObject.Find("Saturn").GetComponent<Transform>().position;
        Tracker.positions["Uranus"] = GameObject.Find("Uranus").GetComponent<Transform>().position;
        Tracker.positions["Neptune"] = GameObject.Find("Neptune").GetComponent<Transform>().position;
        Tracker.positions["Pluto"] = GameObject.Find("Pluto").GetComponent<Transform>().position;
    }
}