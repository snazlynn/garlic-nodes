using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.SceneManagement;

public class LeaveConversationUI : MonoBehaviour
{
    private void OnEnable()
    {
        VisualElement root = GetComponent<UIDocument>().rootVisualElement;

        Button buttonLeave = root.Q<Button>("ButtonLeave");

        buttonLeave.clicked += () => SceneManager.LoadScene("PlanetSelection");
    }
}
