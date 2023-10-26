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

        foreach (var kvp in tracker.rotations)
        {
            tracker.rotations[kvp.Key] = GameObject.Find(kvp.Key).GetComponent<Transform>().rotation;
        }

        tracker.moonRadius = GameObject.Find("Moon").GetComponent<Transform>().position.x;
    }
}
