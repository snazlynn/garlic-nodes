using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Questions", menuName = "ScriptableObjects/QuestionsScriptableObject", order = 1)]
public class Questions : ScriptableObject
{
    [SerializeField] public ArrayLayout questions;
}
