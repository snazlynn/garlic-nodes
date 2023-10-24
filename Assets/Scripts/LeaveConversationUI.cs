using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.SceneManagement;

public class LeaveConversationUI : MonoBehaviour
{
    private void OnEnable() 
    {
        VisualElement root = GetComponent<UIDocument>().rootVisualElement;

        Button buttonLeave = root.Q<Button>("ButtonLeave");

        GameObject.Find("Mercury").SetActive(true);
        GameObject.Find("Venus").SetActive(true);
        GameObject.Find("Earth").SetActive(true);
        GameObject.Find("Mars").SetActive(true);
        GameObject.Find("Jupiter").SetActive(true);
        GameObject.Find("Saturn").SetActive(true);
        GameObject.Find("Uranus").SetActive(true);
        GameObject.Find("Neptune").SetActive(true);
        GameObject.Find("Pluto").SetActive(true);

        buttonLeave.clicked += () => SceneManager.LoadScene("PlanetSelection");
    }
}
