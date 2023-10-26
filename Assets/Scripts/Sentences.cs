using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Sentences", menuName = "ScriptableObjects/SentencesScriptableObject", order = 1)]
public class Sentences : ScriptableObject
{
    [SerializeField] public string planetName;
    [SerializeField] public ArrayLayout sentences;
}
