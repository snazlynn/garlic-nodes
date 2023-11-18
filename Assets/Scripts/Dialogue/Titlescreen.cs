using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

public class Titlescreen : MonoBehaviour
{
    private void Awake()
    {
        VisualElement root = GetComponent<UIDocument>().rootVisualElement;
        root.Q<Button>("Play").clicked += () => SceneManager.LoadScene("PlanetSelection");
        root.Q<Button>("Quit").clicked += () => Application.Quit();
    }
}
