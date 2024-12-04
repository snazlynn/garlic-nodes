using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using System.IO;

public class DialogueVariables
{
    // maps variable name to value of variable
    public static Dictionary<string, object> variables;
    public static List<string> variableKeys;
    public static bool initDict = false;

    private static char separator = System.IO.Path.DirectorySeparatorChar;
    private static TextAsset globalJSON = Resources.Load<TextAsset>($"ink_dialogue{separator}globals");
    private static Story globalVariablesStory = new Story(globalJSON.text);

    public static void setDict()
    {
        if(!initDict)
        {
            variables = new Dictionary<string, object>();
            foreach(string name in globalVariablesStory.variablesState)
            {
                object value = globalVariablesStory.variablesState[name];
                variables.Add(name, value);
                // Debug.Log("initialized global dialogue variable " + name + " = " + value);
            }
            variableKeys = new List<string>(variables.Keys);
            initDict = true;
        }
    }

    public static void VariableChanged(string name, object value)
    {
        // updates variable in dictionary
        if(variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
        // Debug.Log("variable changed " + name + " = " + value);
    }

    // loads all updated variables into ink story
    public static void VariablesToStory(Story story)
    {
        foreach(KeyValuePair<string, object> variable in variables)
        {
            story.variablesState[variable.Key] = variable.Value;
            // Debug.Log("loaded " + variable.Key + " = " + story.variablesState[variable.Key]);
            
        }
    }
}
