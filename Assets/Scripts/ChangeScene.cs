using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    [SerializeField]
    private string nextSceneName;

    private void OnCollisionEnter2D(Collision2D col)
    {
        SceneManager.LoadScene(nextSceneName);
        gameObject.GetComponent<spawnPlanet>().lastScene = true;
        gameObject.SetActive(false);
    }
}
