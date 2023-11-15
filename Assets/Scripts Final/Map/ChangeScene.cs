using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    [SerializeField]
    private string scene;

    void Update(){
        if(Input.GetKeyDown(KeyCode.Return) && Tracker.orbiting.Equals(name)){
            SceneManager.LoadScene(scene);
        }
    }
}