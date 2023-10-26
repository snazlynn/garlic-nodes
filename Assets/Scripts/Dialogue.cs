using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Dialogue", menuName = "ScriptableObjects/DialogueScriptableObject", order = 1)]
public class Dialogue : ScriptableObject
{
    [SerializeField]
    public string planetName;
    [TextArea(1, 10)]
    public string[] dialogue;
}
