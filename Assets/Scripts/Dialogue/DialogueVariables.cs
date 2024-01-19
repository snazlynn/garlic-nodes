using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class DialogueVariables
{
    // maps variable name to value of variable
    private static Dictionary<string, object> variables;
    public static List<string> variableKeys;
    private static TextAsset globalJSON = Resources.Load<TextAsset>("ink_dialogue/globals");
    private static Story globalVariablesStory = new Story(globalJSON.text);

    public static void setDict()
    {
        variables = new Dictionary<string, object>();
        foreach(string name in globalVariablesStory.variablesState)
        {
            object value = globalVariablesStory.variablesState[name];
            variables.Add(name, value);
            //Debug.Log("initialized global dialogue variable " + name + " = " + value);
        }
        variableKeys = new List<string>(variables.Keys);
    }

    public static void VariableChanged(string name, object value)
    {
        // updates variable in dictionary
        if(variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
        Debug.Log("variable changed " + name + " = " + value);
    }

    // loads all updated variables into ink story
    public static void VariablesToStory()
    {
        foreach(KeyValuePair<string, object> variable in variables)
        {
            globalVariablesStory.variablesState[variable.Key] = variable.Value;
            
        }
    }
}
