using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

public class DialoguePrompt : MonoBehaviour
{
    [SerializeField] private VisualElement dialoguePanel;
    private Button button;

    // Start is called before the first frame update
    void Start()
    {
        dialoguePanel = GetComponent<UIDocument>().rootVisualElement;
        button = dialoguePanel.Q<Button>("Button");
    }

    // Update is called once per frame
    void Update()
    {
        if(!Tracker.orbiting.Equals(""))
        {
            dialoguePanel.visible = true;
            button.text = "Talk to " + Tracker.orbiting;

            button.clickable.activators.Clear();
            button.RegisterCallback<MouseDownEvent>(e => MyCallback(e));
        }
        else
        {
            dialoguePanel.visible = false;
        }
    }

    void MyCallback(MouseDownEvent evt)
    {
        // button clicked
        Button b = (Button)evt.currentTarget;

        if (evt.eventTypeId == MouseDownEvent.TypeId())
        {
            SceneManager.LoadScene(Tracker.orbiting);
        }
    }

}
