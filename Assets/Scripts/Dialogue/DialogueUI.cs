using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class DialogueUI : MonoBehaviour
{
    private void OnEnable()
    {
        VisualElement root = GetComponent<UIDocument>().rootVisualElement;

        Label name = root.Q<Label>("Name");
        Label speech = root.Q<Label>("Speech");

        Button option1 = root.Q<Button>("Option1");
        Button option2 = root.Q<Button>("Option2");
        Button option3 = root.Q<Button>("Option3");

        option1.style.display = DisplayStyle.None;
        option2.style.display = DisplayStyle.None;
        option3.style.display = DisplayStyle.None;

        FindObjectOfType<DialogueManager>().StartDialogue(name, speech, option1, option2, option3);
    }
}
